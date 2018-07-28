package com.giovani.perc.controller;

import com.giovani.perc.exception.UserException;
import com.giovani.perc.pojo.User;
import com.giovani.perc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("userRL")
    public String userRL(Model model, User user, String method, HttpServletRequest request) {

        if (method.equals("regist")) {
            try {
                userService.regist(user);
                model.addAttribute("msg", "注册成功");

            } catch (UserException e) {
                model.addAttribute("msg", e.getMessage());
            }
        } else if (method.equals("login")) {
            try {
                User loginUser = userService.login(user);
                if (loginUser != null) {
                    request.getSession().setAttribute("user", loginUser);
                }
                model.addAttribute("msg", "登录成功");
            } catch (UserException e) {
                model.addAttribute("msg", e.getMessage());
            }
        }

        return "msg";
    }

    @RequestMapping("login")
    public String login(User user) {
        return "redirect:page/toHome.action";
    }

}
