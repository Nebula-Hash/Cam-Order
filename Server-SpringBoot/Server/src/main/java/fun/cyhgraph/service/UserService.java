package fun.cyhgraph.service;

import fun.cyhgraph.dto.UserDTO;
import fun.cyhgraph.dto.UserLoginDTO;
import fun.cyhgraph.entity.User;

import java.math.BigDecimal;

public interface UserService {
    User login(UserLoginDTO userLoginDTO);

    void register(UserLoginDTO userLoginDTO);

    User getUser(Integer id);

    void update(UserDTO userDTO);

    void recharge(Integer userId, BigDecimal amount);
}
