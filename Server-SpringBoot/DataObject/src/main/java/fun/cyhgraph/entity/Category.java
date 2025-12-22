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
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 分类类型常量
     */
    public static final Integer TYPE_DISH = 1;     // 菜品分类
    public static final Integer TYPE_SETMEAL = 2;  // 套餐分类

    private Integer id;
    private Integer windowId;   // 所属窗口ID
    private String name;
    private Integer type;       // 类型：1-菜品分类 2-套餐分类
    private Integer sort;
    private Integer status;
    private Integer createUser;
    private Integer updateUser;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
