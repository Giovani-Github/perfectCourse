package com.giovani.perc.controller;

import com.giovani.perc.exception.UserException;
import com.giovani.perc.pojo.User;
import com.giovani.perc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

    /**
     * 用户登录和注册功能
     * 访问地址: http://localhost:8080/perfectCourse/user/userRL.action?method=regist
     * 访问地址: http://localhost:8080/perfectCourse/user/userRL.action?method=login
     *
     * @Param: [model, user, method, request]
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/29 9:29
     */
    @RequestMapping("userRL")
    public String userRL(Model model, User user, String method, HttpServletRequest request) {

        // 判断进行登录还是注册操作
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
                    request.getSession().setAttribute("loginUser", loginUser);
                }
                model.addAttribute("msg", "登录成功");
            } catch (UserException e) {
                model.addAttribute("msg", e.getMessage());
            }
        }

        return "msg";

    }

    /**
     * 退出登录
     *
     * @Param: []
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/29 9:32
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {

        request.getSession().removeAttribute("loginUser");
        return "redirect:/page/toHome.action";
        //        return "index";

    }

    @RequestMapping(value = "text", method = RequestMethod.POST)
    public void text(@RequestBody User user, HttpServletResponse response) {
        System.out.println(user);

        try {
            response.setContentType("text/xml;charset=UTF-8");
            response.getWriter().print(1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //        return "";
    }

}
