package fun.cyhgraph.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalTime;

/**
 * 窗口列表视图对象（简化版，用于列表展示）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WindowListVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;              // 窗口ID
    private String name;             // 窗口名称
    private String pic;              // 窗口图片
    private String description;      // 窗口描述
    private String location;         // 窗口位置
    private Integer status;          // 营业状态：0-休息中 1-营业中
    private LocalTime openTime;      // 营业开始时间
    private LocalTime closeTime;     // 营业结束时间
}
