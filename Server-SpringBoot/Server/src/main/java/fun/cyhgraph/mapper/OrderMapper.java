package fun.cyhgraph.mapper;

import com.github.pagehelper.Page;
import fun.cyhgraph.dto.GoodsSalesDTO;
import fun.cyhgraph.dto.OrderPageDTO;
import fun.cyhgraph.entity.Order;
import org.apache.ibatis.annotations.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 主订单Mapper
 */
@Mapper
public interface OrderMapper {

    /**
     * 新增订单
     */
    @Insert("INSERT INTO orders (number, pickup_code, status, user_id, address_book_id, consignee, phone, dormitory, " +
            "order_time, pay_method, pay_status, amount, remark) VALUES " +
            "(#{number}, #{pickupCode}, #{status}, #{userId}, #{addressBookId}, #{consignee}, #{phone}, #{dormitory}, " +
            "#{orderTime}, #{payMethod}, #{payStatus}, #{amount}, #{remark})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Order order);

    /**
     * 根据ID查询订单
     */
    @Select("SELECT * FROM orders WHERE id = #{id}")
    Order getById(Long id);

    /**
     * 根据订单号查询订单
     */
    @Select("SELECT * FROM orders WHERE number = #{number}")
    Order getByNumber(String number);

    /**
     * 分页查询订单
     */
    Page<Order> page(OrderPageDTO orderPageDTO);

    /**
     * 更新订单
     */
    void update(Order order);

    /**
     * 更新订单状态和支付状态
     */
    @Update("UPDATE orders SET status = #{status}, pay_status = #{payStatus}, checkout_time = #{checkoutTime} WHERE id = #{id}")
    void updateStatus(@Param("status") Integer status, @Param("payStatus") Integer payStatus,
                      @Param("checkoutTime") LocalDateTime checkoutTime, @Param("id") Long id);

    /**
     * 查询用户未支付订单数量
     */
    @Select("SELECT COUNT(id) FROM orders WHERE user_id = #{userId} AND status = 1")
    Integer getUnPayCount(Integer userId);

    /**
     * 根据状态统计订单数量
     */
    @Select("SELECT COUNT(id) FROM orders WHERE status = #{status}")
    Integer countByStatus(Integer status);

    /**
     * 根据状态和下单时间查询订单
     */
    @Select("SELECT * FROM orders WHERE status = #{status} AND order_time < #{orderTime}")
    List<Order> getByStatusAndOrderTimeLT(@Param("status") Integer status, @Param("orderTime") LocalDateTime orderTime);

    /**
     * 根据条件统计金额
     */
    Double sumByMap(Map<String, Object> map);

    /**
     * 根据条件统计数量
     */
    Integer countByMap(Map<String, Object> map);

    /**
     * 获取销量Top10
     */
    List<GoodsSalesDTO> getSalesTop10(@Param("beginTime") LocalDateTime beginTime, @Param("endTime") LocalDateTime endTime);

    /**
     * 取消订单
     */
    @Update("UPDATE orders SET status = 5, cancel_reason = #{cancelReason}, cancel_time = NOW() WHERE id = #{id}")
    void cancel(@Param("id") Long id, @Param("cancelReason") String cancelReason);

    /**
     * 完成订单
     */
    @Update("UPDATE orders SET status = 4, complete_time = NOW() WHERE id = #{id}")
    void complete(Long id);

    /**
     * 生成取餐码
     */
    @Select("SELECT LPAD(IFNULL(MAX(CAST(pickup_code AS UNSIGNED)), 0) + 1, 4, '0') FROM orders WHERE DATE(order_time) = CURDATE()")
    String generatePickupCode();
}
