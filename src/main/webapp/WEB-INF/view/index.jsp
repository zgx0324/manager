<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>管理页面</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath}/css/animate.min.css"
	rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link
	href="${pageContext.request.contextPath}/css/light-bootstrap-dashboard.css"
	rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="${pageContext.request.contextPath}/css/demo.css"
	rel="stylesheet" />


<!--     Fonts and icons     -->

<link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css"
	rel="stylesheet" />

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
					<a class="navbar-brand" href="${pageContext.request.contextPath}/admin.do/index">后台管理系统</a>
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
						<div class="card">
							<div class="header">
								<h4 class="title">主页</h4>
								<p class="category">====================</p>
							</div>
							<div style="width: 800px; height: 400px;"></div>
						</div>
					</div>
				</div>
			</div>




			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>
					<li><a href="#"> 浏览效果界面 </a></li>
					<li><a href="#"> Company </a></li>
					<li><a href="http://localhost:8080/"> Tomcat管理页 </a></li>
					<li><a href="#"> 微博 </a></li>
				</ul>
				</nav>
				<p class="copyright pull-right">
					&copy; 2017 当前累计登陆访问次数 ： <a href="#" target="_blank" title="联系我们">
						${applicationScope.visited}</a> - 统计来自 <a href="#" title="爱尚实训" target="_blank">爱尚教育</a>
				</p>
			</div>
			</footer>
		</div>
	</div>


</body>

<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/js/bootstrap-notify.js"></script>


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script
	src="${pageContext.request.contextPath}/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>

<script type="text/javascript">
var msg=null;
	if("${sessionScope.admin.power}"==1){
		msg="欢迎您 <b>超级管理员</b>";
	}else if("${sessionScope.admin.power}"==0){
		msg="欢迎您 <b>管理员</b>";
	}
	$(document).ready(function() {

		demo.initChartist();

		$.notify({
			icon : 'pe-7s-gift',
			message : msg

		}, {
			type : 'info',
			timer : 4000
		});

	});
</script>

</html>