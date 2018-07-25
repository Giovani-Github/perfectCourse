<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>精品课程</title>
    <!-- Loading Flat UI -->
    <link rel="stylesheet" href="<%=basePath%>lib/bootstrap-3.3.6/css/bootstrap.min.css">
    <link href="<%=basePath%>lib/flat-ui-master/css/flat-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>css/video.css">
</head>
<body>


<div class="perfect-container">
    <!-- 导航栏 -->
    <nav class="navbar navbar-inverse navbar-embossed navbar-lg navbar-perfect" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-7">
                <span class="sr-only">Toggle navigation</span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse-7">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<%=basePath%>page/toHome.action">
                        首页
                    </a>
                </li>
                <li class="active"><a href="#">课程管理</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="#" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" id="navbarInput-01" type="search" placeholder="Search">
                        <span class="input-group-btn">
                              <button type="submit" class="btn"><span class="fui-search"></span></button>
                            </span>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right navbar-right-perfect">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle dropdown-toggle-perfect" data-toggle="dropdown">
                        <img class="img-circle img-circle-perfect" src="<%=basePath%>images/aa.png"/>
                        <span>登录</span>
                    </a>


                    <%--<ul class="dropdown-menu alreadyLog">--%>
                    <%--<li>--%>
                    <%--<a href="#">消息</a>--%>
                    <%--</li>--%>
                    <%--<li><a href="#">修改密码</a></li>--%>
                    <%--<li><a href="#">退出登录</a></li>--%>
                    <%--</ul>--%>

                    <ul class="dropdown-menu ontLog">
                        <form id="user" class="ontLog" method="post" enctype="multipart/form-data">
                            <input name="username" type="text" class="form-control form-control-perfect ontLog"
                                   placeholder="用户名">
                            <input name="password" type="password" class="form-control form-control-perfect ontLog"
                                   placeholder="密码">
                            <button type="submit" id="login"
                                    class="btn btn-primary btn-xs btn-xs-perfect ontLog login-perfect"
                                    onclick="login();">登录
                            </button>
                            <button type="submit" id="regist"
                                    class="btn btn-default btn-xs btn-xs-perfect right-perfect ontLog"
                                    onclick="regist();">
                                注册
                            </button>
                        </form>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--/ 导航栏-->

    <!-- main content -->
    <div class="container gallery-container">

        <h1>${video.videoname}</h1>

        <p class="page-description text-center">${video.videoinfo}</p>

        <!-- video -->
        <div class="per-gallery">

            <div class="video-perfect">
                <video class="video-js" preload="auto" poster="docs/assets/img/video/poster.jpg" data-setup="{}">
                    <source src="<%=basePath%>${video.videodir}/${video.filename}${video.filetype}" type="video/webm">
                    <!--<source src="http://iurevych.github.com/Flat-UI-videos/big_buck_bunny.webm" type="video/webm">-->
                </video>
            </div>
        </div>
        <!-- /video -->

        <div class="commentAll">
            <!--评论区域 begin-->
            <div class="reviewArea clearfix">
                <!-- 此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件 -->
                <textarea class="content comment-input" placeholder="Please enter a comment&hellip;"
                          onkeyup="keyUP(this)"></textarea>
                <a href="javascript:;" class="plBtn right-perfect">评论</a>
            </div>
            <!--评论区域 end-->
            <!--评论展现 回复区域 begin-->
            <div class="comment-show">

            </div>
            <!-- 评论展现 回复区域 end-->
        </div>

    </div>
    <!--/main content-->
</div>

<script type="text/javascript" src="<%=basePath%>lib/jquery-2.1.4-dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/jqueryFlexText/jquery.flexText.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/video/js/video.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>js/video.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/jquery.form.js"></script>


<script type="text/javascript">
    $("#regist").on("click", function () {
        $('#user').ajaxSubmit(      //ajax方式提交表单
            {
                url: '/perfectCourse/user/regist.action',
                type: 'get',
                dataType:
                    'json',
                success:

                    function (data) {
                        alert(data);
                    }
            })
        ;
    });
</script>

<script>
    // videojs.options.flash.swf = "lib/video/js/video-js.swf"
</script>
</body>
</html>