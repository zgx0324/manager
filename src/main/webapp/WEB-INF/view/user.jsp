<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<title>管理页面</title>
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
		$(function () {
			$("[name='frozen']").click(function () {
				var state = $(this).parent().find("[name='state']").val();
				var uid = $(this).parent().find("[name=uid]").val();
				if(confirm((state==1)?"确认冻结该账户？":"确认解冻该账户")){
					$.ajax({
						url:"${pageContext.request.contextPath}/user.do/frozen",
						data:{
							state:state,
							uid:uid,
						},
						success:function (data) {
							if(data!=null){
								alert(data)
								$("#frozen"+uid).html(state==1?"解冻账户":"冻结账户");
								$("#frozen"+uid).parent().find("[name='state']").val(0);
							}else{
								alert("操作失败")
							}
						}
					})
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


		<!--内容-->
		<div class="content">
			<div class="container-fluid">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="header">
								<h4 class="title">用户管理</h4>
								<p class="category">Here is a subtitle for this table</p>
								<form action="${pageContext.request.contextPath}/user.do/toUser" method="post">
									<div style="float:left;  width: 130px;">
										<select name="sState" class="form-control">
											<option value="-1">账号状态</option>
											<option value="1" ${userBean.sState==1?"selected":""}>未冻结</option>
											<option value="0" ${userBean.sState==0?"selected":""}>已冻结</option>
										</select>
									</div>

									<div style="float:left; margin:0 2px; width: 130px;">
										<input type="text" class="form-control" placeholder="查询用户名" size=8  name="sUserName" value="${userBean.sUserName}">
									</div>
									<div style="float:left; margin:0 2px; width: 65px;">
										<button type="submit"  class="btn btn-info btn-fill pull-right">查询</button>
									</div>
								</form>

							</div>
							<c:if test="${userBean.pageCount==0}"><br/><br/><div
									style="font-size: xx-large;height: 200px"><span style="line-height: 200px">对不起，您搜索的用户不存在...</span></div></c:if>
							<c:if test="${userBean.pageCount>0}">
							<div class="content table-responsive table-full-width">
								<table class="table table-hover table-striped">
									<thead>
									<th>姓名</th>
									<th>用户名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>电话</th>
									<th>邮箱</th>
									<c:if test="${admin.power==1}">
									<th>账户状态</th>
									</c:if>
									</thead>
									<tbody>
										<c:forEach items="${userList}" var="user">
											<tr  height="35px">
											<td>${user.name}</td>
											<td>${user.userName}</td>
											<td>${user.sex}</td>
											<td>${user.age}</td>
											<td>${user.tel}</td>
											<td>${user.email}</td>
											<c:if test="${admin.power==1}">
												<td style="font-size: 12px">
													<input type="hidden" name="uid" value="${user.uid}">
													<input type="hidden" name="state" value="${user.state}">
													<a href="JavaScript:;" name="frozen" id="frozen${user.uid}">${user.state==0?"解冻账户":"冻结账户"}</a>
												</td>
											</c:if>
										</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
							<!--分页-->
							<div style=" margin: 0 0 0px 50px;padding:0 0 20px 0; width: 70%;">
								<c:if test="${userBean.pageNow!=1}">
									<a href="${pageContext.request.contextPath}/user.do/toUser?pageNow=1&sUserName=${userBean.sUserName}&sState=${userBean.sState}">首页</a>
									<a href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${userBean.pageNow-1}&sUserName=${userBean.sUserName}&sState=${userBean.sState}">上一页</a>
								</c:if>


									<c:if test="${userBean.pageNow<=3}">
										<c:if test="${userBean.pageCount<5}">
											<c:forEach begin="1" end="${userBean.pageCount}" step="1" varStatus="vs" var="i">
												<a ${userBean.pageNow==vs.index?"style='color:gray;'":""} href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${userBean.pageNow-1}&sUserName=${userBean.sUserName}&sState=${userBean.sState}">【${vs.index}】</a>
											</c:forEach>
										</c:if>
										<c:if test="${userBean.pageCount>=5}">
											<c:forEach begin="1" end="5" step="1" varStatus="vs" var="i">
													<a ${userBean.pageNow==vs.index?"style='color:gray;'":""} href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${vs.count}&sUserName=${userBean.sUserName}&sState=${userBean.sState}">【${vs.count}】</a>
											</c:forEach>
										</c:if>
									</c:if>
									<c:if test="${userBean.pageNow>3 && userBean.pageNow<userBean.pageCount-2}">
										<c:forEach begin="${userBean.pageNow-2}" end="${userBean.pageNow+2}" step="1" varStatus="vs">
												<a ${userBean.pageNow==vs.index?"style='color:gray;'":""} href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${vs.index}&sUserName=${userBean.sUserName}&sState=${userBean.sState}">【${vs.index}】</a>
										</c:forEach>
									</c:if>
									<c:if test="${userBean.pageNow>=userBean.pageCount-2&&userBean.pageNow <= userBean.pageCount&&userBean.pageNow>3}">
										<c:forEach begin="${userBean.pageNow-2}" end="${userBean.pageCount}" step="1" varStatus="vs">
												<a ${userBean.pageNow==vs.index?"style='color:gray;'":""} href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${vs.index}&sUserName=${userBean.sUserName}&sState=${userBean.sState}">【${vs.index}】</a>
										</c:forEach>
									</c:if>



								<!--尾页-->
								<c:if test="${userBean.pageNow!=userBean.pageCount}">
									<a href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${userBean.pageNow+1}&sUserName=${userBean.sUserName}&sState=${userBean.sState}"> 【下一页】 </a>
									<a href="${pageContext.request.contextPath}/user.do/toUser?pageNow=${userBean.pageCount}&sUserName=${userBean.sUserName}&sState=${userBean.sState}"> 【末页】 </a>
								</c:if>
							</div>
							<!--跳页-->
							<form action="${pageContext.request.contextPath}/user.do/toUser?sUserName=${userBean.sUserName}&sState=${userBean.sState}" method="post">
								<div style=" float: right; margin:-50px 80px 0 0; width: 60px; height: 40px">
									<input type="number" id="skipNum" class="form-control" placeholder="页面"min="1"  name="pageNow" max="${userBean.pageCount}" >
								</div>
								<div style="float: right; margin:-50px 10px 0 0; width: 60px; height: 40px">
									<button type="submit"  class="btn btn-info btn-fill pull-right">跳转</button>
								</div>
							</form>
							</c:if>

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