package com.giovani.perc.mapper;

import com.giovani.perc.pojo.Comment;
import com.giovani.perc.pojo.CommentQueryVo;

import java.util.List;

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

    /**
     * 查询评论列表，通过视频id
     *
     * @Param: []
     * @return: java.util.List<com.giovani.perc.pojo.CommentQueryVo>
     * @Author: Giovani
     * @Date: 2018/7/29 16:25
     */
    public List<CommentQueryVo> findCommentListByVideoId(String video_id);
}
