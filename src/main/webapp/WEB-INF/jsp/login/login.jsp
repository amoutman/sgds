<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/resource/js/libs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resource/js/common.js"></script>

</head>
<body>
	<!-- 登录 start-->
	<section class="mt10 clearfix">
      <div class="errcom">
       <div class="errinfo" style="display:none;">
                    <p><i><img src="${ctx}/resource/images/icon_erro.png"></i> 请输入正确的手机号</p>
                    <span class="greybg"></span>
                </div>
        </div>
       <div class="com">
			<div class="com-left">账号：</div>
			<div class="com-right">
				<input type="text" id="userName" placeholder="请输入您的账号 "/>
			</div>
		</div>
        <div class="line"></div>
		<div class="com">
			<div class="com-left">密码：</div>
			<div class="com-right">
				<input type="password" id="passWord" class="fl" placeholder="请输入您的密码">
			</div>
            
		</div>
	</section>
    <div class="login-bottom">	
        <button onclick="checkLogin()">登录</button>
        <p><a href="" class="fr">忘记密码</a> <a href="${ctx}/user/prepareRegist">注册</a></p>
    </div>
  <!-- 登录 end-->
</body>
<script type="text/javascript">

	function checkLogin(){
		var userName = $("#userName").val();
		var passWord = $("#passWord").val();
		
		if(userName=="" || passWord==""){
			$(".errinfo p").html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> 账号或密码不能为空");
			$(".errinfo").css('display','block');
			setTimeout("$('.errinfo').css('display','none')",2000);
			return false;
		}else{
			$.post(
					"${pageContext.request.contextPath }/user/login",
					{
						"userName":userName,
						"passWord":passWord
					},
					function(data){
						if (data.msg == "1") {
							// 跳到登录成功的页面
							window.location.href="${pageContext.request.contextPath }/index/toIndexPage";
						} else {
							// 失败了
							$("#passWord").val("");
							$(".errinfo p").html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> "+data.result);
							$(".errinfo").css('display','block');
							setTimeout("$('.errinfo').css('display','none')",2000);
						}
					},
					"json"	
			);
		}
	}	
</script>
</html>