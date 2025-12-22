package fun.cyhgraph.controller.client;

import fun.cyhgraph.entity.Window;
import fun.cyhgraph.result.Result;
import fun.cyhgraph.service.WindowService;
import fun.cyhgraph.vo.WindowVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 窗口Controller（顾客端）
 */
@RestController("clientWindowController")
@RequestMapping("/client/window")
@Slf4j
public class WindowController {

    @Autowired
    private WindowService windowService;

    /**
     * 获取所有营业中的窗口列表
     */
    @GetMapping("/list")
    public Result<List<Window>> listOpen() {
        log.info("顾客端获取营业中的窗口列表");
        List<Window> list = windowService.listOpen();
        return Result.success(list);
    }

    /**
     * 根据ID查询窗口详情
     */
    @GetMapping("/{id}")
    public Result<WindowVO> getById(@PathVariable Integer id) {
        log.info("顾客端查询窗口详情：{}", id);
        WindowVO windowVO = windowService.getById(id);
        return Result.success(windowVO);
    }
}
