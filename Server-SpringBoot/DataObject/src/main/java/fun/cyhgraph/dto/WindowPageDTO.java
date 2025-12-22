package fun.cyhgraph.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 窗口分页查询DTO
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WindowPageDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer page;        // 页码
    private Integer pageSize;    // 每页数量
    private String name;         // 窗口名称（模糊搜索）
    private Integer status;      // 营业状态筛选
}
