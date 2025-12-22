package fun.cyhgraph.vo;

import lombok.Builder;
import lombok.Data;
import java.io.Serializable;

/**
 * 订单统计VO（校园点餐系统）
 */
@Data
@Builder
public class OrderStatisticsVO implements Serializable {

    private Integer pendingPayment;     // 待付款数量
    private Integer paid;               // 已付款/待制作数量
    private Integer processing;         // 制作中数量
    private Integer completed;          // 已完成数量
    private Integer cancelled;          // 已取消数量

    // 兼容旧的字段名称（前端可能依赖）
    private Integer toBeConfirmed;      // 等于 paid
    private Integer confirmed;          // 等于 processing  
    private Integer deliveryInProgress; // 校园点餐不需要，设为0
}
