package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 地址簿实体类（简化版 - 校园宿舍）
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AddressBook implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;             // 主键
    private Long userId;         // 用户ID
    private String consignee;    // 收餐人姓名
    private String phone;        // 手机号
    private String dormitory;    // 宿舍楼号（如：12栋305）
    private String label;        // 标签（宿舍、教室等）
    private Integer isDefault;   // 是否默认：0-否 1-是
}
