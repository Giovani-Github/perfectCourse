### 项目简介

精品课程，主要功能在于教程视频的播放，以及可在每段教学视频下做评论。



### 项目完成进度记录

**目前前端页面功能如下**:   

`2018年7月21日12:11:21`

* 视频列表分页展示
* 视频播放
* 视频搜索
* 用户登录
* 各视频底部评论区

**目前后台功能完成如下**：

`2018年7月21日12:12:33`

* 未完成

`2018年7月23日11:33:56`

* 视频列表分页展示

`2018年7月25日10:38:24`

* 视频播放

### 项目错误总结

1. 页面静态资源加载问题

   > 由[ssmDemo1](https://github.com/Giovani-Github/ssmDemo1)项目可以知道此问题解决方法

   但问题未解决，是因为jsp文件对css/js的导入方式不正确

   ![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/2018-07-21_165942.png)

   需改成：

   ![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/2018-07-21_170234.png)

2. idea找不到request问题

   需导入`tomcat/lib/servlet-api.jar`





