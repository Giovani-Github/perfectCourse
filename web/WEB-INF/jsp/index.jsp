<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="giovani" uri="http://giovani.com/common/" %>
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
    <link rel="stylesheet" href="<%=basePath%>lib/bootstrap-3.3.6/css/bootstrap.min.css">
    <link href="<%=basePath%>lib/flat-ui-master/css/flat-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>css/home.css">
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


                    <!--<ul class="dropdown-menu alreadyLog">-->
                    <!--<li>-->
                    <!--<a href="#">消息</a>-->
                    <!--</li>-->
                    <!--<li><a href="#">修改密码</a></li>-->
                    <!--<li><a href="#">退出登录</a></li>-->
                    <!--</ul>-->

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

    <!-- 主要内容 -->
    <div class="container gallery-container">

        <h1>精品课程</h1>

        <p class="page-description text-center">随堂录制的一些精彩部分的教学视频</p>

        <div class="per-gallery">


            <!-- 視頻展示列表 -->
            <div class="row">

                <c:forEach items="${videoPage.rows }" var="video">
                    <div class="col-sm-6  col-md-4">
                        <div class="thumbnail">
                            <a class="lightbox" href="<%=basePath%>page/toVideo.action?video_id=${video.video_id}">
                                <div class="courseBg text-center">
                                        ${video.videoname}

                                </div>
                            </a>
                            <div class="caption">
                                    <%--<h3>${video.videoname}</h3>--%>
                                <p>${video.videoinfo}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <!-- /視頻展示列表 -->

            <!-- 分页 -->
            <giovani:page url="${pageContext.request.contextPath }/page/toHome.action"/>

            <%--<ul class="pagination-plain pagination-perfecet">--%>
            <%--<c:forEach items="${videoPage.}">--%>
            <%--<li class="previous"><a href="#fakelink">上一页</a></li>--%>
            <%--<li><a href="#fakelink">1</a></li>--%>
            <%--<li><a href="#fakelink">2</a></li>--%>
            <%--<li><a href="#fakelink">3</a></li>--%>
            <%--<li><a href="#fakelink">4</a></li>--%>
            <%--<li class="active"><a href="#fakelink">5</a></li>--%>
            <%--<li><a href="#fakelink">6</a></li>--%>
            <%--<li><a href="#fakelink">7</a></li>--%>
            <%--<li><a href="#fakelink">8</a></li>--%>
            <%--<li><a href="#fakelink">9</a></li>--%>
            <%--<li><a href="#fakelink">10</a></li>--%>
            <%--<li class="next"><a href="#fakelink">下一页</a></li>--%>
            <%--</c:forEach>--%>
            <%--</ul>--%>

            <!-- /分页 -->
        </div>
    </div>
    <!-- /主要内容 -->

</div>

<script type="text/javascript" src="<%=basePath%>lib/jquery-2.1.4-dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
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
</div>
</body>
</html>