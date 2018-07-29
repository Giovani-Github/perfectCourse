package com.giovani.perc.service;

import com.giovani.perc.pojo.Comment;

/**
 * 评论数据业务逻辑接口
 *
 * @Author Giovani
 * @Create: 2018/7/29 12:33
 */
public interface CommentService {

    /**
     * 创建评论
     *
     * @Param: [comment]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/29 12:34
     */
    public void addComment(Comment comment);

}
