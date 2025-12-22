package fun.cyhgraph.vo;

import fun.cyhgraph.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 子订单视图对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderSubVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;                      // 子订单ID
    private Long orderId;                 // 主订单ID
    private Integer windowId;             // 窗口ID
    private String windowName;            // 窗口名称
    private String pickupCode;            // 取餐码（从主订单获取）
    private Integer status;               // 子订单状态
    private String statusText;            // 状态文本
    private BigDecimal amount;            // 该窗口金额
    private Integer estimatedTime;        // 预计制作时间(分钟)
    private LocalDateTime startTime;      // 开始制作时间
    private LocalDateTime completeTime;   // 完成时间
    private LocalDateTime pickupTime;     // 取餐时间
    
    private List<OrderDetail> orderDetailList; // 订单详情列表
}
