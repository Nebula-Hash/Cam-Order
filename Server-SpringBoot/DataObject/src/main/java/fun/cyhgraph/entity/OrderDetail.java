package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单明细
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;               // 主键
    private Long orderId;          // 主订单ID
    private Long orderSubId;       // 子订单ID
    private Long dishId;           // 菜品ID
    private Long setmealId;        // 套餐ID
    private String name;           // 商品名称
    private String pic;            // 图片
    private String dishFlavor;     // 口味
    private Integer number;        // 数量
    private BigDecimal amount;     // 单价
}
