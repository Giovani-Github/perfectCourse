package com.giovani.perc.controller;

import com.giovani.perc.pojo.*;
import com.giovani.perc.service.CommentService;
import com.giovani.perc.service.DocService;
import com.giovani.perc.service.VideoService;
import com.giovani.perc.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 * 页面跳转信息请求处理
 *
 * @Author Giovani
 * @Create: 2018/7/21 16:23
 */
@Controller
//@RequestMapping("page")
public class PageContorller {

    @Autowired
    private VideoService videoService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private DocService docService;

    @RequestMapping("toVideoList")
    public String toVideoList(Model model, QueryVo queryVo) {

        // 分页查询视频列表
        Page<Video> videoPage = videoService.findVideoList(queryVo);

        // 存入模型中，返回到页面上
        model.addAttribute("page", videoPage);
        model.addAttribute("queryVo", queryVo);

        // 带着模型数据返回videoList页面
        return "videoList";

    }

    /**
     * 前往文档列表页
     *
     * @Param: [model, docQueryVo]
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/9/20 10:02
     */
    @RequestMapping("toDocList")
    public String toDocList(Model model, DocQueryVo docQueryVo) {

        Page<Doc> docPage = docService.findDocList(docQueryVo);
        model.addAttribute("page", docPage);
        model.addAttribute("docQueryVo", docQueryVo);
        return "docList";

    }

    /**
     * 前往pdf文件详情页
     * http://localhost:8080/page/toPdfDetails.action?fileName=demo
     *
     * @param
     * @return void
     * @Author Giovani
     * @Date 2018/8/28 11:05
     */
    @RequestMapping("/toPdfDetails")
    public void toPdfDetails(HttpServletRequest request, HttpServletResponse response, String fileName) {
        // 文件的路径
        File pdfFile = new File(request.getServletContext().getRealPath("/pdf/" + fileName + ".pdf"));
        response.setContentType("application/pdf");
        FileInputStream in = null;
        OutputStream out = null;

        // 把文件输出到流中
        try {

            in = new FileInputStream(pdfFile);
            out = response.getOutputStream();

            byte[] b = new byte[1024];
            while ((in.read(b)) != -1) {
                out.write(b);
            }

            out.flush();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 前往主页
     * 访问地址：http://localhost:8080/page/toHome.action
     *
     * @Param: []
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/21 16:26
     */
    @RequestMapping("/")
    public String toHome(Model model, QueryVo queryVo, DocQueryVo docQueryVo) {

        // 分页查询视频列表
        Page<Video> videoPage = videoService.findVideoList(queryVo);

        // 存入模型中，返回到页面上
        model.addAttribute("videoPage", videoPage);
        model.addAttribute("queryVo", queryVo);

        // 分页查询文档列表
        Page<Doc> docPage = docService.findDocList(docQueryVo);
        model.addAttribute("docPage", docPage);
        model.addAttribute("docQueryVo", docQueryVo);

        // 带着模型数据返回idnex页面
        return "index";

    }

    /**
     * 前往视频播放页
     * 访问地址：http://localhost:8080/page/toVideo.action
     *
     * @Param: []
     * @return: java.lang.String
     * @Author: Giovani
     * @Date: 2018/7/21 20:58
     */
    @RequestMapping("toVideo")
    public String toVideo(Model model, Long video_id) {

        // 根据id查询出视频
        Video video = videoService.findVideoById(video_id);
        // 根据视频id查询出评论列表
        List<CommentQueryVo> commentQueryVoList = commentService.findCommentListByVideoId(video_id);

        // 存入模型中，返回到页面上
        model.addAttribute("video", video);
        model.addAttribute("commentList", commentQueryVoList);

        return "video";
    }

    /**
     * 前往课程简介页
     * 访问地址：http://localhost:8080/perfectCourse/page/toIntroduce.action
     *
     * @param
     * @return java.lang.String
     * @Author Giovani
     * @Date 2018/8/27 14:20
     */
    @RequestMapping("toIntroduce")
    public String toIntroduce(Model model, String video_id) {

        //        // 根据id查询出视频
        //        Video video = videoService.findVideoById(video_id);
        //        // 根据视频id查询出评论列表
        //        List<CommentQueryVo> commentQueryVoList = commentService.findCommentListByVideoId(video_id);
        //
        //        // 存入模型中，返回到页面上
        //        model.addAttribute("video", video);
        //        model.addAttribute("commentList", commentQueryVoList);

        return "introduce";
    }

    /**
     * 前往pdf文件详情页
     *
     * @param
     * @return void
     * @Author Giovani
     * @Date 2018/8/28 11:05
     */
    //    @RequestMapping("toPdfDetails")
    //    public void toPdfDetails(HttpServletRequest request, HttpServletResponse response, String fileName) {
    //        // 文件的路径
    //        File pdfFile = new File(request.getServletContext().getRealPath("/pdf/" + fileName + ".pdf"));
    //        response.setContentType("application/pdf");
    //        FileInputStream in = null;
    //        OutputStream out = null;
    //
    //        // 把文件输出到流中
    //        try {
    //
    //            in = new FileInputStream(pdfFile);
    //            out = response.getOutputStream();
    //
    //            byte[] b = new byte[1024];
    //            while ((in.read(b)) != -1) {
    //                out.write(b);
    //            }
    //
    //            out.flush();
    //
    //        } catch (FileNotFoundException e) {
    //            e.printStackTrace();
    //        } catch (IOException e) {
    //            e.printStackTrace();
    //        } finally {
    //            try {
    //                in.close();
    //                out.close();
    //            } catch (IOException e) {
    //                e.printStackTrace();
    //            }
    //        }
    //
    //    }

    @RequestMapping("toMsg")
    public String toMsg(Model model, Long video_id) {
        return "msg";
    }
}
