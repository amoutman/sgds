<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>登录页面</title>

<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="blank" />
<meta name="format-detection" content="telephone=no" />
<meta content="email=no" name="format-detection" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="${pageContext.request.contextPath }/resource/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/style.js"></script>
<script type="text/javascript">
	function checkLogin(){
			var userInfo = $("#userInfo").val();
			var password = $("#password").val();
			
			if(userInfo==""){
				alert("用户名不能为空!");
				return false;
			}else if((/[ \t\n\x0B\f\r]+/).test(userInfo)){
				alert("用户名不能包含空格!");
				$("#userInfo").val("");
				$("#password").val("");
				return false;
			}else if(password==""){
				alert("密码不能为空!");
				$("#userInfo").val("");
				$("#password").val("");
				return false;
			}else{
				$.post(
					"user/login",
					{
						"userInfo":userInfo,
						"password":password
					},
					function(data){
						if (data['success']) {
								// 跳到登录成功的页面
							if(data['isBackUrl']){
								window.location.href="${pageContext.request.contextPath }/trans/toSendMoney";
							}else{
								window.location.href="${pageContext.request.contextPath }/account/toAccount";
							}
							
						} else {
							// 失败了
							alert(data['msg']);
							$("#userInfo").val("");
							$("#password").val("");
							//alert(data.msg);
						}
					},
					"json"	
				);
			}
	    }
</script>
</head>

<body>
	<!--左侧部分 start-->
	<div id="main_left">
		<header>
		<div class="logo">
			<a class="icon" href="${pageContext.request.contextPath}/user/toIndexPage"></a>
		</div>
		<!--移动端显示的隐藏菜单小图标 start-->
		<div class="smallmenu">
			<a href="javascript:void(0)" class="icon"></a>
		</div>
		<!--移动端显示的隐藏菜单小图标 end-->
		<div class="menu">
			<ul>
				<li><a href="#goTop" class="goTop">send money</a></li>
				<li><a href="#goDown" class="goDown">how it works</a></li>
				<li class="col91"><a href="${pageContext.request.contextPath}/user/toRegister">SIGN UP</a></li>
				<li class="col91"><a href="${pageContext.request.contextPath}/user/toLogin">login</a></li>
			</ul>

			<!--国旗 start-->
			<span class="icon flag-en"></span> <span class="icon flag-china"
				style="display:none;"></span>
			<!--国旗 end-->

			<p class="social">
				<a class="icon icon-tw" target="_blank" title="Twitter" href=""></a>
				<a class="icon icon-fb" target="_blank" title="Facebook" href=""></a>
				<a class="icon icon-gp" target="_blank" title="Google+" href=""></a>
			</p>
		</div>
		</header>
		<!--移动端显示下点击右上小图标显示菜单 start-->
		<div class="dropmenu">
			<ul class="ul1">
				<li><a href="${pageContext.request.contextPath }/account/toAccount">Account Management</a></li>
				<li><a href="${pageContext.request.contextPath }/trans/toTransquery">Transaction
						Query</a></li>
				<li><a href="${pageContext.request.contextPath }/payee/toUserPayee">Payee Management</a></li>
			</ul>
			<ul class="ul2">
				<li><a href="${pageContext.request.contextPath }/trans/toSendMoney">send money</a></li>
				<li><a href="javascript:void(0)">how it works</a></li>
				<li><a href="${pageContext.request.contextPath}/user/toRegister">register</a></li>
			</ul>
		</div>
		<!--移动端显示下点击右上小图标显示菜单 end-->
	</div>
	<!--左侧部分 end-->

	<!--右侧部分 start-->
	<div id="main_right">
		<!--登录 start-->
		<div class="login posr">
			<h2>login</h2>
			<ul class="formul">
				<li><input type="text" value="Username or E-Mail"
					name="userInfo" id="userInfo" class="input-txt"
					onblur="javascript:if($(this).val()==''){$(this).val('Username or E-Mail');}"
					onfocus="javascript:if($(this).val()=='Username or E-Mail'){$(this).val('');}"></li>
				<li><input type="password" name="password" id="password" class="input-txt"></li>
				<li><a href="javascript:void(0)" class="icon reme">Remember
						me</a><a href="">Lost password? </a></li>
			</ul>
			<a class="loginBtn" onclick="checkLogin()" href="javascript:void(0);" > 
				<span class="login-txt1">Log In</span> <span class="icon login-icon">&gt;</span>
			</a>
		</div>
		<!--登录 end-->
	</div>
	<!--右侧部分 end-->
</body>
</html>
