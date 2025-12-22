package fun.cyhgraph.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单提交DTO（简化版 - 校园点餐）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderSubmitDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long addressId;      // 地址簿ID
    private Integer payMethod;   // 付款方式：1-微信 2-支付宝
    private String remark;       // 备注
    private BigDecimal amount;   // 总金额
}
