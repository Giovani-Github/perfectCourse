package com.giovani.perc.service.impl;

import com.giovani.perc.mapper.CommentMapper;
import com.giovani.perc.pojo.Comment;
import com.giovani.perc.pojo.CommentQueryVo;
import com.giovani.perc.service.CommentService;
import com.giovani.perc.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 评论数据业务逻辑接口实现类
 *
 * @Author Giovani
 * @Create: 2018/7/29 12:34
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void addComment(Comment comment) throws RuntimeException {

        try {
            comment.setComment_id(StringUtils.uuid());
            commentMapper.addComment(comment);
        } catch (RuntimeException e) {
            throw e;
        }

    }

    @Override
    public List<CommentQueryVo> findCommentListByVideoId(String video_id) {
        // 查询出评论结果集
        List<CommentQueryVo> commentQueryVoList = commentMapper.findCommentListByVideoId(video_id);
        return commentQueryVoList;
    }

    @Override
    public void deleteComment(String comment_id) throws RuntimeException {
        try {
            commentMapper.deleteComment(comment_id);
        } catch (RuntimeException e) {
            throw e;
        }
    }

}
