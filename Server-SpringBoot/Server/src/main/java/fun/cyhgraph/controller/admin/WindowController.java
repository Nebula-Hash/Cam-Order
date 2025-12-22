package fun.cyhgraph.controller.admin;

import com.github.pagehelper.Page;
import fun.cyhgraph.dto.WindowDTO;
import fun.cyhgraph.dto.WindowPageDTO;
import fun.cyhgraph.entity.Window;
import fun.cyhgraph.result.PageResult;
import fun.cyhgraph.result.Result;
import fun.cyhgraph.service.EmployeeService;
import fun.cyhgraph.service.WindowService;
import fun.cyhgraph.vo.WindowVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 窗口管理Controller（管理端）
 */
@RestController
@RequestMapping("/admin/window")
@Slf4j
public class WindowController {

    @Autowired
    private WindowService windowService;

    @Autowired
    private EmployeeService employeeService;

    /**
     * 新增窗口
     */
    @PostMapping
    public Result add(@RequestBody WindowDTO windowDTO) {
        log.info("新增窗口：{}", windowDTO);
        windowService.add(windowDTO);
        return Result.success();
    }

    /**
     * 分页查询窗口
     */
    @GetMapping("/page")
    public Result<PageResult> page(WindowPageDTO windowPageDTO) {
        log.info("分页查询窗口：{}", windowPageDTO);
        Page<Window> page = windowService.pageQuery(windowPageDTO);
        PageResult pageResult = new PageResult(page.getTotal(), page.getResult());
        return Result.success(pageResult);
    }

    /**
     * 根据ID查询窗口详情
     */
    @GetMapping("/{id}")
    public Result<WindowVO> getById(@PathVariable Integer id) {
        log.info("查询窗口详情：{}", id);
        WindowVO windowVO = windowService.getById(id);
        return Result.success(windowVO);
    }

    /**
     * 更新窗口信息
     */
    @PutMapping
    public Result update(@RequestBody WindowDTO windowDTO) {
        log.info("更新窗口：{}", windowDTO);
        windowService.update(windowDTO);
        return Result.success();
    }

    /**
     * 删除窗口
     */
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        log.info("删除窗口：{}", id);
        windowService.deleteById(id);
        return Result.success();
    }

    /**
     * 切换窗口营业状态
     */
    @PutMapping("/status/{id}")
    public Result toggleStatus(@PathVariable Integer id) {
        log.info("切换窗口营业状态：{}", id);
        windowService.toggleStatus(id);
        return Result.success();
    }

    /**
     * 查询所有窗口列表
     */
    @GetMapping("/list")
    public Result<List<Window>> list() {
        log.info("查询所有窗口列表");
        List<Window> list = windowService.listAll();
        return Result.success(list);
    }

    /**
     * 根据员工ID查询管理的窗口列表
     */
    @GetMapping("/employee/{employeeId}")
    public Result<List<Window>> getByEmployeeId(@PathVariable Integer employeeId) {
        log.info("查询员工管理的窗口列表: employeeId={}", employeeId);
        List<Window> list = windowService.getByEmployeeId(employeeId);
        return Result.success(list);
    }

    /**
     * 更新员工管理的窗口
     */
    @PutMapping("/employee/{employeeId}")
    public Result updateEmployeeWindows(@PathVariable Integer employeeId, @RequestBody List<Integer> windowIds) {
        log.info("更新员工管理的窗口: employeeId={}, windowIds={}", employeeId, windowIds);
        employeeService.updateEmployeeWindows(employeeId, windowIds);
        return Result.success();
    }
}
