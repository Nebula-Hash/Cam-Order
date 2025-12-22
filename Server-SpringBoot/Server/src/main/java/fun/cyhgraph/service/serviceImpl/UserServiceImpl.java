package fun.cyhgraph.service.serviceImpl;

import fun.cyhgraph.constant.MessageConstant;
import fun.cyhgraph.dto.UserDTO;
import fun.cyhgraph.dto.UserLoginDTO;
import fun.cyhgraph.entity.User;
import fun.cyhgraph.exception.AccountExistException;
import fun.cyhgraph.exception.AccountNotFoundException;
import fun.cyhgraph.exception.PasswordErrorException;
import fun.cyhgraph.mapper.UserMapper;
import fun.cyhgraph.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.time.LocalDateTime;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 用户账号密码登录
     *
     * @param userLoginDTO
     * @return
     */
    public User login(UserLoginDTO userLoginDTO) {
        String account = userLoginDTO.getAccount();
        String password = userLoginDTO.getPassword();
        // 先查数据库，看是否存在该账号
        User user = userMapper.getByAccount(account);
        if (user == null) {
            throw new AccountNotFoundException(MessageConstant.ACCOUNT_NOT_FOUND);
        }
        // 再将前端传过来的密码进行MD5加密
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        // 和数据库中的加密密码进行比对
        if (!password.equals(user.getPassword())) {
            throw new PasswordErrorException(MessageConstant.PASSWORD_ERROR);
        }
        return user;
    }

    /**
     * 用户注册
     *
     * @param userLoginDTO
     */
    public void register(UserLoginDTO userLoginDTO) {
        String account = userLoginDTO.getAccount();
        // 检查账号是否已存在
        User existUser = userMapper.getByAccount(account);
        if (existUser != null) {
            throw new AccountExistException(MessageConstant.ACCOUNT_EXIST);
        }
        // 对密码进行MD5加密
        String password = DigestUtils.md5DigestAsHex(userLoginDTO.getPassword().getBytes());
        User user = User.builder()
                .account(account)
                .password(password)
                .createTime(LocalDateTime.now())
                .build();
        userMapper.insert(user);
    }

    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    public User getUser(Integer id) {
        return userMapper.getById(id);
    }

    /**
     * 修改用户信息
     *
     * @param userDTO
     */
    public void update(UserDTO userDTO) {
        User user = new User();
        BeanUtils.copyProperties(userDTO, user);
        userMapper.update(user);
    }
}
