package com.giovani.perc.pojo;

/**
 * 评论查询结果模型封装
 *
 * @Author Giovani
 * @Create: 2018/7/29 16:20
 */
public class CommentQueryVo {

    private String username; // 谁评论的
    private String content; // 评论内容
    private String createtime; // 评论创建时间

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
