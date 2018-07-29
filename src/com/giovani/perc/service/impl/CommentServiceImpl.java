package com.giovani.perc.service.impl;

import com.giovani.perc.mapper.CommentMapper;
import com.giovani.perc.pojo.Comment;
import com.giovani.perc.service.CommentService;
import com.giovani.perc.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
