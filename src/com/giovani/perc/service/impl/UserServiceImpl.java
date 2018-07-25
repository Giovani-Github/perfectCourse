package com.giovani.perc.service.impl;

import com.giovani.perc.exception.UserException;
import com.giovani.perc.mapper.UserMapper;
import com.giovani.perc.pojo.User;
import com.giovani.perc.service.UserService;
import com.giovani.perc.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author Giovani
 * @Create: 2018/7/25 14:29
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void regist(User user) throws UserException {

        // 用户名校验
        if (StringUtils.isEmpty(user.getUsername())) {
            throw new UserException("用户名不能为空");
        }

        if (StringUtils.isEmpty(user.getPassword())) {
            throw new UserException("密码不能为空");
        }

        // 添加用户id
        user.setUser_id(StringUtils.uuid());

        // 添加到数据库
        userMapper.addUser(user);
    }

    @Override
    public void login(User user) {
        //        userMapper.addUser(user);
    }

}
