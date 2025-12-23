package fun.cyhgraph.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {

    private Integer id;
    private String account;
    private String password;
    private String name;
    private String phone;
    private Integer gender;
    private String pic;
    private BigDecimal balance;  // 账户余额
    private LocalDateTime createTime;

}
