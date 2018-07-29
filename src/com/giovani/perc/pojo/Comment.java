package com.giovani.perc.pojo;

/**
 * 评论数据模型
 *
 * @Author Giovani
 * @Create: 2018/7/29 11:40
 */
public class Comment {

    private String comment_id; // 该评论的id
    private String user_id; // 该评论是哪个用户的
    private String video_id; // 该评论在哪个视频下面
    private String content; // 评论内容
    private String createtime; // 评论创建时间

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getVideo_id() {
        return video_id;
    }

    public void setVideo_id(String video_id) {
        this.video_id = video_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}
