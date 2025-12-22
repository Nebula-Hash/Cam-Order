package fun.cyhgraph.vo;

import fun.cyhgraph.entity.Window;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmployeeLoginVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private String account;
    private String token;
    private Integer role;                // 角色：0-窗口员工 1-窗口管理员 2-超级管理员
    private List<Window> windows;        // 管理的窗口列表
}
