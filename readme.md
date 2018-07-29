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

`2018年7月29日09:28:00`

* 用户登录注册

### 项目错误总结

1. **页面静态资源加载问题**

   > 由[ssmDemo1](https://github.com/Giovani-Github/ssmDemo1)项目可以知道此问题解决方法

   但问题未解决，是因为jsp文件对css/js的导入方式不正确

   ![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/2018-07-21_165942.png)

   需改成：

   ![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/2018-07-21_170234.png)

2. **idea找不到request问题**

   需导入`tomcat/lib/servlet-api.jar`

3. **controller调用controller**

   ```
   @Controller
   @RequestMapping("user")
   public class UserContorller {
       @RequestMapping("regist")
       public String regist(User user) {
           return "redirect:/page/toHome.action";
       }
   }
   ```

   url地址首个字符需带上`/`否则会被认为是从当前controller跳转，即`user/page/toHome.action`

   带上`/`后才会正确:`page/toHome.aciton`

4. **`contorller`返回页面不成功，但不报错**

   使用的是`ajax`请求的`controller`，因为ajax特性是异步请求，所以不会刷新页面。所以就算`controller`成功返回页面，但前端页面也不会刷新

5. **`contorller`无法获得`form`表单传递的参数**

   `contorller`默认接收`get`方式提交的表单，而`form`表单设置成了`post`提交，自然无法获得表单提交的参数