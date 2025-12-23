package fun.cyhgraph.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import fun.cyhgraph.constant.MessageConstant;
import fun.cyhgraph.context.BaseContext;
import fun.cyhgraph.dto.*;
import fun.cyhgraph.entity.*;
import fun.cyhgraph.exception.AddressBookBusinessException;
import fun.cyhgraph.exception.OrderBusinessException;
import fun.cyhgraph.exception.ShoppingCartBusinessException;
import fun.cyhgraph.mapper.*;
import fun.cyhgraph.result.PageResult;
import fun.cyhgraph.service.OrderService;
import fun.cyhgraph.vo.OrderPaymentVO;
import fun.cyhgraph.vo.OrderStatisticsVO;
import fun.cyhgraph.vo.OrderSubmitVO;
import fun.cyhgraph.vo.OrderVO;
import fun.cyhgraph.websocket.WebSocketServer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private OrderSubMapper orderSubMapper;
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private AddressBookMapper addressBookMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private WindowMapper windowMapper;
    @Autowired
    private WebSocketServer webSocketServer;

    // 保存当前订单用于支付回调
    private Order currentOrder;

    /**
     * 用户下单（校园点餐系统）
     * @param orderSubmitDTO
     * @return
     */
    @Transactional
    public OrderSubmitVO submit(OrderSubmitDTO orderSubmitDTO) {
        // 获取配送方式，默认为配送
        Integer deliveryType = orderSubmitDTO.getDeliveryType();
        if (deliveryType == null) {
            deliveryType = Order.DELIVERY_TYPE_DELIVERY;
        }
        
        // 配送费：配送6元，自取0元
        BigDecimal deliveryFee = deliveryType.equals(Order.DELIVERY_TYPE_DELIVERY) 
            ? new BigDecimal("6.00") 
            : BigDecimal.ZERO;

        // 1、查询校验地址情况（仅配送时需要）
        AddressBook addressBook = null;
        if (deliveryType.equals(Order.DELIVERY_TYPE_DELIVERY)) {
            addressBook = addressBookMapper.getById(orderSubmitDTO.getAddressId());
            if (addressBook == null) {
                throw new AddressBookBusinessException(MessageConstant.ADDRESS_BOOK_IS_NULL);
            }
        }

        // 2、查询校验购物车情况
        Long userId = BaseContext.getCurrentId().longValue();
        List<Cart> cartList = cartMapper.getByUserId(userId.intValue());
        if (cartList == null || cartList.isEmpty()) {
            throw new ShoppingCartBusinessException(MessageConstant.CART_IS_NULL);
        }

        // 3、构建主订单数据
        Order order = new Order();
        BeanUtils.copyProperties(orderSubmitDTO, order);
        order.setDeliveryType(deliveryType);
        order.setDeliveryFee(deliveryFee);
        
        // 配送时设置地址信息，自取时地址相关字段为空
        if (deliveryType.equals(Order.DELIVERY_TYPE_DELIVERY) && addressBook != null) {
            order.setAddressBookId(orderSubmitDTO.getAddressId());
            order.setPhone(addressBook.getPhone());
            order.setDormitory(addressBook.getDormitory());
            order.setConsignee(addressBook.getConsignee());
        }
        
        // 利用时间戳来生成当前订单的编号
        order.setNumber(String.valueOf(System.currentTimeMillis()));
        // 生成取餐码 (简单使用4位随机数)
        order.setPickupCode(String.format("%04d", new Random().nextInt(10000)));
        order.setUserId(userId);
        order.setStatus(Order.PENDING_PAYMENT);
        order.setPayStatus(Order.PAY_STATUS_UNPAID);
        order.setOrderTime(LocalDateTime.now());

        // 计算总金额 = 菜品金额 + 配送费
        BigDecimal totalAmount = BigDecimal.ZERO;
        for (Cart cart : cartList) {
            BigDecimal itemAmount = cart.getAmount().multiply(new BigDecimal(cart.getNumber()));
            totalAmount = totalAmount.add(itemAmount);
        }
        // 加上配送费
        totalAmount = totalAmount.add(deliveryFee);
        order.setAmount(totalAmount);

        this.currentOrder = order;

        // 4、向订单表插入1条数据
        orderMapper.insert(order);

        // 5、按窗口分组购物车数据
        Map<Integer, List<Cart>> cartByWindow = cartList.stream()
                .collect(Collectors.groupingBy(Cart::getWindowId));

        // 6、为每个窗口创建子订单和订单明细
        List<OrderDetail> allOrderDetails = new ArrayList<>();
        
        for (Map.Entry<Integer, List<Cart>> entry : cartByWindow.entrySet()) {
            Integer windowId = entry.getKey();
            List<Cart> windowCartList = entry.getValue();
            
            // 计算该窗口的金额
            BigDecimal windowAmount = BigDecimal.ZERO;
            for (Cart cart : windowCartList) {
                windowAmount = windowAmount.add(cart.getAmount().multiply(new BigDecimal(cart.getNumber())));
            }
            
            // 获取窗口名称
            Window window = windowMapper.getById(windowId);
            String windowName = window != null ? window.getName() : "未知窗口";
            
            // 创建子订单
            OrderSub orderSub = OrderSub.builder()
                    .orderId(order.getId())
                    .windowId(windowId)
                    .windowName(windowName)
                    .status(OrderSub.PENDING)
                    .amount(windowAmount)
                    .estimatedTime(15) // 默认预计15分钟
                    .build();
            orderSubMapper.insert(orderSub);
            
            // 创建该窗口的订单明细
            for (Cart cart : windowCartList) {
                OrderDetail orderDetail = new OrderDetail();
                BeanUtils.copyProperties(cart, orderDetail);
                orderDetail.setOrderId(order.getId());
                orderDetail.setOrderSubId(orderSub.getId());
                allOrderDetails.add(orderDetail);
            }
        }

        // 7、向明细表插入数据
        if (!allOrderDetails.isEmpty()) {
            orderDetailMapper.insertBatch(allOrderDetails);
        }

        // 8、清理购物车中的数据
        cartMapper.deleteByUserId(userId.intValue());

        // 9、封装返回结果
        OrderSubmitVO orderSubmitVO = OrderSubmitVO.builder()
                .id(order.getId())
                .orderNumber(order.getNumber())
                .orderAmount(order.getAmount())
                .orderTime(order.getOrderTime())
                .deliveryType(order.getDeliveryType())
                .pickupCode(order.getPickupCode())
                .build();
        return orderSubmitVO;
    }

    /**
     * 当前用户未支付订单数量
     * @return
     */
    public Integer unPayOrderCount() {
        Long userId = BaseContext.getCurrentId().longValue();
        return orderMapper.getUnPayCount(userId.intValue());
    }

    /**
     * 根据id查询订单详情
     * @param id
     * @return
     */
    public OrderVO getById(Long id) {
        Order order = orderMapper.getById(id);
        List<OrderDetail> orderDetailList = orderDetailMapper.getByOrderId(id);
        OrderVO orderVO = new OrderVO();
        BeanUtils.copyProperties(order, orderVO);
        return orderVO;
    }

    /**
     * 用户端条件分页查询历史订单
     * @param page
     * @param pageSize
     * @param status
     * @return
     */
    public PageResult userPage(int page, int pageSize, Integer status) {
        PageHelper.startPage(page, pageSize);
        OrderPageDTO orderPageDTO = new OrderPageDTO();
        orderPageDTO.setUserId(BaseContext.getCurrentId().longValue());
        orderPageDTO.setStatus(status);
        Page<Order> orderPage = orderMapper.page(orderPageDTO);

        List<OrderVO> list = new ArrayList<>();
        if (orderPage != null && orderPage.getTotal() > 0) {
            for (Order order : orderPage) {
                Long orderId = order.getId();
                List<OrderDetail> orderDetails = orderDetailMapper.getByOrderId(orderId);
                OrderVO orderVO = new OrderVO();
                BeanUtils.copyProperties(order, orderVO);
                list.add(orderVO);
            }
        }
        return new PageResult(orderPage.getTotal(), list);
    }

    /**
     * 用户根据订单id取消订单
     * @param id
     */
    public void userCancelById(Long id) throws Exception {
        Order ordersDB = orderMapper.getById(id);
        if (ordersDB == null) {
            throw new OrderBusinessException(MessageConstant.ORDER_NOT_FOUND);
        }

        // 只有待付款和已付款状态可以取消
        if (ordersDB.getStatus() > Order.PAID) {
            throw new OrderBusinessException(MessageConstant.ORDER_STATUS_ERROR);
        }

        Order order = new Order();
        order.setId(ordersDB.getId());

        // 已付款取消需要退款
        if (ordersDB.getStatus().equals(Order.PAID)) {
            order.setPayStatus(Order.PAY_STATUS_REFUNDED);
        }

        order.setStatus(Order.CANCELLED);
        order.setCancelReason("用户取消");
        order.setCancelTime(LocalDateTime.now());
        orderMapper.update(order);
    }

    /**
     * 根据订单id再来一单
     * @param id
     */
    public void reOrder(Long id) {
        Integer userId = BaseContext.getCurrentId();
        List<OrderDetail> detailList = orderDetailMapper.getByOrderId(id);
        
        List<Cart> cartList = detailList.stream().map(x -> {
            Cart cart = new Cart();
            BeanUtils.copyProperties(x, cart, "id");
            cart.setUserId(userId);
            cart.setCreateTime(LocalDateTime.now());
            return cart;
        }).toList();
        
        cartMapper.insertBatch(cartList);
    }

    /**
     * 用户支付订单
     * @param orderPaymentDTO
     * @return
     */
    public OrderPaymentVO payment(OrderPaymentDTO orderPaymentDTO) {
        // 获取当前用户
        Integer userId = BaseContext.getCurrentId();
        User user = userMapper.getById(userId);
        
        // 检查余额是否充足
        if (user.getBalance() == null || user.getBalance().compareTo(this.currentOrder.getAmount()) < 0) {
            throw new OrderBusinessException("余额不足，请先充值");
        }
        
        // 扣减余额
        int result = userMapper.deductBalance(userId, this.currentOrder.getAmount());
        if (result == 0) {
            throw new OrderBusinessException("支付失败，余额不足");
        }

        // 更新订单状态
        Integer OrderPaidStatus = Order.PAY_STATUS_PAID;
        Integer OrderStatus = Order.PAID;
        LocalDateTime checkOutTime = LocalDateTime.now();
        orderMapper.updateStatus(OrderStatus, OrderPaidStatus, checkOutTime, this.currentOrder.getId());

        // 通过websocket向客户端浏览器推送消息
        Map<String, Object> map = new HashMap<>();
        map.put("type", 1);
        map.put("orderId", this.currentOrder.getId());
        map.put("content", "订单号：" + this.currentOrder.getNumber());
        String json = JSON.toJSONString(map);
        log.info("发送来单提醒：{}", map);
        webSocketServer.sendToAllClient(json);

        OrderPaymentVO vo = new OrderPaymentVO();
        vo.setPackageStr("prepay_id=mock");
        return vo;
    }

    /**
     * 条件分页查询订单信息
     * @param orderPageDTO
     * @return
     */
    public PageResult conditionSearch(OrderPageDTO orderPageDTO) {
        PageHelper.startPage(orderPageDTO.getPage(), orderPageDTO.getPageSize());
        Page<Order> orders = orderMapper.page(orderPageDTO);
        List<OrderVO> orderVOList = getOrderVOList(orders);
        return new PageResult(orders.getTotal(), orderVOList);
    }

    /**
     * 不同状态订单数量统计
     * @return
     */
    public OrderStatisticsVO statistics() {
        Integer pendingPayment = orderMapper.countByStatus(Order.PENDING_PAYMENT);
        Integer paid = orderMapper.countByStatus(Order.PAID);
        Integer completed = orderMapper.countByStatus(Order.COMPLETED);
        Integer cancelled = orderMapper.countByStatus(Order.CANCELLED);

        return OrderStatisticsVO.builder()
                .pendingPayment(pendingPayment)
                .paid(paid)
                .processing(0) // 校园点餐暂不细分制作状态
                .completed(completed)
                .cancelled(cancelled)
                // 兼容旧字段
                .toBeConfirmed(paid)
                .confirmed(0)
                .deliveryInProgress(0)
                .build();
    }

    /**
     * 接单（确认订单开始制作）
     * @param orderConfirmDTO
     */
    public void confirm(OrderConfirmDTO orderConfirmDTO) {
        Order order = Order.builder()
                .id(orderConfirmDTO.getId().longValue())
                .status(Order.PAID) // 保持已付款状态，子订单状态在子订单中管理
                .build();
        orderMapper.update(order);
    }

    /**
     * 拒单
     * @param orderRejectionDTO
     */
    public void reject(OrderRejectionDTO orderRejectionDTO) {
        Long orderId = orderRejectionDTO.getId().longValue();
        Order orderDB = orderMapper.getById(orderId);

        if (orderDB == null || !orderDB.getStatus().equals(Order.PAID)) {
            throw new OrderBusinessException(MessageConstant.ORDER_STATUS_ERROR);
        }

        Order order = new Order();
        order.setId(orderDB.getId());
        order.setPayStatus(Order.PAY_STATUS_REFUNDED);
        order.setStatus(Order.CANCELLED);
        order.setCancelReason(orderRejectionDTO.getRejectionReason());
        order.setCancelTime(LocalDateTime.now());
        orderMapper.update(order);
    }

    /**
     * 取消订单
     * @param orderCancelDTO
     */
    public void cancel(OrderCancelDTO orderCancelDTO) {
        Long orderId = orderCancelDTO.getId().longValue();
        Order orderDB = orderMapper.getById(orderId);

        Order order = new Order();
        order.setId(orderDB.getId());
        order.setPayStatus(Order.PAY_STATUS_REFUNDED);
        order.setStatus(Order.CANCELLED);
        order.setCancelReason(orderCancelDTO.getCancelReason());
        order.setCancelTime(LocalDateTime.now());
        orderMapper.update(order);
    }

    /**
     * 完成订单（取餐完成）
     * @param id
     */
    public void complete(Long id) {
        Order orderDB = orderMapper.getById(id);
        if (orderDB == null) {
            throw new OrderBusinessException(MessageConstant.ORDER_STATUS_ERROR);
        }

        Order order = new Order();
        order.setId(orderDB.getId());
        order.setStatus(Order.COMPLETED);
        order.setCompleteTime(LocalDateTime.now());
        orderMapper.update(order);
    }

    /**
     * 用户催单
     * @param id
     */
    public void reminder(Long id) {
        Order orderDB = orderMapper.getById(id);
        if (orderDB == null) {
            throw new OrderBusinessException(MessageConstant.ORDER_NOT_FOUND);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("type", 2);
        map.put("orderId", id);
        map.put("content", "订单号：" + orderDB.getNumber());
        String json = JSON.toJSONString(map);
        log.info("客户催单：{}", map);
        webSocketServer.sendToAllClient(json);
    }

    /**
     * 抽出page.getResult()的内容
     * @param page
     * @return
     */
    private List<OrderVO> getOrderVOList(Page<Order> page) {
        List<OrderVO> orderVOList = new ArrayList<>();
        List<Order> ordersList = page.getResult();
        if (!CollectionUtils.isEmpty(ordersList)) {
            for (Order orders : ordersList) {
                OrderVO orderVO = new OrderVO();
                BeanUtils.copyProperties(orders, orderVO);
                orderVOList.add(orderVO);
            }
        }
        return orderVOList;
    }
}
