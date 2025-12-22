package fun.cyhgraph.vo;

import fun.cyhgraph.entity.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.List;

/**
 * 订单视图对象（包含子订单信息）
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class OrderVO extends Order implements Serializable {

    private static final long serialVersionUID = 1L;

    private String statusText;              // 订单状态文本
    private List<OrderSubVO> orderSubList;  // 子订单列表（按窗口拆分）
}
