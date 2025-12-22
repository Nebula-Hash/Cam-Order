package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 员工-窗口关联实体类
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeWindow implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;              // 主键
    private Integer employeeId;      // 员工ID
    private Integer windowId;        // 窗口ID
    private LocalDateTime createTime; // 创建时间
}
