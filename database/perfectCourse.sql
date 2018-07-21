drop table if exists t_comment;

drop table if exists t_user;

drop table if exists t_video;

/*==============================================================*/
/* Table: t_comment                                             */
/*==============================================================*/
create table t_comment
(
   comment_id           varchar(50) not null,
   user_id              varchar(50) comment '这条评论属于哪个用户',
   video_id             varbinary(50) comment '这条评论在哪个视频底下',
   content              varchar(3000) comment '这条评论的内容',
   createtime           timestamp comment '这条评论生成的时间',
   primary key (comment_id)
);

alter table t_comment comment '每个视频下面的评论内容';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   user_id              varchar(50) not null,
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
   video_id             varbinary(50) not null,
   videoname            varchar(40) comment '视频的名称
            ',
   videodir             varbinary(600) comment '视频存放在项目中的那个目录，尽量使用相对目录',
   videoinfo            varbinary(2000) comment '对视频内容的说明',
   primary key (video_id)
);

alter table t_video comment '存放所有的教学视频';

alter table t_comment add constraint FK_comment_user foreign key (user_id)
      references t_user (user_id) on delete restrict on update restrict;

alter table t_comment add constraint FK_comment_video foreign key (video_id)
      references t_video (video_id) on delete restrict on update restrict;
