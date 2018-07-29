package com.giovani.perc.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.giovani.perc.pojo.Comment;
import com.giovani.perc.service.CommentService;
import com.giovani.perc.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 评论数据请求处理
 *
 * @Author Giovani
 * @Create: 2018/7/29 11:45
 */
@Controller
@RequestMapping("comment")
public class CommentContorller {

    // spring注入commentService
    @Autowired
    private CommentService commentService;

    /**
     * 评论创建
     *
     * @Param: [comment]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/29 11:46
     */
    @RequestMapping(value = "comment", method = RequestMethod.POST)
    public void comment(@RequestBody Comment comment, HttpServletResponse response, HttpServletRequest request) {
        // @requestBody表示接受json对像，解析到commnet

        response.setContentType("text/xml;charset=UTF-8");
        Map<String, String> msg = new HashMap<String, String>();

        try {
            if (request.getSession().getAttribute("loginUser") == null) {
                // 需要登陆后才能评论
                msg.put("msg", "请先登录");
                response.getWriter().print(JSONUtils.toJSONString(msg));
                return;
            } else if (StringUtils.isEmpty(comment.getContent())) {
                // 评论内容不能为空
                msg.put("msg", "评论内容不能为空");
                response.getWriter().print(JSONUtils.toJSONString(msg));
                return;
            }

            // 创建评论
            commentService.addComment(comment);

            // 评论成功
            msg.put("msg", "评论成功");
            msg.put("code", "1");
            response.getWriter().print(JSONUtils.toJSONString(msg));
            return;

        } catch (IOException e) {
            e.printStackTrace();
        } catch (RuntimeException e) {
            // 创建评论过程中报错，说明评论创建不成功
            try {
                msg.put("msg", "评论失败");
                response.getWriter().print(JSONUtils.toJSONString(msg));
                return;
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
