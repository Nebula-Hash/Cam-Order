package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 主订单实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主订单状态常量
     * 1-待付款 2-已付款 3-部分完成 4-已完成 5-已取消 6-退款中 7-已退款
     */
    public static final Integer PENDING_PAYMENT = 1;    // 待付款
    public static final Integer PAID = 2;               // 已付款
    public static final Integer PARTIAL_COMPLETED = 3;  // 部分完成
    public static final Integer COMPLETED = 4;          // 已完成
    public static final Integer CANCELLED = 5;          // 已取消
    public static final Integer REFUNDING = 6;          // 退款中
    public static final Integer REFUNDED = 7;           // 已退款

    /**
     * 支付状态常量
     */
    public static final Integer PAY_STATUS_UNPAID = 0;   // 未支付
    public static final Integer PAY_STATUS_PAID = 1;     // 已支付
    public static final Integer PAY_STATUS_REFUNDED = 2; // 已退款

    private Long id;                      // 主键
    private String number;                // 订单号
    private String pickupCode;            // 统一取餐码
    private Integer status;               // 订单状态
    private Long userId;                  // 下单用户ID
    private Long addressBookId;           // 地址ID
    private String consignee;             // 收餐人
    private String phone;                 // 手机号
    private String dormitory;             // 宿舍楼号
    private LocalDateTime orderTime;      // 下单时间
    private LocalDateTime checkoutTime;   // 结账时间
    private Integer payMethod;            // 支付方式：1-微信 2-支付宝
    private Integer payStatus;            // 支付状态：0-未支付 1-已支付 2-已退款
    private BigDecimal amount;            // 总金额
    private String remark;                // 备注
    private String cancelReason;          // 取消原因
    private LocalDateTime cancelTime;     // 取消时间
    private LocalDateTime completeTime;   // 完成时间
}
