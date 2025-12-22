package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CartMapper {

    /**
     * 查找有没有和cart菜品/套餐相同的商品在当前购物车里
     * @param cart
     * @return
     */
    List<Cart> list(Cart cart);

    /**
     * 数量更新+1
     * @param cart
     */
    @Update("update cart set number = #{number} where id = #{id}")
    void updateNumberById(Cart cart);

    /**
     * 插入购物车数据
     *
     * @param shoppingCart
     */
    @Insert("insert into cart (name, user_id, window_id, dish_id, setmeal_id, dish_flavor, number, amount, pic, create_time) " +
            " values (#{name},#{userId},#{windowId},#{dishId},#{setmealId},#{dishFlavor},#{number},#{amount},#{pic},#{createTime})")
    void insert(Cart shoppingCart);

    /**
     * 清空购物车
     * @param currentId
     */
    @Delete("delete from cart where user_id = #{currentId}")
    void delete(Integer currentId);

    /**
     * 根据用户ID查询购物车
     */
    @Select("SELECT * FROM cart WHERE user_id = #{userId}")
    List<Cart> getByUserId(Integer userId);

    /**
     * 根据用户ID删除购物车
     */
    @Delete("DELETE FROM cart WHERE user_id = #{userId}")
    void deleteByUserId(Integer userId);

    void deleteByDishId(Integer dishId, String dishFlavor);

    @Delete("delete from cart where setmeal_id = #{setmealId} ")
    void deleteBySetmealId(Integer setmealId);

    void insertBatch(List<Cart> cartList);

    /**
     * 根据用户ID查询购物车（按窗口分组）
     * @param userId
     * @return
     */
    @Select("SELECT * FROM cart WHERE user_id = #{userId} ORDER BY window_id, create_time DESC")
    List<Cart> listByUserIdGroupByWindow(Integer userId);

    /**
     * 根据用户ID和窗口ID查询购物车
     */
    @Select("SELECT * FROM cart WHERE user_id = #{userId} AND window_id = #{windowId}")
    List<Cart> listByUserIdAndWindowId(@Param("userId") Integer userId, @Param("windowId") Integer windowId);
}
