CREATE TABLE perfectcourse.t_comment
(
    comment_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int(11) COMMENT '这条评论属于哪个用户',
    video_id int(11) COMMENT '这条评论在哪个视频底下',
    content varchar(3000) COMMENT '这条评论的内容
            ',
    createtime timestamp COMMENT '这条评论生成的时间',
    CONSTRAINT FK_comment_user FOREIGN KEY (user_id) REFERENCES perfectcourse.t_user (user_id),
    CONSTRAINT FK_comment_video FOREIGN KEY (video_id) REFERENCES perfectcourse.t_video (video_id)
);
CREATE INDEX FK_comment_user ON perfectcourse.t_comment (user_id);
CREATE INDEX FK_comment_video ON perfectcourse.t_comment (video_id);
INSERT INTO perfectcourse.t_comment (user_id, video_id, content, createtime) VALUES (1, 1, '123123', '2018-09-27 14:35:20');