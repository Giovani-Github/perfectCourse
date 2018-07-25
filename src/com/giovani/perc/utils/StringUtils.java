package com.giovani.perc.utils;

import java.util.UUID;

/**
 * 字符串相关的工具类
 *
 * @Author Giovani
 * @Create: 2018/7/21 21:20
 */
public class StringUtils {

    /**
     * 生成一个uuid字符串
     *
     * @Param: []
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/21 21:20
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }

    public static void main(String[] args) {
        System.out.println(uuid());
    }

    /**
     * 判断字符串是否等于空串和null
     *
     * @Param: [username]
     * @return: boolean
     * @Author: Giovani
     * @Date: 2018/7/25 14:33
     */
    public static boolean isEmpty(String str) {

        if (str == "" || str == null) {
            return true;
        }
        return false;
        
    }
}
