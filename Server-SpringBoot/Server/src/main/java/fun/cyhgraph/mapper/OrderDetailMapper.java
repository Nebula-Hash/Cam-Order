package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.OrderDetail;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 订单详情Mapper
 */
@Mapper
public interface OrderDetailMapper {

    /**
     * 批量插入订单详情
     */
    void insertBatch(List<OrderDetail> orderDetailList);

    /**
     * 插入单条订单详情
     */
    @Insert("INSERT INTO order_detail (order_id, order_sub_id, dish_id, setmeal_id, name, pic, dish_flavor, number, amount) VALUES " +
            "(#{orderId}, #{orderSubId}, #{dishId}, #{setmealId}, #{name}, #{pic}, #{dishFlavor}, #{number}, #{amount})")
    void insert(OrderDetail orderDetail);

    /**
     * 根据订单ID查询订单详情
     */
    @Select("SELECT * FROM order_detail WHERE order_id = #{orderId}")
    List<OrderDetail> getByOrderId(Long orderId);

    /**
     * 根据子订单ID查询订单详情
     */
    @Select("SELECT * FROM order_detail WHERE order_sub_id = #{orderSubId}")
    List<OrderDetail> getByOrderSubId(Long orderSubId);

    /**
     * 根据子订单ID删除订单详情
     */
    @Delete("DELETE FROM order_detail WHERE order_sub_id = #{orderSubId}")
    void deleteByOrderSubId(Long orderSubId);

    /**
     * 根据订单ID删除订单详情
     */
    @Delete("DELETE FROM order_detail WHERE order_id = #{orderId}")
    void deleteByOrderId(Long orderId);
}
