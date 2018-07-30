package com.giovani.perc.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.giovani.perc.exception.UserException;
import com.giovani.perc.pojo.User;
import com.giovani.perc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
     * 注册功能
     * 访问地址: http://localhost:8080/perfectCourse/user/regist.action
     *
     * @Param: [user, response]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/30 11:27
     */
    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public void regist(User user, HttpServletResponse response) {
        Map<String, String> msg = new HashMap<>();
        try {

            userService.regist(user);
            msg.put("msg", "注册成功，可以进行登录");
            response.getWriter().print(JSONUtils.toJSONString(msg));

        } catch (UserException e) {

            try {
                msg.put("msg", e.getMessage());
                response.getWriter().print(JSONUtils.toJSONString(msg));
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 登录功能
     * 访问地址: http://localhost:8080/perfectCourse/user/login.action
     *
     * @Param: [user, response]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/30 11:27
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public void login(User user, HttpServletResponse response, HttpServletRequest request) {
        Map<String, String> msg = new HashMap<>();
        try {

            User loginUser = userService.login(user);

            if (loginUser != null) {
                request.getSession().setAttribute("loginUser", loginUser);
            }

            msg.put("msg", "登录成功");
            msg.put("code", "1");
            response.getWriter().print(JSONUtils.toJSONString(msg));

        } catch (UserException e) {

            try {
                msg.put("msg", e.getMessage());
                response.getWriter().print(JSONUtils.toJSONString(msg));
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 退出登录
     *
     * @Param: []
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/29 9:32
     */
    @RequestMapping(value = "logout", method = RequestMethod.POST)
    public void logout(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.getSession().removeAttribute("loginUser");
            Map<String, String> msg = new HashMap<>();
            msg.put("msg", "成功退出");
            msg.put("code", "1");
            response.getWriter().print(JSONUtils.toJSONString(msg));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
