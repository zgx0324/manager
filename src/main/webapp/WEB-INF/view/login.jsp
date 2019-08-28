<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="application/x-javascript">






        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }






    </script>
    <meta name="keywords"
          content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel='stylesheet' type='text/css' />

    <script type="text/javascript">
        $(function() {
            var passWord = $("[name='passWord']");
            var userName = $("[name='userName']");
            var arr = document.cookie.split("; ");
            var name = "";
            var pass="";
            for (var i = 0; i < arr.length; i++) {
                var arr2 = arr[i].split("=");
                if (arr2[0] == "adminName") {
                    name = decodeURI(arr2[1]);
                    userName.val(name);
                }
                if (arr2[0] == "adminWord") {
                    pass = decodeURI(arr2[1]);
                    passWord.val(pass);
                }

            }

            $("#userName").blur(function() {
                if (userName.val() == '') {
                    userName.val(name);
                }
            });
            $("#passWord").blur(function() {
                if (passWord.val() == '') {
                    passWord.val(pass);
                }
            });
            $("#sub").click(function () {
                if(passWord.val().trim()!="" && userName.val().trim()!=""){
                    $("#form").submit();
                }else{
                    alert("请填写用户名及密码")
                }
            })

        });
    </script>
</head>
<body>
<!--SIGN UP-->
<h1 style="font-family: '方正华隶简体'; color: #0e4277;">管理员登陆</h1>
<div class="login-form">
    <div class="close"></div>
    <div class="head-info">
        <label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
            class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar">
        <img src="${pageContext.request.contextPath}/images/avtar.png" />
    </div>
    <form action="${pageContext.request.contextPath}/doLogin" method="post">
        <input type="text" class="text" id="userName" name="userName" onfocus="this.value = '';">
        <div class="key">
            <input type="password" name="passWord" id="passWord" onfocus="this.value = '';">
        </div>
        <c:set var="check" value=""></c:set>
        <%--后台验证--%>
        <c:if test="${!empty msg}">
            <div class="text" style="color: gray;">您输入的用户名或密码有误</div>
        </c:if>
        <input type="checkbox" class="text" name="remember" value="remember" ${empty cookie.passWord.value? "":"checked"} /><i
            style="color: #9199aa;">一周内免登陆</i>
        <div class="signin">
            <input type="submit" value="Login" id="sub">
        </div>
    </form>
</div>
<div class="copy-rights">
    <p>
        Copyright &copy; 2015.Company name All rights reserved.More Templates
        <a href=# target="_blank" title="#">#</a> - Collect from <a href=#
                                                                    title=# target="_blank">#</a>
    </p>
</div>

</body>
</html>