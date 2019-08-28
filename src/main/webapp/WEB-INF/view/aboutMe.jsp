<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <title>个人信息</title>
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Animation library for notifications   -->
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" />
    <!--  Light Bootstrap Table core CSS    -->
    <link href="${pageContext.request.contextPath}/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript">
    var flag=true;
    $(function () {
        $("#userName").change(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/admin.do/checkUserName",
                data:{
                    userName: $("#userName").val()
                },
                success:function (data) {
                    if(data=="ok"){
                        $("#recMsg").html("该用户名可以使用")
                        $("#recMsg").attr("style","color:green;")
                        flag=true;
                    }else{
                        $("#recMsg").html("该用户名已存在")
                        $("#recMsg").attr("style","color:red;")
                        flag=false;
                    }
                }
            })

        })
        $("#sub").click(function () {
            if(/^\w{6,10}$/.test($("[name='passWord']").val())&&flag){
                $.ajax({
                    url:"${pageContext.request.contextPath}/admin.do/updateAdmin",
                    data:{
                        userName:$("#userName").val(),
                        passWord:$("[name='passWord']").val(),
                        power:$("[name='power']").val(),
                        adminID:"${admin.adminID}"
                    },
                    success:function (data) {
                        if(data=="ok"){
                            alert("修改成功")
                        }else{
                            alert("修改失败")
                        }
                    }
                })
            }else{
                alert("请输入6-10位非汉字的密码")
            }
        })
    })
</script>





</head>
<body>

<div class="wrapper">




    <div class="sidebar" data-color="grow"
         data-image="${pageContext.request.contextPath}/images/sidebar-5.jpg">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text"> <img
                        src="${pageContext.request.contextPath}/images/logo.png">
                </a>
            </div>

            <ul class="nav">
                <li><a
                        href="${pageContext.request.contextPath}/admin.do/aboutMe">
                    <i class="pe-7s-user"></i>
                    <p>个人信息</p>
                </a></li>
                <li><a
                        href="${pageContext.request.contextPath}/product.do/toProduct">
                    <i class="pe-7s-news-paper"></i>
                    <p>商品管理</p>
                </a></li>
                <li><a
                        href="${pageContext.request.contextPath}/product.do/addProduct">
                    <i class="pe-7s-science"></i>
                    <p>商品上传</p>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/user.do/toUser">
                    <i class="pe-7s-note2"></i>
                    <p>用户管理</p>
                </a></li>
                <c:if test="${sessionScope.admin.power==1}">
                    <li><a href="${pageContext.request.contextPath}/admin.do/toManager">
                        <i class="pe-7s-note2"></i>
                        <p>管理员管理</p>
                    </a></li>

                    <li><a
                            href="${pageContext.request.contextPath}/admin.do/addManager">
                        <i class="pe-7s-map-marker"></i>
                        <p>添加管理员</p>
                    </a></li>
                </c:if>
                <li><a
                        href="${pageContext.request.contextPath}/category.do/toCategory">
                    <i class="pe-7s-bell"></i>
                    <p>类目管理</p>
                </a></li>

                <li><a
                        href="${pageContext.request.contextPath}/order.do/toOrder">
                    <i class="pe-7s-bell"></i>
                    <p>订单管理</p>
                </a></li>


                <li class="active-pro"><a
                        href="#"> <i
                        class="pe-7s-rocket"></i>
                    <p>购买专业版</p>
                </a></li>
            </ul>
        </div>
    </div>


    <div class="main-panel">

        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index">后台管理系统</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="dropdown"><a
                                href="${pageContext.request.contextPath}/#"
                                class="dropdown-toggle" data-toggle="dropdown"> <i
                                class="pe-7s-graph">消息</i> <b class="caret"></b> <span
                                class="notification">5</span>
                        </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/#">Notification
                                    1</a></li>
                                <li><a href="${pageContext.request.contextPath}/#">Notification
                                    2</a></li>
                                <li><a href="${pageContext.request.contextPath}/#">Notification
                                    3</a></li>
                                <li><a href="${pageContext.request.contextPath}/#">Notification
                                    4</a></li>
                                <li><a href="${pageContext.request.contextPath}/#">Another
                                    notification</a></li>
                            </ul></li>


                    </ul>

                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="${pageContext.request.contextPath}/outLogin">
                            安全退出 </a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">个人信息</h4>
                            </div>
                            <div class="content">
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>管理权限</label>
                                                <select name="power" class="form-control" ${admin.power==1?"":"disabled"}>
                                                    <option value="1" ${admin.power==1?"selected":""}>超级管理员</option>
                                                    <option value="0" ${admin.power==0?"selected":""}>普通管理员</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>用户名</label>
                                                <input type="text" class="form-control" id="userName" placeholder="真实姓名" name="userName" value="${admin.userName}">
                                                <span id="recMsg"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>密码</label>
                                                <input type="password" class="form-control" placeholder="不能为汉字" name="passWord" value="${admin.passWord}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>创建日期</label>
                                                <input type="text" class="form-control" value="${admin.date}" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>

                                    <button  class="btn btn-info btn-fill pull-right" id="sub">修改</button>
                                    <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>



                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/images/userleft.bg.jpg" alt="/newsSystem."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                    <a href="#">

                                        <img class="avatar border-gray" src="${pageContext.request.contextPath}/images\faces\face-3.jpg" alt=""/>




                                        <h4 class="title">尊敬的管理员<br /></h4>
                                    </a>
                                </div>
                                <p class="description text-center"> 欢迎使用 <br>
                                    爱尚微购后台管理系统<br>
                                </p>
                            </div>
                            <hr>
                            <div class="text-center">
                                <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>



        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                浏览效果界面
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="http://localhost:8080/">
                                Tomcat管理页
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                微博
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; 2017  当前累计登陆访问次数 ： <a href="#" target="_blank" title="联系我们"> 623</a> - 统计来自 <a href="#" title="爱尚实训" target="_blank">爱尚教育</a>
                </p>
            </div>
        </footer>

    </div>
</div>


</body>

<!--   Core JS Files   -->

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<!--  Checkbox, Radio & Switch Plugins -->
<script src="${pageContext.request.contextPath}/js/bootstrap-checkbox-radio-switch.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/js/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/js/bootstrap-notify.js"></script>
<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script	src="${pageContext.request.contextPath}/js/light-bootstrap-dashboard.js"></script>
<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
</html>