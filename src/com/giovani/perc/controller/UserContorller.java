package com.giovani.perc.controller;

import com.giovani.perc.exception.UserException;
import com.giovani.perc.pojo.User;
import com.giovani.perc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户信息请求处理
 *
 * @Author Giovani
 * @Create: 2018/7/25 14:55
 */
@Controller
@RequestMapping("user")
public class UserContorller {

    @Autowired
    private UserService userService;

    @RequestMapping("regist")
    @ResponseBody
    public String regist(User user, Model model) {

        try {
            userService.regist(user);
            model.addAttribute("注册成功");
        } catch (UserException e) {
            model.addAttribute(e.getMessage());
        }

        // TODO: 2018/7/25 17:30 可以成功接收ajax提交的form表单参数，但是无法完成参数返回让ajax接收
        return "forward:/page/toHome.action";

    }

    @RequestMapping("login")
    public String login(User user) {
        return "redirect:page/toHome.action";
    }

}
