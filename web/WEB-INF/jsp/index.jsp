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
    <title>C语言程序设计精品课程</title>
    <link rel="stylesheet" href="<%=basePath%>lib/bootstrap-3.3.6/css/bootstrap.min.css">
    <link href="<%=basePath%>lib/flat-ui-master/css/flat-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>css/home.css">
</head>
<body style="background: #fff">

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
                <li class="active">
                    <a href="<%=basePath%>">
                        首页
                    </a>
                </li>
                <li><a
                        href="<%=basePath%>toPdfDetails?fileName=0-课程定位">课程定位</a></li>
                <li><a
                        href="<%=basePath%>toPdfDetails?fileName=0-课程目标">课程目标</a></li>
                <li><a
                        href="<%=basePath%>toPdfDetails?fileName=0-《c语言程序设计》课程标准">课程标准</a></li>
                <li><a href="<%=basePath%>toVideoList">师资队伍</a></li>
                <li><a href="<%=basePath%>toDocList">相关资料</a></li>
                <li><a href="<%=basePath%>toVideoList">教学视频</a></li>
            </ul>
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
    <div class="row ">
        <div class="col-md-4">
            <img style="margin-left: 20px" src="../../images/logo.png" alt="" width="359px" height="91px">
        </div>
        <div class="col-md-8">
            <h3>C语言程序设计共享资源精品课程</h3>
        </div>
    </div>

    <p style=" margin-top: 10px; height: 2px; width: 2000px; background-color: #2b669a"></p>


    <div class="row">
        <div class="col-md-2" style="float: left">
            <p style="margin-left: 10px">搜索教学视频：</p>
            <div>
                <form class="navbar-form navbar-left" action="<c:url value=''/> " role="search">
                    <div class="form-group">
                        <div class="input-group">
                            <input class="form-control" id="nameSearch" name="videoname" type="search"
                                   placeholder="输入视频名称">
                            <span class="input-group-btn">
                              <button type="submit" class="btn"><span class="fui-search"></span></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>


            <div class="text-center" style="margin-left: 20px">
                <br>
                <br>
                <p><a
                        href="<%=basePath%>toPdfDetails?fileName=0-课程定位">课程定位</a></p>
                <p><a
                        href="<%=basePath%>toPdfDetails?fileName=0-课程目标">课程目标</a></p>
                <p><a
                        href="<%=basePath%>toPdfDetails?fileName=0-《c语言程序设计》课程标准">课程标准</a></p>
            </div>

            <img style="margin-left: 20px" src="../../images/c.jpg" alt="">
        </div>
        <div class="col-md-9 " style="padding-left: 60px">

            <style type="text/css">
                .tg {
                    border-collapse: collapse;
                    border-spacing: 0;
                    border-color: #999;
                }

                .tg td {
                    font-family: "Comic Sans MS", cursive, sans-serif !important;;
                    font-size: 22px;
                    padding: 8px 20px;
                    border-style: solid;
                    border-width: 1px;
                    overflow: hidden;
                    word-break: normal;
                    border-color: #999;
                    color: #444;
                    background-color: #F7FDFA;
                }

                .tg th {
                    font-family: "Comic Sans MS", cursive, sans-serif !important;;
                    font-size: 22px;
                    font-weight: normal;
                    padding: 8px 20px;
                    border-style: solid;
                    border-width: 1px;
                    overflow: hidden;
                    word-break: normal;
                    border-color: #999;
                    color: #fff;
                    background-color: #26ADE4;
                }

                .tg .tg-0e2w {
                    font-weight: bold;
                    font-size: 22px;
                    font-family: "Comic Sans MS", cursive, sans-serif !important;;
                    border-color: inherit;
                    text-align: center;
                    vertical-align: top
                }

                .tg .tg-i0bd {
                    font-size: 22px;
                    font-family: "Comic Sans MS", cursive, sans-serif !important;;
                    border-color: inherit;
                    text-align: left;
                    vertical-align: top
                }

                @media screen and (max-width: 767px) {
                    .tg {
                        width: auto !important;
                    }

                    .tg col {
                        width: auto !important;
                    }

                    .tg-wrap {
                        overflow-x: auto;
                        -webkit-overflow-scrolling: touch;
                    }
                }</style>
            <div class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-jfoo">项目</th>
                        <th class="tg-jfoo">教学单元</th>
                        <th class="tg-jfoo">单元教学资源</th>
                        <th class="tg-jfoo">教学视频</th>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块一：<br>C<br>语言概述</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3"></td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3" rowspan="5">模块二：C语言基础及顺序结构</td>
                        <td class="tg-eqm3">单元一：关键字与标识符</td>
                        <td class="tg-eqm3">1、教学设计<br>
                            2、电子教案：<br/>
                            <a href="<%=basePath%>toPdfDetails?fileName=1-关键字与标识符">关键字与标识符</a>
                            <br>3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <a class="lightbox" href="<%=basePath%>toVideo?video_id=5">
                                关键字与标识符
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">单元二：数据类型</td>
                        <td class="tg-eqm3">1、教学设计<br>
                            2、电子教案：<br/>
                            <a href="<%=basePath%>toPdfDetails?fileName=2-数据类型">数据类型</a>
                            <br/>
                            3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <a class="lightbox" href="<%=basePath%>toVideo?video_id=6">
                                数据类型
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">单元三：运算符</td>
                        <td class="tg-eqm3">1、教学设计<br>
                            2、电子教案：<br/>
                            <ol>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=3-C语言的运算符和表达式（算术运算符）">C语言的运算符和表达式（算术运算符）</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=4-C语言的运算符和表达式(关系运算符)">C语言的运算符和表达式(关系运算符)</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=5-C语言的运算符和表达式(逻辑运算符)">C语言的运算符和表达式(逻辑运算符)</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=6-C语言的运算符和表达式（赋值运算符）">C语言的运算符和表达式（赋值运算符）</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=7-C语言的运算符和表达式（条件运算符）">C语言的运算符和表达式（条件运算符）</a>
                                </li>
                                <li><a href="<%=basePath%>toPdfDetails?fileName=8-C语言的运算符和表达式(逗号与强制类型转换运算符)">C语言的运算符和表达式(逗号与强制类型转换运算符)</a>
                                </li>
                            </ol>
                            <br/>
                            3、习题作业
                        <td class="tg-eqm3">
                            <ol>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=7">
                                        运算符-算术运算符
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=8">
                                        运算符——关系运算符
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=9">
                                        运算符——逻辑运算符
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=10">
                                        运算符——赋值运算符
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=11">
                                        运算符——条件运算符
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=12">
                                        运算符——逗号与类型转换
                                    </a>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">单元四：输入与输出</td>
                        <td class="tg-eqm3">1、教学设计<br>
                            2、电子教案：<br/>
                            <a href="<%=basePath%>toPdfDetails?fileName=9-输入与输出">输入与输出</a>
                            <br/>
                            3、习题作业
                        <td class="tg-eqm3">
                            <a class="lightbox" href="<%=basePath%>toVideo?video_id=13">
                                输入输出
                            </a>
                        </td>

                    </tr>
                    <tr>
                        <td class="tg-eqm3">单元五：顺序结构的程序设计</td>
                        <td class="tg-eqm3">1、教学设计<br>2、电子教案<br>3、习题作业</td>
                        <td class="tg-eqm3"></td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块三：选择结构程序设计</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3">
                            1、教学设计<br>
                            2、电子教案：<br/>
                            <ol>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=10-选择结构程序设计——if 语句的三种结构">选择结构程序设计——if
                                        语句的三种结构</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=11-选择结构程序设计——if的嵌套结构">选择结构程序设计——if的嵌套结构</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=12-选择结构程序设计——switch语句pptx">选择结构程序设计——switch语句</a>
                                </li>

                            </ol>
                            <br/>
                            3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <ol>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=14">
                                        选择结构——if的三种结构
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=15">
                                        选择结构——if的嵌套结构
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=16">
                                        选择结构——switch语句
                                    </a>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块四：循环结构程序设计</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3">
                            1、教学设计<br>
                            2、电子教案：
                            <ol>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=13-循环结构的程序设计——循环概述">循环结构的程序设计——循环概述</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=14-循环结构程序设计——三种循环语句">循环结构程序设计——三种循环语句</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=15-循环结构程序设计——循环设计方法">循环结构程序设计——循环设计方法</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=16-循环结构的程序设计——多重循环">循环结构的程序设计——多重循环</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=17-循环结构的程序设计——常用的循环算法">循环结构的程序设计——常用的循环算法</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=18-循环结构的程序设计——break与continue语句">循环结构的程序设计——break与continue语句</a>
                                </li>
                            </ol>
                            3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <ol>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=17">
                                        循环结构——循环概述
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=18">
                                        循环结构——三种循环语句while、do-while、for
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=19">
                                        循环结构——循环的设计方法
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=20">
                                        循环结构——多重循环
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=21">
                                        循环结构——常见循环算法
                                    </a>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块五：数组</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3">
                            1、教学设计<br>
                            2、电子教案：
                            <ol>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=19-数组——一维数组">数组——一维数组</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=20-数 组——二维数组">数 组——二维数组</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=21数 组——查找">数 组——查找</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=22-数 组——字符串函数">数 组——字符串函数</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=23-数 组——字符数组">数 组——字符数组</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=24数 组——排序">数组——排序</a>
                                </li>
                            </ol>
                            3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <ol>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=22">
                                        数组——一维数组
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=23">
                                        数组——二维数组
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=24">
                                        数组——数组的应用实例查找
                                    </a>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块六：指针</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3"></td>
                    </tr>
                    <tr>
                        <td class="tg-eqm3">模块七：结构体</td>
                        <td class="tg-eqm3"></td>
                        <td class="tg-eqm3">
                            1、教学设计<br>
                            2、电子教案：
                            <ol>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=25函数——模块化的程序设计概述">函数——模块化的程序设计概述</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=26-函数——函数概述">函数——函数概述</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=27函数——函数的参数传递方式与函数返回值">函数——函数的参数传递方式与函数返回值</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=28-函数——变量的作用域与存储类别">函数——变量的作用域与存储类别</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>toPdfDetails?fileName=29-函数——编译预处理">函数——编译预处理</a>
                                </li>

                            </ol>
                            3、习题作业
                        </td>
                        <td class="tg-eqm3">
                            <ol>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=25">
                                        函数——模块化的程序设计方法概述
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=26">
                                        函数——函数概述
                                    </a>
                                </li>
                                <li>
                                    <a class="lightbox" href="<%=basePath%>toVideo?video_id=27">
                                        函数——变量的作用域与存储类别
                                    </a>
                                </li>
                            </ol>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <!-- /主要内容 -->
</div>

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