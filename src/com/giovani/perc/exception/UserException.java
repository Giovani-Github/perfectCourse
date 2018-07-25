package com.giovani.perc.exception;

/**
 * 用户模块错误信息处理
 *
 * @Author Giovani
 * @Create: 2018/7/25 14:46
 */
public class UserException extends RuntimeException {

    public UserException(String message) {
        super(message);
    }
}
