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
<div class="main">
   <div class="container">
      <div class="loginCon">
         <div class="wrap">
            <span class="logo"><a class="icon" href="${pageContext.request.contextPath}/user/toIndexPage"></a></span>
            <div class="LogBox">
                <div class="contlf">
                  <ul class="s-hov" id="focus">
                    <li><span class="label">请输入账户名</span><input type="text" class="input-txt" name="userInfo" id="userInfo"></li>
                    <li><span class="label">请输入密码</span><input type="password" class="input-txt" name="password" id="password"></li>
                  </ul>
                  <p class="clearFix pt10"><span class="fl"><a class="reme" href="javascript:void(0)">记住我</a></span> <span class="fr"><a href="">忘记密码</a></span></p>
                    <a href="javascript:void(0)" class="startBtn" onclick="checkLogin()">登 陆</a>
                </div>
                <div class="contrt">
                   <span class="log-lab">您还没有remitter账户？ </span>
                   <span class="log_easy"><a href="${pageContext.request.contextPath}/user/toRegister">立即注册</a></span>
                   <span class="log-lab log-v">使用以下账户登录：</span>
                   <p class="social">
      <a href="" title="Twitter" target="_blank" class="icon icon-tw"></a> <a href="" title="Facebook" target="_blank" class="icon icon-fb"></a> <a href="" title="Google+" target="_blank" class="icon icon-gp"></a>
      </p>
                </div>
            </div>
         </div>
      </div>
      <div class="indexImg">
         <div class="indexItems">
          <div style="background-image: url(${pageContext.request.contextPath }/resource/images/indexBg.jpg)" class="item"></div>
         </div>
      </div>
   </div>
</div>
</body>
</html>
