package fun.cyhgraph.mapper;

import com.github.pagehelper.Page;
import fun.cyhgraph.annotation.AutoFill;
import fun.cyhgraph.dto.WindowPageDTO;
import fun.cyhgraph.entity.Window;
import fun.cyhgraph.enumeration.OperationType;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 窗口Mapper
 */
@Mapper
public interface WindowMapper {

    /**
     * 新增窗口
     */
    @AutoFill(OperationType.INSERT)
    @Insert("INSERT INTO `window` (name, pic, description, location, status, open_time, close_time, sort, " +
            "create_user, update_user, create_time, update_time) VALUES " +
            "(#{name}, #{pic}, #{description}, #{location}, #{status}, #{openTime}, #{closeTime}, #{sort}, " +
            "#{createUser}, #{updateUser}, #{createTime}, #{updateTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Window window);

    /**
     * 根据ID查询窗口
     */
    @Select("SELECT * FROM `window` WHERE id = #{id}")
    Window getById(Integer id);

    /**
     * 根据名称查询窗口
     */
    @Select("SELECT * FROM `window` WHERE name = #{name}")
    Window getByName(String name);

    /**
     * 分页查询窗口
     */
    Page<Window> pageQuery(WindowPageDTO windowPageDTO);

    /**
     * 更新窗口
     */
    @AutoFill(OperationType.UPDATE)
    void update(Window window);

    /**
     * 删除窗口
     */
    @Delete("DELETE FROM `window` WHERE id = #{id}")
    void deleteById(Integer id);

    /**
     * 切换营业状态
     */
    @Update("UPDATE `window` SET status = IF(status = 0, 1, 0), update_time = NOW() WHERE id = #{id}")
    void toggleStatus(Integer id);

    /**
     * 查询所有营业中的窗口
     */
    @Select("SELECT * FROM `window` WHERE status = 1 ORDER BY sort ASC")
    List<Window> listOpen();

    /**
     * 查询所有窗口
     */
    @Select("SELECT * FROM `window` ORDER BY sort ASC")
    List<Window> listAll();

    /**
     * 根据窗口ID列表查询窗口
     */
    List<Window> getByIds(@Param("ids") List<Integer> ids);

    /**
     * 统计窗口下的分类数量
     */
    @Select("SELECT COUNT(*) FROM category WHERE window_id = #{windowId}")
    Integer countCategoryByWindowId(Integer windowId);

    /**
     * 统计窗口下的菜品数量
     */
    @Select("SELECT COUNT(d.id) FROM dish d JOIN category c ON d.category_id = c.id WHERE c.window_id = #{windowId}")
    Integer countDishByWindowId(Integer windowId);

    /**
     * 统计窗口下的套餐数量
     */
    @Select("SELECT COUNT(s.id) FROM setmeal s JOIN category c ON s.category_id = c.id WHERE c.window_id = #{windowId}")
    Integer countSetmealByWindowId(Integer windowId);
}
