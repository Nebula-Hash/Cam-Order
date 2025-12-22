package fun.cyhgraph.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * 窗口视图对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WindowVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;              // 窗口ID
    private String name;             // 窗口名称
    private String pic;              // 窗口图片
    private String description;      // 窗口描述
    private String location;         // 窗口位置
    private Integer status;          // 营业状态：0-休息中 1-营业中
    private LocalTime openTime;      // 营业开始时间
    private LocalTime closeTime;     // 营业结束时间
    private Integer sort;            // 排序
    private LocalDateTime createTime; // 创建时间
    private LocalDateTime updateTime; // 更新时间
    
    // 扩展字段
    private Integer categoryCount;   // 分类数量
    private Integer dishCount;       // 菜品数量
    private Integer setmealCount;    // 套餐数量
    private Integer todayOrderCount; // 今日订单数
}
