package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 子订单实体类（按窗口拆分）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderSub implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 子订单状态常量
     */
    public static final Integer PENDING = 2;        // 待制作
    public static final Integer PROCESSING = 3;    // 制作中
    public static final Integer READY = 4;         // 待取餐
    public static final Integer COMPLETED = 5;     // 已完成

    private Long id;                  // 主键
    private Long orderId;             // 主订单ID
    private Integer windowId;         // 窗口ID
    private String windowName;        // 窗口名称（冗余）
    private Integer status;           // 子订单状态：2-待制作 3-制作中 4-待取餐 5-已完成
    private BigDecimal amount;        // 该窗口金额
    private Integer estimatedTime;    // 预计制作时间(分钟)
    private LocalDateTime startTime;  // 开始制作时间
    private LocalDateTime completeTime; // 完成时间
    private LocalDateTime pickupTime; // 取餐时间
}
