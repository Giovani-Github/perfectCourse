package com.giovani.perc.mapper;

import com.giovani.perc.pojo.Comment;

/**
 * 评论数据持久化接口
 *
 * @Author Giovani
 * @Create: 2018/7/29 12:28
 */
public interface CommentMapper {
    /**
     * 添加评论
     *
     * @Param: [comment]
     * @return: void
     * @Author: Giovani
     * @Date: 2018/7/29 12:30
     */
    public void addComment(Comment comment);
}
