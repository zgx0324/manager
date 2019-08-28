
function login(){
	var username = document.getElementById("username").value;
	var userpwd = document.getElementById("userpwd").value ;
	if(username==null || username==""){
		alert("请输入用户名");
		return false;
	}
	if(userpwd==null || userpwd==""){
		alert("请输入密码");
		return false;
	}
}

function load(){
	alert("Aa");
	var getcookie=document.cookie;
	var a=getcookie.split(";");
	var b=a[1].split("=");
	var c=b[1].split("-");
	var username=decodeURI(c[0]);
	document.getElementById("username").value=username;
}