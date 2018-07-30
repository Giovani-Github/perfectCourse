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

`2018年7月30日10:00:57`

* 评论功能完成

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

6. ajax请求后台数据正确写法

   `ajax:WEB-INF/jsp/video.jsp:253`

   ```WEB-INF/jsp/video.jsp:253
   // 请求服务器，进行评论创建
   $.ajax({
       type: 'POST',
       url: '<c:url value="/comment/comment.action" />',
       contentType: "application/json", // 必须告知内容类型为json
       dataType: 'json', // 制定服务器返回数据类型是json
       // 封装json对象，传给服务器
       data: JSON.stringify({
           comment_id: '',
           user_id: '${loginUser.user_id}',
           video_id: '${video.video_id}',
           content: oSize,
           createtime: now
       }),
       success:
           function (result) {
               alert(result.msg);
               if (result.code == 1)
                   window.location.reload(); // 刷新页面
           }
   })
   ```

   

   `java:com/giovani/perc/controller/CommentContorller.java:41`

   ```
   @RequestMapping(value = "comment", method = RequestMethod.POST)
   public void comment(@RequestBody Comment comment, HttpServletResponse response, HttpServletRequest request) {
       // @requestBody表示接受json对像，解析到commnet
   
       Map<String, String> msg = new HashMap<String, String>();
   
       try {
           if (request.getSession().getAttribute("loginUser") == null) {
               // 需要登陆后才能评论
               msg.put("msg", "请先登录");
               // 把数据转换成json字符串输出到前端页面
               response.getWriter().print(JSONUtils.toJSONString(msg));
               return;
           } else if (StringUtils.isEmpty(comment.getContent())) {
               // 评论内容不能为空
               msg.put("msg", "评论内容不能为空");
               response.getWriter().print(JSONUtils.toJSONString(msg));
               return;
           }
   
           // 创建评论
           commentService.addComment(comment);
   
           // 评论成功
           msg.put("msg", "评论成功");
           msg.put("code", "1");
           response.getWriter().print(JSONUtils.toJSONString(msg));
           return;
   
       } catch (IOException e) {
           e.printStackTrace();
       } catch (RuntimeException e) {
           // 创建评论过程中报错，说明评论创建不成功
           try {
               msg.put("msg", "评论失败");
               response.getWriter().print(JSONUtils.toJSONString(msg));
               return;
           } catch (IOException e1) {
               e1.printStackTrace();
           }
       }
   }
   ```

7. **页面调用js函数没反应**

   ###### ![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/Snipaste_2018-07-29_23-16-01.png)

![](https://raw.githubusercontent.com/Giovani-Github/Giovani-resource/master/markdown-resource/Snipaste_2018-07-29_23-18-14.png)

​	是因为`deleteComment(${comment.comment_id})`，括号内没有加`''`

8. **`ajax`提交`form`表单的操作**

   `html:WEB-INF/jsp/index.jsp:77`

   ```
   <form action="#" id="user" class="ontLog" method="post" enctype="multipart/form-data">
       <input name="username" type="text" class="form-control form-control-perfect ontLog"
              placeholder="用户名">
       <input name="password" type="password"
              class="form-control form-control-perfect ontLog"
              placeholder="密码">
       <button type="submit" id="login"
               class="btn btn-primary btn-xs btn-xs-perfect ontLog login-perfect">登录
       </button>
       <button type="submit" id="regist"
               class="btn btn-default btn-xs btn-xs-perfect right-perfect ontLog">
           注册
       </button>
   </form>
   ```

   `ajax:WEB-INF/jsp/index.jsp:155`

   ```
   // 用户注册
   $("#regist").on("click", function () {
       alert($('#user').serialize());
   
       $("#user").submit(function () {
           $.ajax({
               async: false,
               type: "POST",
               url: "<c:url value='/user/regist.action' /> ",
               data: $('#user').serialize(), // user是表单id，序列化后的格式:username=kingli&password=kingli
               dataType: "json", // 服务器返回的数据类型
               success: function (result) {
                   alert(result.msg)
               }
           })
       })
   });
   
   // 用户登录
   $("#login").on("click", function () {
       $("#user").submit(function () {
           $.ajax({
               async: false,
               type: "POST",
               url: "<c:url value='/user/login.action' /> ",
               data: $('#user').serialize(),
               dataType: "json", // 服务器返回的数据类型
               success: function (result) {
                   alert(result.msg)
                   if (result.code == 1) {
                       window.location.reload();
                   }
               }
           })
       })
   });
   ```
   `java:com/giovani/perc/controller/UserContorller.java:40`

   ```
   @RequestMapping(value = "regist", method = RequestMethod.POST)
   public void regist(User user, HttpServletResponse response) {
       Map<String, String> msg = new HashMap<>();
       try {
   
           userService.regist(user);
           msg.put("msg", "注册成功，可以进行登录");
           response.getWriter().print(JSONUtils.toJSONString(msg));
   
       } catch (UserException e) {
   
           try {
               msg.put("msg", e.getMessage());
               response.getWriter().print(JSONUtils.toJSONString(msg));
           } catch (IOException e1) {
               e1.printStackTrace();
           }
   
       } catch (IOException e) {
           e.printStackTrace();
       }
   }
   ```

9. **`ajax`提交数据时，要特别注意后台还有`ajax`所提交数据的格式，否则会访问不到后台**

