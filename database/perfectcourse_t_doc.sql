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