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