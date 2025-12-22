package fun.cyhgraph.service;

import fun.cyhgraph.dto.*;
import fun.cyhgraph.result.PageResult;
import fun.cyhgraph.vo.OrderPaymentVO;
import fun.cyhgraph.vo.OrderStatisticsVO;
import fun.cyhgraph.vo.OrderSubmitVO;
import fun.cyhgraph.vo.OrderVO;

public interface OrderService {
    OrderSubmitVO submit(OrderSubmitDTO orderSubmitDTO);

    Integer unPayOrderCount();

    OrderVO getById(Long id);

    PageResult userPage(int page, int pageSize, Integer status);

    void userCancelById(Long id) throws Exception;

    void reOrder(Long id);

    OrderPaymentVO payment(OrderPaymentDTO orderPaymentDTO);

    PageResult conditionSearch(OrderPageDTO orderPageDTO);

    OrderStatisticsVO statistics();

    void confirm(OrderConfirmDTO orderConfirmDTO);

    void reject(OrderRejectionDTO orderRejectionDTO);

    void cancel(OrderCancelDTO orderCancelDTO);

    void complete(Long id);

    void reminder(Long id);
}
