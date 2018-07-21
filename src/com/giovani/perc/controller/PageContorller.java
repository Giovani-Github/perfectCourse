package com.giovani.perc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转信息请求处理
 *
 * @Author Giovani
 * @Create: 2018/7/21 16:23
 */
@Controller
@RequestMapping("page")
public class PageContorller {

    /**
     * 前往主页
     * 访问地址：http://localhost:8080/perfectCourse/page/toHome.action
     *
     * @Param: []
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/21 16:26
     */
    @RequestMapping("toHome")
    public String toHome() {
        return "index";
    }
}
