package com.giovani.perc.mapper;

import com.giovani.perc.pojo.User;

/**
 * 用户数据持久化接口
 *
 * @Author Giovani
 * @Create: 2018/7/25 11:24
 */
public interface UserMapper {

    /**
     * 添加用户
     *
     * @Param: [user]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/25 14:22
     */
    public void addUser(User user);
}
