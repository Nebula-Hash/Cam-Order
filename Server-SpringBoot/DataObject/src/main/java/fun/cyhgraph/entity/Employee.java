package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色常量
     */
    public static final Integer ROLE_STAFF = 0;      // 窗口员工
    public static final Integer ROLE_MANAGER = 1;    // 窗口管理员
    public static final Integer ROLE_ADMIN = 2;      // 超级管理员

    private Integer id;
    private String name;
    private String account;
    private String password;
    private String phone;
    private Integer age;
    private Integer gender;
    private String pic;
    private Integer role;    // 角色：0-窗口员工 1-窗口管理员 2-超级管理员
    private Integer status;
    private Integer createUser;
    private Integer updateUser;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
