package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.OrderSub;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 子订单Mapper
 */
@Mapper
public interface OrderSubMapper {

    /**
     * 新增子订单
     */
    @Insert("INSERT INTO order_sub (order_id, window_id, window_name, status, amount, estimated_time) VALUES " +
            "(#{orderId}, #{windowId}, #{windowName}, #{status}, #{amount}, #{estimatedTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(OrderSub orderSub);

    /**
     * 批量新增子订单
     */
    void insertBatch(List<OrderSub> orderSubList);

    /**
     * 根据ID查询子订单
     */
    @Select("SELECT * FROM order_sub WHERE id = #{id}")
    OrderSub getById(Long id);

    /**
     * 根据主订单ID查询子订单列表
     */
    @Select("SELECT * FROM order_sub WHERE order_id = #{orderId}")
    List<OrderSub> getByOrderId(Long orderId);

    /**
     * 根据窗口ID查询子订单列表
     */
    @Select("SELECT * FROM order_sub WHERE window_id = #{windowId} ORDER BY id DESC")
    List<OrderSub> getByWindowId(Integer windowId);

    /**
     * 根据窗口ID和状态查询子订单列表
     */
    @Select("SELECT * FROM order_sub WHERE window_id = #{windowId} AND status = #{status} ORDER BY id DESC")
    List<OrderSub> getByWindowIdAndStatus(@Param("windowId") Integer windowId, @Param("status") Integer status);

    /**
     * 更新子订单状态
     */
    @Update("UPDATE order_sub SET status = #{status} WHERE id = #{id}")
    void updateStatus(@Param("id") Long id, @Param("status") Integer status);

    /**
     * 更新子订单（开始制作）
     */
    @Update("UPDATE order_sub SET status = #{status}, start_time = NOW() WHERE id = #{id}")
    void startProcessing(Long id);

    /**
     * 更新子订单（制作完成）
     */
    @Update("UPDATE order_sub SET status = #{status}, complete_time = NOW() WHERE id = #{id}")
    void completeProcessing(@Param("id") Long id, @Param("status") Integer status);

    /**
     * 更新子订单（取餐完成）
     */
    @Update("UPDATE order_sub SET status = #{status}, pickup_time = NOW() WHERE id = #{id}")
    void pickup(@Param("id") Long id, @Param("status") Integer status);

    /**
     * 统计主订单下已完成的子订单数量
     */
    @Select("SELECT COUNT(*) FROM order_sub WHERE order_id = #{orderId} AND status = 5")
    Integer countCompletedByOrderId(Long orderId);

    /**
     * 统计主订单下的子订单总数
     */
    @Select("SELECT COUNT(*) FROM order_sub WHERE order_id = #{orderId}")
    Integer countByOrderId(Long orderId);

    /**
     * 根据窗口ID统计今日订单数
     */
    @Select("SELECT COUNT(*) FROM order_sub os " +
            "JOIN orders o ON os.order_id = o.id " +
            "WHERE os.window_id = #{windowId} AND DATE(o.order_time) = CURDATE()")
    Integer countTodayByWindowId(Integer windowId);

    /**
     * 根据主订单ID删除子订单
     */
    @Delete("DELETE FROM order_sub WHERE order_id = #{orderId}")
    void deleteByOrderId(Long orderId);
}
