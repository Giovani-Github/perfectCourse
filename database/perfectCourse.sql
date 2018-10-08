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
CREATE TABLE perfectcourse.t_doc
(
    doc_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    docname varchar(40) COMMENT '视频的名称
            ',
    docdir varchar(600) COMMENT '视频存放在项目中的那个目录，尽量使用相对目录',
    docinfo varchar(2000) COMMENT '对视频内容的说明',
    filename varchar(40),
    filetype varchar(40)
);
INSERT INTO perfectcourse.t_doc (docname, docdir, docinfo, filename, filetype) VALUES ('demo', 'pdf', 'demodemo', 'demo', '.pdf');
CREATE TABLE perfectcourse.t_user
(
    user_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username varchar(30),
    password varchar(40)
);
INSERT INTO perfectcourse.t_user (username, password) VALUES ('giovani', '123');
CREATE TABLE perfectcourse.t_video
(
    video_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    videoname varchar(40) COMMENT '视频的名称
            ',
    videodir varchar(600) COMMENT '视频存放在项目中的那个目录，尽量使用相对目录',
    videoinfo varchar(2000) COMMENT '对视频内容的说明',
    filename varchar(40),
    filetype varchar(40)
);
INSERT INTO perfectcourse.t_video (videoname, videodir, videoinfo, filename, filetype) VALUES ('java', 'video', 'javajava', 'bb', '.webm');