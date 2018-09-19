package com.giovani.perc.pojo;

/**
 * 评论数据模型
 *
 * @Author Giovani
 * @Create: 2018/7/29 11:40
 */
public class Comment {

    private Long comment_id; // 该评论的id
    private Long user_id; // 该评论是哪个用户的
    private Long video_id; // 该评论在哪个视频下面
    private String content; // 评论内容
    private String createtime; // 评论创建时间

    public Long getComment_id() {
        return comment_id;
    }

    public void setComment_id(Long comment_id) {
        this.comment_id = comment_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getVideo_id() {
        return video_id;
    }

    public void setVideo_id(Long video_id) {
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
