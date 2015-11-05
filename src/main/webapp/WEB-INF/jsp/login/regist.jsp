<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/resource/js/libs.jsp"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>注册</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resource/js/jquery.validate.js"></script>
<script src="${ctx}/resource/js/common.js"></script>
<script>
function register(){
	//验证手机号
	var mobile = $("#mobile").val().trim();
	var mobileReg = /^1[3|5|8|7][0-9]\d{4,8}$/;
	if(mobile == ""){
		$('.errinfo p').html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> ");
		$('.errinfo p').append("请输入手机号码");
		$(".errinfo").css('display','block');
		setTimeout("$('.errinfo').css('display','none')",2000);
		return;
	}else if(!mobileReg.test(mobile) || mobile.length != 11){
		$('.errinfo p').html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> ");
		$('.errinfo p').append("请输入有效的手机号码");
		$(".errinfo").css('display','block');
		setTimeout("$('.errinfo').css('display','none')",2000);
		return;
	}
	//验证密码
	var password = $("#password").val().trim();
	var passwdReg = /^(?!\d+$)(?![A-Za-z]+$)[a-zA-Z0-9]{6,16}$/;
	if(password == ""){
		$('.errinfo p').html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> ");
		$('.errinfo p').append("请设置登录密码");
		$(".errinfo").css('display','block');
		setTimeout("$('.errinfo').css('display','none')",2000);
		return;
	}else if(!passwdReg.test(password)){
		$('.errinfo p').html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> ");
		$('.errinfo p').append("密码必须6-16位的字母,数字的组合");
		$(".errinfo").css('display','block');
		setTimeout("$('.errinfo').css('display','none')",2000);
		return;
	}
	//校验码验证
	var verCodeToken = $("#verCodeToken").val().trim()
	
	//验证通过
	$.post(
			"${ctx}/user/regist",
			{
				"mobile":mobile,
				"password":password,
				"verCodeToken":verCodeToken
			},
			function(data){
				if (data.msg == "1") {
					// 跳到登录的页面
					 window.location.href="${pageContext.request.contextPath }/user/prepareLogin";
				} else {
					// 失败了
					$(".errinfo p").html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> "+data.result);
					$(".errinfo").css('display','block');
					setTimeout("$('.errinfo').css('display','none')",2000);
				}
			},
			"json"	
	);
}

function sendVerifyCode(val){
	if($("#mobile").val()==''){
		alert("请输入手机号");
		return ;
	}
	if($("#mobile").val().length<11){
		alert("请输入正确的手机号");
		return ;
	}
	if(!(/^1[3|5|8|7][0-9]\d{4,8}$/.test($("#mobile").val()))){ 
	        alert("请输入正确的手机号"); 
	        return ; 
	   }
	getVerifyCode(val,"${ctx}/getVerifyCode",$("#mobile").val());
}
</script>
</head>
<body>
	<!-- 注册 start -->
	<section class="mt10 clearfix">
	   <div class="errcom">
	       <div class="errinfo" style="top:1em; display: none;">
	            <p><i><img src="${ctx}/resource/images/icon_erro.png"></i></p>
	            <span class="greybg"></span>
	       </div>
       </div>
       <div class="com">
			<div class="com-left">手&nbsp;机&nbsp; 号：</div>
			<div class="com-right">
				<input type="text" name="mobile" maxlength="11" id="mobile" placeholder="请输入您的手机号 "/>
			</div>
		</div>
        <div class="line"></div>
		<div class="com">
			<div class="com-left">校&nbsp;验&nbsp; 码：</div>
			<div class="com-right">
				<input type="text" name="verifyCode" placeholder="请输入手机校验码" class="yzm" /><span class="edit-yzm" ><img src="${ctx}/resource/images/yzm.jpg"></span>
				<input type="hidden" id="verCodeToken" name="verCodeToken" value="mycode"/>
			</div>
		</div>
        <div class="line"></div>
		<div class="com">
			<div class="com-left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码：</div>
			<div class="com-right">
				<input type="password" name="password" id="password" maxlength="16" placeholder="6-16位字母与数字组合密码" class="fl" />	
			</div>
		</div>
	</section>
	<button onclick="register()">注册</button>
    <!-- 注册 end -->
</body>
</html>