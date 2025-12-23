package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;
import java.util.Map;

@Mapper
public interface UserMapper {

    @Select("select * from user where account = #{account}")
    User getByAccount(String account);

    void insert(User user);

    @Select("select * from user where id = #{id}")
    User getById(Integer id);

    void update(User user);

    Integer countByMap(Map map);

    /**
     * 扣减用户余额
     */
    @Update("UPDATE user SET balance = balance - #{amount} WHERE id = #{userId} AND balance >= #{amount}")
    int deductBalance(@Param("userId") Integer userId, @Param("amount") BigDecimal amount);

    /**
     * 增加用户余额（充值/退款）
     */
    @Update("UPDATE user SET balance = balance + #{amount} WHERE id = #{userId}")
    void addBalance(@Param("userId") Integer userId, @Param("amount") BigDecimal amount);
}
