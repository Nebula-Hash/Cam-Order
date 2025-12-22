package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * 餐厅窗口实体类
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Window implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 营业状态常量
     */
    public static final Integer STATUS_CLOSED = 0;  // 休息中
    public static final Integer STATUS_OPEN = 1;    // 营业中

    private Integer id;              // 窗口ID
    private String name;             // 窗口名称
    private String pic;              // 窗口图片
    private String description;      // 窗口描述
    private String location;         // 窗口位置（如：一楼A区）
    private Integer status;          // 营业状态：0-休息中 1-营业中
    private LocalTime openTime;      // 营业开始时间
    private LocalTime closeTime;     // 营业结束时间
    private Integer sort;            // 排序
    private Integer createUser;      // 创建人
    private Integer updateUser;      // 更新人
    private LocalDateTime createTime; // 创建时间
    private LocalDateTime updateTime; // 更新时间
}
