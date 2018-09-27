drop table if exists t_comment;

drop table if exists t_doc;

drop table if exists t_user;

drop table if exists t_video;

/*==============================================================*/
/* Table: t_comment                                             */
/*==============================================================*/
create table t_comment
(
   comment_id           integer not null auto_increment,
   user_id              integer comment '这条评论属于哪个用户',
   video_id             integer comment '这条评论在哪个视频底下',
   content              varchar(3000) comment '这条评论的内容
            ',
   createtime           timestamp comment '这条评论生成的时间',
   primary key (comment_id)
);

alter table t_comment comment '每个视频下面的评论内容';

/*==============================================================*/
/* Table: t_doc                                                 */
/*==============================================================*/
create table t_doc
(
   doc_id               integer not null auto_increment,
   docname              varchar(40) comment '视频的名称
            ',
   docdir               varchar(600) comment '视频存放在项目中的那个目录，尽量使用相对目录',
   docinfo              varchar(2000) comment '对视频内容的说明',
   filename             varchar(40),
   filetype             varchar(40),
   primary key (doc_id)
);

alter table t_doc comment 'pdf文档文件';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   user_id              integer not null auto_increment,
   username             varchar(30),
   password             varchar(40),
   primary key (user_id)
);

alter table t_user comment '用户数据表';

/*==============================================================*/
/* Table: t_video                                               */
/*==============================================================*/
create table t_video
(
   video_id             integer not null auto_increment,
   videoname            varchar(40) comment '视频的名称
            ',
   videodir             varchar(600) comment '视频存放在项目中的那个目录，尽量使用相对目录',
   videoinfo            varchar(2000) comment '对视频内容的说明',
   filename             varchar(40),
   filetype             varchar(40),
   primary key (video_id)
);

alter table t_video comment '存放所有的教学视频';

alter table t_comment add constraint FK_comment_user foreign key (user_id)
      references t_user (user_id) on delete restrict on update restrict;

alter table t_comment add constraint FK_comment_video foreign key (video_id)
      references t_video (video_id) on delete restrict on update restrict;
