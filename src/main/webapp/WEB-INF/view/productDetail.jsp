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

    <title>商品详情</title>

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
    <style type="text/css">
        .new-contentarea {
            width: 100%;
            overflow: hidden;
            margin: 0 auto;
            position: relative;
        }

        .new-contentarea label {
            width: 100%;
            height: 100%;
            display: block;
        }

        .new-contentarea input[type=file] {
            width: 188px;
            height: 60px;
            background: #333;
            margin: 0 auto;
            position: absolute;
            right: 50%;
            margin-right: -94px;
            top: 0;
            right /*\**/: 0px\9;
            margin-right /*\**/: 0px\9;
            width /*\**/: 10px\9;
            opacity: 0;
            filter: alpha(opacity = 0);
            z-index: 2;
        }

        a.upload-img {
            width: 165px;
            display: inline-block;
            margin-bottom: 10px;
            height: 57px;
            line-height: 57px;
            font-size: 20px;
            color: #FFFFFF;
            background-color: #f38e81;
            border-radius: 3px;
            text-decoration: none;
            cursor: pointer;
        }

        a.upload-img:hover {
            background-color: #ec7e70;
        }

        .tc {
            text-align: center;
        }
    </style>
    <link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css"
          rel="stylesheet" />
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/XMLHttpRequest.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#ssb").click(
                function() {
                    editor.updateElement();
                    //将上传内容部分先将&nbsp用""替换;然后用""替换" "然后用""替换"\n"最后为<p></p>
                    var content = $("#content").val();
                    var re = new RegExp("&nbsp;", "g");
                    var content_flag = content.replace(re, "");
                    re = new RegExp(" ", "g");
                    content_flag = content_flag.replace(re, "");
                    re = new RegExp("\n", "g");
                    content_flag = content_flag.replace(re, "");

                    var ctid = $("[name='ctid']").val();
                    var stock = $("[name='stock']").val();
                    var shopPrice = $("[name='shopPrice']").val();
                    var marketPrice = $("[name='marketPrice']").val();
                    var pName = $("#pName").val();
                    if (pName == null || pName.trim() == "") {
                        alert("请填写商品名");
                        $("#ssb").attr("type", "button");
                    }else if(ctid ==-1){
                        alert("请选择商品具体类目");
                        $("#ssb").attr("type", "button");
                    } else if(stock ==""){
                        alert("请填写商品库存");
                        $("#ssb").attr("type", "button");
                    } else if(!/^\d{0,6}.\d$/.test(shopPrice)){
                        alert("请以保留一位小数的形式填写市场价");
                        $("#ssb").attr("type", "button");
                    }else if(!/^\d{0,6}.\d$/.test(marketPrice)){
                        alert("请以保留一位小数的形式填写促销价");
                        $("#ssb").attr("type", "button");
                    } else if ($("#content").val() == null
                        || content_flag == "<p></p>") {
                        alert("请填写内容");
                        $("#ssb").attr("type", "button");
                    } else {
                        $("#ssb").attr("type", "submit");
                    }
                });
        });
    </script>

    <script type="text/javascript">
        //动态图片标签的id
        var i = 0;
        //点击添加file上传标签
        function addFile() {
            i = i + 1;
            if (i <= 10) {

                $("#innerFile")
                    .append(
                        "<img id='img"+i+"' src='' width='106' alt=''><span id='button"+i+"'></span>");
                $("#innerFile")
                    .append(
                        "<input type='file' id='file"
                        + i
                        + "' name='pic' class='form-control' onchange='changepic("
                        + i + ")' accept='image/*'/>");
            } else {
                alert("对不起本条新闻最多上传10张图片");
            }
        }


        //回显图片
        function changepic(i) {
            var filePath = $("#file" + i).val();
            if (filePath != null && filePath != "") {
                filePath = filePath.substring(filePath.lastIndexOf("."))
                    .toLowerCase();
                if (filePath != ".png" && filePath != ".jpg" && filePath != ".jpeg"
                        && filePath != ".gif" && filePath != "") {
                    alert('上传错误,文件格式必须为：png/jpg/jpeg/gif');
                    $("#file" + i).val("");
                    return;
                }
                var reads = new FileReader();
                f = document.getElementById('file' + i).files[0];
                reads.readAsDataURL(f);
                reads.onload = function(e) {
                    document.getElementById('img' + i).src = this.result;
                    if ($("#b" + i).val() == null || $("#b" + i).val() == "") {
                        $("#button" + i).append(
                            "<button type='button' id='b" + i
                            + "'onclick='delPic(" + i + ")' value='b"
                            + i + "'>移除</button>");
                    }

                };
            } else {
                $("#img" + i).remove();
                $("#button" + i).remove();
            }
        }
        //移除图片
        function delPic(i) {
            if(i!=0){
                $("#button" + i).remove();
                $("#file" + i).remove();
                $("#img" + i).remove();
            }else {
                $("#button" + i).remove();
                $("#file" + i).val("");
                $("#img" + i).attr("src","");
            }

        }
        //移除修改图片
        function movePic(i) {
            if (confirm("确认移除该图片吗？")) {
                $.ajax({
                        url : "${pageContext.request.contextPath}/product.do/delPic",
                        type : "get",
                        dataType : "text",
                        data : {
                            imageID : i,
                            path:$("#button"+i).find("input").val()
                        },
                        success : function(data) {
                            if (data == "ok") {
                                $("#span" + i).remove();
                            }
                        }
                    });

            }
        }
        //移除缩略图
        $(function () {
            $("#but0").click(function () {
                if(confirm("确认移除缩略图吗？")){
                    $.ajax({
                        url : "${pageContext.request.contextPath}/product.do/delSuolue",
                        data : {
                            pid : $("#but0").find("[name='delPid']").val(),
                            imgPath:$("#but0").find("[name='delPath']").val()
                        },
                        success : function(data) {
                            if(data=="ok"){
                                location.reload()
                            }else {
                                alert("删除失败")
                            }

                        }
                    });
                }
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            $("[name='cid']").change(function () {
                if ($(this).val() != -1) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/category.do/SecondCategory",
                        dataType: "json",
                        data: {
                            cid: $(this).val()
                        },
                        success: function (data) {
                            $("[name='csid']").html("")
                            $("[name='ctid']").html("")
                            $("[name='csid']").append(
                                "<option value='-1'>二级类目</option>"
                            )
                            var dataobj = eval(data);//能把字符串转成js的对象
                            $.each(
                                dataobj, function (key, val) {
                                    var csid = val.csid;
                                    var name = val.csname;
                                    $("[name='csid']").append(
                                        "<option value='" + csid + "' >" + name + "</option>"
                                    )
                                });
                        }
                    })
                }
                $("[name='csid']").change(function () {
                    if($(this).val()!=-1){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/categorySecond.do/thirdCategory",
                            dataType:"json",
                            data:{
                                csid:$(this).val()
                            },
                            success:function (data) {
                                $("[name='ctid']").html("")
                                $("[name='ctid']").append(
                                    "<option value='-1'>三级类目</option>"
                                )
                                var dataobj = eval(data);//能把字符串转成js的对象
                                $.each(
                                    dataobj,function(key, val) {
                                        var ctid = val.ctid;
                                        var name = val.ctname;
                                        $("[name='ctid']").append(
                                            "<option value='"+ctid+"' >"+name+"</option>"
                                        )
                                    });
                            }
                        })
                    }
                })

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
                    <div class="col-md-8">
                        <div class="card">
                            <form action="${pageContext.request.contextPath}/product.do/update"
                                    method="post" enctype="multipart/form-data">
                                <div class="header">
                                    <h4 class="title">商品详情</h4>
                                    <input type="hidden" name="pid" value="${product.pid}">
                                    <input type="hidden" name="isHot" value="${product.isHot}">
                                </div>
                                <div class="content">

                                    <div class="col-md-8">
                                        <div class="form-group">

                                            <label>图片文件</label>
                                            <p>
                                                <button id="addFlie" type="button" onclick="addFile()">添加图片</button>
                                                <c:if test="${!empty param.msg}">
                                                    <font color="red">${param.msg=='singleTooBig'?'某个文件内存超限':'文件总量内存超限'}</font>
                                                </c:if>
                                                <c:if test="${!empty param.Picmsg}">
                                                    <font color="red">上传文件格式与图片不符</font>
                                                </c:if>
                                            </p>
                                            <c:forEach items="${images}" var="image">
                                                <c:if test="${!empty image.imageID}">
                                                    <div>
															<span id="span${image.imageID}">
                                                                <img width="106px" id="image${image.imageID}" src="${pageContext.request.contextPath}${image.path}">
																<button id='button${image.imageID}' type='button' onclick='movePic("${image.imageID}")'>
                                                                    <input type="hidden" value="${image.path}"/>移除</button>
																<p>${image.name}</p></span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <span id="innerFile"></span>
                                            <span id="suolue">
                                                  <p>商品缩略图</p>
                                                    <img id='img0' src='${pageContext.request.contextPath}${product.imgPath}' width='106' alt=''>
                                                    <span id="button0"></span>
                                                    <c:if test="${!empty product.imgPath}">
                                                        <button id='but0' type="button">移除
                                                        <input type="hidden" name="delPid" value="${product.pid}"/>
                                                        <input type="hidden" name="delPath" value="${product.imgPath}"/></button>
                                                    </c:if>

                                                    <input type="file" id="file0" name="suolue" onchange="changepic(0)" accept='image/*'>




                                            </span>

                                        </div>
                                    </div>

                                    <div>


                                        <div class="col-md-2">
                                            <div class="form-group" style="width: 170px">
                                                <label>商品类目</label>
                                                <select name="cid" class="form-control">
                                                    <option value="-1">一级类目</option>
                                                    <c:forEach items="${CategoryList}" var="category">
                                                        <option value="${category.cid}" ${product.cid==category.cid?"selected":""}>${category.cname}</option>
                                                    </c:forEach>
                                                </select>
                                                <select name="csid" class="form-control">
                                                    <option value="-1">二级类目</option>
                                                    <c:forEach items="${csList}" var="category">
                                                        <option value="${category.csid}" ${product.csid==category.csid?"selected":""}>${category.csname}</option>
                                                    </c:forEach>
                                                </select>
                                                <select name="ctid" class="form-control">
                                                    <option value="-1">三级类目</option>
                                                    <c:forEach items="${ctList}" var="category">
                                                        <option value="${category.ctid}" ${product.ctid==category.ctid?"selected":""}>${category.ctname}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>商品名</label>
                                                <input type="text" name="pName" id="pName" class="form-control" placeholder="商品名" value="${product.pName}">
                                                <c:if test="${!empty error}">
                                                    <span style="color: red">${requestScope.error}</span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <div style="float: left;width: 200px;margin-left: 20px">
                                            <label>库存</label>
                                            <input type="number" name="stock" class="form-control" style="width: 100px" value="${product.stock}" min="0" step="1">
                                        </div>
                                        <div style="float: left;width: 200px;margin-left: 20px">
                                            <label>市场价 ￥</label>
                                            <input type="text" name="shopPrice" class="form-control" style="width: 100px" value="${product.shopPrice}">
                                        </div>
                                        <div style="float: left;width: 200px;margin-left: 20px">
                                            <label>促销价 ￥</label>
                                            <input type="text" name="marketPrice" class="form-control" style="width: 100px" value="${product.marketPrice}">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>商品描述</label>
                                                <textarea rows="15" name="content" id="content"
                                                          class="form-control" placeholder="商品描述....">${product.content}</textarea>
                                                <c:if test="${!empty requestScope.error}">
                                                    <font style="color: red">${requestScope.error}</font>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" id="ssb"
                                            class="btn btn-info btn-fill pull-right">修改</button>
                                    <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/images/userleft.bg.jpg" alt="#" />
                        </div>
                        <div class="content">
                            <div class="author">
                                <a href="#"> <img class="avatar border-gray" src="${pageContext.request.contextPath}/images\faces\face-3.jpg"
                                                  alt="#" />




                                    <h4 class="title">${sessionScope.user.userName}<br /> <small>${requestScope.depMap[sessionScope.user.depID]}</small>
                                    </h4>
                                </a>
                            </div>
                            <p class="description text-center">
                               欢迎使用<br>
                                爱尚微购后台管理系统<br>
                            </p>
                        </div>
                        <hr>
                        <div class="text-center">
                            <button href="#" class="btn btn-simple">
                                <i class="fa fa-facebook-square"></i>
                            </button>
                            <button href="#" class="btn btn-simple">
                                <i class="fa fa-twitter"></i>
                            </button>
                            <button href="#" class="btn btn-simple">
                                <i class="fa fa-google-plus-square"></i>
                            </button>

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
                    <li><a href="#"> 浏览效果界面 </a></li>
                    <li><a href="#"> Company </a></li>
                    <li><a href="http://localhost:8080/"> Tomcat管理页 </a></li>
                    <li><a href="#"> 微博 </a></li>
                </ul>
            </nav>
            <p class="copyright pull-right">
                &copy; 2017 当前累计登陆访问次数 ： <a href="#" target="_blank" title="联系我们">
                ${applicationScope.visited}</a> - 统计来自 <a href="#" title="爱尚实训"
                                                          target="_blank">爱尚教育</a>
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
<!-- 富文本编辑器 -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/ckeditor4.4/ckeditor.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/ckfinder2.3.1/ckfinder.js"></script>
<script type="text/javascript">
    var editor = null;
    window.onload = function() {
        editor = CKEDITOR.replace('content'); //参数‘content’是textarea元素的name属性值，而非id属性值
        CKFinder.setupCKEditor(editor,
            '${pageContext.request.contextPath }/ckfinder2.3.1/');
    };
</script>
</html>