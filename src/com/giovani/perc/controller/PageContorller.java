package com.giovani.perc.controller;

import com.giovani.perc.pojo.QueryVo;
import com.giovani.perc.pojo.Video;
import com.giovani.perc.service.VideoService;
import com.giovani.perc.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @Autowired
    private VideoService videoService;

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
    public String toHome(Model model, QueryVo queryVo) {

        // 分页查询视频列表
        Page<Video> videoPage = videoService.findVideoList(queryVo);

        // 存入模型中，返回到页面上
        model.addAttribute("videoPage", videoPage);
        model.addAttribute("queryVo", queryVo);

        // 带着模型数据返回idnex页面
        return "index";

    }

    /**
     * 前往视频播放页
     * 访问地址：http://localhost:8080/perfectCourse/page/toVideo.action
     *
     * @Param: []
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/21 20:58
     */
    @RequestMapping("toVideo")
    public String toVideo(Model model, String video_id) {

        // 根据id查询出视频
        Video video = videoService.findVideoById(video_id);

        // 存入模型中，返回到页面上
        model.addAttribute("video", video);

        return "video";
    }

    @RequestMapping("toMsg")
    public String toMsg(Model model, String video_id) {
        return "msg";
    }
}
