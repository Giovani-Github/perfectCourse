<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="giovani" uri="http://giovani.com/common/" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <a href="<%=basePath%>">
                        首页
                    </a>
                </li>
                <li class="active"><a href="<%=basePath%>toVideoList">教学视频</a></li>
                <li><a href="<%=basePath%>toDocList">相关资料</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="<c:url value=''/> " role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" id="nameSearch" name="videoname" type="search" placeholder="Search">
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
                        <span>
                           <c:choose>
                               <c:when test="${not empty loginUser}">${loginUser.username}</c:when>
                               <c:otherwise>登录</c:otherwise>
                           </c:choose>
                        </span>

                    </a>

                    <c:choose>
                        <c:when test="${not empty loginUser}">
                            <ul class="dropdown-menu alreadyLog">
                                <li><a href="#" onclick="logout();">退出登录</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="dropdown-menu ontLog">
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
                            </ul>
                        </c:otherwise>
                    </c:choose>

                </li>
            </ul>
        </div>
    </nav>
    <!--/ 导航栏-->

    <!-- 主要内容 -->
    <div class="container gallery-container">

        <h1>精品课程</h1>

        <%--<p class="page-description text-center">简介</p>--%>

        <div class="per-gallery">


            <!-- 視頻展示列表 -->
            <div class="row">

                <c:forEach items="${page.rows }" var="video">
                    <div class="col-sm-6  col-md-4">
                        <div class="thumbnail">
                            <a class="lightbox" href="<%=basePath%>toVideo?video_id=${video.video_id}">
                                <div class="courseBg text-center" style="font-size: 18px">
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
            <nav class="nav-pagination">
                <giovani:page url="${pageContext.request.contextPath }/"/>
            </nav>

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

    // 用户注册
    $("#regist").on("click", function () {

        $("#user").submit(function () {
            $.ajax({
                async: false,
                type: "POST",
                url: "<c:url value='/user/regist' /> ",
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
                url: "<c:url value='/user/login' /> ",
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

    // 退出登录
    function logout() {
        $.ajax({
            async: false,
            type: "POST",
            url: "<c:url value='/user/logout' /> ",
            dataType: "json", // 服务器返回的数据类型
            success: function (result) {
                alert(result.msg)
                if (result.code == 1) {
                    window.location.reload();
                }
            }
        })
    }
</script>
</div>
</body>
</html>