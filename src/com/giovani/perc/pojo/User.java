package com.giovani.perc.pojo;

/**
 * 用户数据模型
 *
 * @Author Giovani
 * @Create: 2018/7/25 10:59
 */
public class User {

    private String user_id;
    private String username;
    private String password;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
