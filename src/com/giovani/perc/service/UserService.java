package com.giovani.perc.service;

import com.giovani.perc.exception.UserException;
import com.giovani.perc.pojo.User;

/**
 * 用户数据业务逻辑接口
 *
 * @Author Giovani
 * @Create: 2018/7/25 14:26
 */
public interface UserService {

    /**
     * 用户注册
     *
     * @Param: [user]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/25 14:31
     */
    public void regist(User user) throws UserException;

    /**
     * 用户登录
     *
     * @Param: [user]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/25 14:28
     */
    public void login(User user) throws UserException;
}
