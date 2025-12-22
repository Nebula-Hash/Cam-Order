package fun.cyhgraph.service.serviceImpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import fun.cyhgraph.constant.MessageConstant;
import fun.cyhgraph.context.BaseContext;
import fun.cyhgraph.dto.EmployeeDTO;
import fun.cyhgraph.dto.EmployeeFixPwdDTO;
import fun.cyhgraph.dto.EmployeeLoginDTO;
import fun.cyhgraph.dto.PageDTO;
import fun.cyhgraph.entity.Employee;
import fun.cyhgraph.entity.Window;
import fun.cyhgraph.exception.PasswordErrorException;
import fun.cyhgraph.exception.EmployeeNotFoundException;
import fun.cyhgraph.mapper.EmployeeMapper;
import fun.cyhgraph.mapper.EmployeeWindowMapper;
import fun.cyhgraph.result.PageResult;
import fun.cyhgraph.service.EmployeeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;
    
    @Autowired
    private EmployeeWindowMapper employeeWindowMapper;

    /**
     * 员工登录
     * @param employeeLoginDTO
     * @return
     */
    public Employee login(EmployeeLoginDTO employeeLoginDTO) {
        String account = employeeLoginDTO.getAccount();
        String password = employeeLoginDTO.getPassword();
        // 先查数据库，看是否存在该账号
        Employee employee = employeeMapper.getByAccount(account);
        if (employee == null){
            throw new EmployeeNotFoundException(MessageConstant.ACCOUNT_NOT_FOUND);
        }
        // TODO: 调试模式 - 暂时禁用密码加密，直接明文比对
        // password = DigestUtils.md5DigestAsHex(password.getBytes());
        // 和之前存进数据库的密码进行比对
        if (!password.equals(employee.getPassword())){
            throw new PasswordErrorException(MessageConstant.PASSWORD_ERROR);
        }
        return employee;
    }

    /**
     * 注册/新增员工
     */
    public void register(EmployeeLoginDTO employeeLoginDTO) {
        // TODO: 调试模式 - 暂时禁用密码加密，直接存储明文
        // String password = employeeLoginDTO.getPassword();
        // password = DigestUtils.md5DigestAsHex(password.getBytes());
        // employeeLoginDTO.setPassword(password);

        Employee employee = new Employee();
        // 将userLoginDTO的属性拷贝到user中
        BeanUtils.copyProperties(employeeLoginDTO, employee);
        // 为user其他字段填充默认值(7-3=4个)
        employee.setName("员工");
        employee.setPhone("11111111111");
        employee.setAge(0);
        employee.setGender(1);
        employee.setStatus(1);
        employee.setRole(Employee.ROLE_STAFF); // 默认为窗口员工
        employee.setCreateUser(100); // 100表示员工自己注册
        employee.setUpdateUser(100);
        employeeMapper.regEmployee(employee);
    }

    /**
     * 根据id获取员工信息
     * @return
     */
    public Employee getEmployeeById(Integer id) {
        Employee employee = employeeMapper.getById(id);
        return employee;
    }

    /**
     * 员工分页查询
     * @return
     */
    public PageResult employeePageList(PageDTO pageDTO) {
        // 传分页参数给PageHelper自动处理，会自动加上limit和count(*)返回分页结果和总记录数
        PageHelper.startPage(pageDTO.getPage(), pageDTO.getPageSize());
        Page<Employee> pagelist = employeeMapper.pageQuery(pageDTO);
        return new PageResult(pagelist.getTotal(), pagelist.getResult());
    }

    /**
     * 修改员工
     * @param employeeDTO
     */
    public void update(EmployeeDTO employeeDTO) {
        // 缺少时间等字段，需要手动加入，否则Mapper里的autofill注解会为EmployeeDTO去setUpdateTime，然而根本没这个方法导致报错！
        Employee employee = new Employee();
        BeanUtils.copyProperties(employeeDTO, employee);
        employeeMapper.update(employee);
    }

    /**
     * 删除员工
     */
    public void delete(Integer id) {
        employeeMapper.delete(id);
    }

    /**
     * 根据id修改员工状态
     * @param id
     */
    public void onOff(Integer id) {
        employeeMapper.onOff(id);
    }

    /**
     * 管理员新增员工
     * @param employeeDTO
     */
    public void addEmployee(EmployeeDTO employeeDTO) {
        // TODO: 调试模式 - 暂时禁用密码加密，直接存储明文
        // String password = employeeDTO.getPassword();
        // password = DigestUtils.md5DigestAsHex(password.getBytes());
        // employeeDTO.setPassword(password);
        // 创建employee对象，将employeeDTO的属性拷贝到employee中
        Employee employee = new Employee();
        BeanUtils.copyProperties(employeeDTO, employee);
        // 为user其他字段填充默认值
        employee.setStatus(1);
        if (employeeDTO.getRole() == null) {
            employee.setRole(Employee.ROLE_STAFF); // 默认为窗口员工
        }
        employeeMapper.addEmployee(employee);
    }

    /**
     * 修改密码
     * @param employeeFixPwdDTO
     */
    public void fixPwd(EmployeeFixPwdDTO employeeFixPwdDTO) {
        String oldPwd = employeeFixPwdDTO.getOldPwd();
        // TODO: 调试模式 - 暂时禁用密码加密
        // oldPwd = DigestUtils.md5DigestAsHex(oldPwd.getBytes());
        // 根据id查询当前账号信息
        Integer id = BaseContext.getCurrentId();
        Employee employee = employeeMapper.getById(id);
        // 和之前存进数据库的密码进行比对
        if (!oldPwd.equals(employee.getPassword())){
            throw new PasswordErrorException(MessageConstant.PASSWORD_ERROR);
        }
        // 旧密码正确，直接更新新密码（明文）
        String newPwd = employeeFixPwdDTO.getNewPwd();
        String password = newPwd; // DigestUtils.md5DigestAsHex(newPwd.getBytes());
        employee.setPassword(password);
        employeeMapper.updatePwd(employee);
    }

    /**
     * 获取员工管理的窗口列表
     */
    public List<Window> getEmployeeWindows(Integer employeeId) {
        return employeeWindowMapper.getWindowsByEmployeeId(employeeId);
    }

    /**
     * 更新员工管理的窗口
     */
    @Transactional
    public void updateEmployeeWindows(Integer employeeId, List<Integer> windowIds) {
        // 先删除旧的关联
        employeeWindowMapper.deleteByEmployeeId(employeeId);
        // 再添加新的关联
        if (windowIds != null && !windowIds.isEmpty()) {
            employeeWindowMapper.insertBatch(employeeId, windowIds);
        }
    }
}
