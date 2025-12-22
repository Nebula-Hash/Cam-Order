package fun.cyhgraph.mapper;

import com.github.pagehelper.Page;
import fun.cyhgraph.annotation.AutoFill;
import fun.cyhgraph.dto.PageDTO;
import fun.cyhgraph.entity.Employee;
import fun.cyhgraph.enumeration.OperationType;
import org.apache.ibatis.annotations.*;

@Mapper
public interface EmployeeMapper {

    @Select("select * from employee where id = #{id}")
    Employee getById(Integer id);

    @Select("select * from employee where account = #{account}")
    Employee getByAccount(String account);

    @Insert("insert into employee (name, account, password, phone, age, gender, pic, role, status, create_user, update_user, create_time, update_time) VALUES " +
            "(#{name}, #{account}, #{password}, #{phone}, #{age}, #{gender}, #{pic}, #{role}, #{status}, #{createUser}, #{updateUser}, #{createTime}, #{updateTime})")
    @AutoFill(value = OperationType.REG)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void regEmployee(Employee employee);

    @Insert("insert into employee (name, account, password, phone, age, gender, pic, role, status, create_user, update_user, create_time, update_time) VALUES " +
            "(#{name}, #{account}, #{password}, #{phone}, #{age}, #{gender}, #{pic}, #{role}, #{status}, #{createUser}, #{updateUser}, #{createTime}, #{updateTime})")
    @AutoFill(value = OperationType.INSERT)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void addEmployee(Employee employee);

    Page<Employee> pageQuery(PageDTO pageDTO);

    /**
     * 加上注解，指定操作类型，方便自动填充时间字段
     * @param employee
     */
    @AutoFill(value = OperationType.UPDATE)
    void update(Employee employee);

    @Delete("delete from employee where id = #{id}")
    void delete(Integer id);

    @Update("update employee set status = IF(status = 0, 1, 0) where id = #{id}")
    void onOff(Integer id);

    @AutoFill(value = OperationType.UPDATE)
    void updatePwd(Employee employee);

    /**
     * 根据角色查询员工列表
     */
    @Select("SELECT * FROM employee WHERE role = #{role} AND status = 1")
    java.util.List<Employee> getByRole(Integer role);
}
