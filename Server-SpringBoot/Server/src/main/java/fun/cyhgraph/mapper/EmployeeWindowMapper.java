package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.EmployeeWindow;
import fun.cyhgraph.entity.Window;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 员工-窗口关联Mapper
 */
@Mapper
public interface EmployeeWindowMapper {

    /**
     * 新增员工-窗口关联
     */
    @Insert("INSERT INTO employee_window (employee_id, window_id, create_time) VALUES (#{employeeId}, #{windowId}, NOW())")
    void insert(EmployeeWindow employeeWindow);

    /**
     * 批量新增员工-窗口关联
     */
    void insertBatch(@Param("employeeId") Integer employeeId, @Param("windowIds") List<Integer> windowIds);

    /**
     * 删除员工的所有窗口关联
     */
    @Delete("DELETE FROM employee_window WHERE employee_id = #{employeeId}")
    void deleteByEmployeeId(Integer employeeId);

    /**
     * 删除窗口的所有员工关联
     */
    @Delete("DELETE FROM employee_window WHERE window_id = #{windowId}")
    void deleteByWindowId(Integer windowId);

    /**
     * 查询员工管理的窗口ID列表
     */
    @Select("SELECT window_id FROM employee_window WHERE employee_id = #{employeeId}")
    List<Integer> getWindowIdsByEmployeeId(Integer employeeId);

    /**
     * 查询员工管理的窗口列表
     */
    @Select("SELECT w.* FROM `window` w " +
            "JOIN employee_window ew ON w.id = ew.window_id " +
            "WHERE ew.employee_id = #{employeeId} ORDER BY w.sort ASC")
    List<Window> getWindowsByEmployeeId(Integer employeeId);

    /**
     * 查询窗口的员工ID列表
     */
    @Select("SELECT employee_id FROM employee_window WHERE window_id = #{windowId}")
    List<Integer> getEmployeeIdsByWindowId(Integer windowId);

    /**
     * 检查员工是否管理某个窗口
     */
    @Select("SELECT COUNT(*) FROM employee_window WHERE employee_id = #{employeeId} AND window_id = #{windowId}")
    Integer checkEmployeeWindow(@Param("employeeId") Integer employeeId, @Param("windowId") Integer windowId);
}
