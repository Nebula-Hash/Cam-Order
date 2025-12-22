package fun.cyhgraph.service.serviceImpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import fun.cyhgraph.dto.WindowDTO;
import fun.cyhgraph.dto.WindowPageDTO;
import fun.cyhgraph.entity.Window;
import fun.cyhgraph.mapper.EmployeeWindowMapper;
import fun.cyhgraph.mapper.WindowMapper;
import fun.cyhgraph.service.WindowService;
import fun.cyhgraph.vo.WindowVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 窗口服务实现类
 */
@Service
public class WindowServiceImpl implements WindowService {

    @Autowired
    private WindowMapper windowMapper;

    @Autowired
    private EmployeeWindowMapper employeeWindowMapper;

    @Override
    public void add(WindowDTO windowDTO) {
        Window window = Window.builder()
                .name(windowDTO.getName())
                .pic(windowDTO.getPic())
                .description(windowDTO.getDescription())
                .location(windowDTO.getLocation())
                .status(windowDTO.getStatus() != null ? windowDTO.getStatus() : Window.STATUS_CLOSED)
                .openTime(windowDTO.getOpenTime())
                .closeTime(windowDTO.getCloseTime())
                .sort(windowDTO.getSort() != null ? windowDTO.getSort() : 0)
                .build();
        windowMapper.insert(window);
    }

    @Override
    public Page<Window> pageQuery(WindowPageDTO windowPageDTO) {
        PageHelper.startPage(windowPageDTO.getPage(), windowPageDTO.getPageSize());
        return windowMapper.pageQuery(windowPageDTO);
    }

    @Override
    public WindowVO getById(Integer id) {
        Window window = windowMapper.getById(id);
        if (window == null) {
            return null;
        }
        
        WindowVO windowVO = new WindowVO();
        BeanUtils.copyProperties(window, windowVO);
        
        // 统计分类、菜品、套餐数量
        windowVO.setCategoryCount(windowMapper.countCategoryByWindowId(id));
        windowVO.setDishCount(windowMapper.countDishByWindowId(id));
        windowVO.setSetmealCount(windowMapper.countSetmealByWindowId(id));
        
        return windowVO;
    }

    @Override
    public void update(WindowDTO windowDTO) {
        Window window = new Window();
        BeanUtils.copyProperties(windowDTO, window);
        windowMapper.update(window);
    }

    @Override
    public void deleteById(Integer id) {
        // 删除窗口前，先删除员工-窗口关联
        employeeWindowMapper.deleteByWindowId(id);
        windowMapper.deleteById(id);
    }

    @Override
    public void toggleStatus(Integer id) {
        windowMapper.toggleStatus(id);
    }

    @Override
    public List<Window> listOpen() {
        return windowMapper.listOpen();
    }

    @Override
    public List<Window> listAll() {
        return windowMapper.listAll();
    }

    @Override
    public List<Window> getByEmployeeId(Integer employeeId) {
        return employeeWindowMapper.getWindowsByEmployeeId(employeeId);
    }
}
