package fun.cyhgraph.service;

import com.github.pagehelper.Page;
import fun.cyhgraph.dto.WindowDTO;
import fun.cyhgraph.dto.WindowPageDTO;
import fun.cyhgraph.entity.Window;
import fun.cyhgraph.vo.WindowVO;

import java.util.List;

/**
 * 窗口服务接口
 */
public interface WindowService {

    /**
     * 新增窗口
     */
    void add(WindowDTO windowDTO);

    /**
     * 分页查询窗口
     */
    Page<Window> pageQuery(WindowPageDTO windowPageDTO);

    /**
     * 根据ID查询窗口
     */
    WindowVO getById(Integer id);

    /**
     * 更新窗口
     */
    void update(WindowDTO windowDTO);

    /**
     * 删除窗口
     */
    void deleteById(Integer id);

    /**
     * 切换窗口营业状态
     */
    void toggleStatus(Integer id);

    /**
     * 查询所有营业中的窗口
     */
    List<Window> listOpen();

    /**
     * 查询所有窗口
     */
    List<Window> listAll();

    /**
     * 根据员工ID查询管理的窗口列表
     */
    List<Window> getByEmployeeId(Integer employeeId);
}
