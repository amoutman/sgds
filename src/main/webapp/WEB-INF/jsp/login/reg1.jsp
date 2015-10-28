<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
  
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="blank" />
	<meta name="format-detection" content="telephone=no" />
	<meta content="email=no" name="format-detection" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/style.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		 jQuery.validator.addMethod("notEqualUserCode", function(value, element) {
    		return value!="User Name";
		 }, "User Name is required.");  
		 
		 jQuery.validator.addMethod("notEqualEMail", function(value, element) {
    		return value!="E-Mail";
		 }, "E-Mail is required."); 
		 
		 jQuery.validator.addMethod("notEqualMoblie", function(value, element) {
    		return value!="Moblie";
		 }, "Moblie is required."); 
		 
		 jQuery.validator.addMethod("notEqualPassword", function(value, element) {
    		return value!="password";
		 }, "Password is required."); 
		
		$('#regForm').validate({
	  	rules:{
	  		"userCode":{
	  			required:true,
	  			notEqualUserCode:true,
	  			remote:{
	  				type:"post",
	  				data:{
	  					userInx:"userCode",
	  					userInfo:function(){return $("#userCode").val();}
	  				},
	  				url:"user/validate"
	  			}
	  			
	  		},
	  		"email":{
	  			required:true,
	  			notEqualEMail:true, 
	  			email:true,
	  			remote:{
	  				type:"post",
	  				data:{
	  					userInx:"email",
	  					userInfo:function(){return $("#email").val();}
	  				},
	  				url:"user/validate"
	  			}
	  		},
	  		"password":{
	  			required:true, 
	  			notEqualPassword:true,
	  			rangelength:[8,16]	
	  		},
	  		repassword:{
	  			required:true,
	  			notEqualPassword:true,
	  			equalTo:"#password"
	  		},
	  		"mobileNumber":{
  				required:true,
  				notEqualMoblie:true,
  				number:true,
  				remote:{
	  				type:"post",
	  				data:{
	  					userInx:"mobile",
	  					userInfo:function(){return $("#mobileNumber").val();}
	  				},
	  				url:"user/validate"
	  			}
  			}
	  	},
	  	messages:{
	  		"userCode":{
	  			required:"User Name is required.",
	  			notEqualUserCode:"User Name is required.",
	  			remote:"User Name already exists,please enter another one."
	  		},
	  		"email":{
	  			required:"E-Mail is required.", 
	  			notEqualEMail:"E-Mail is required.", 
	  			email:"Please enter a valid email address.",
	  			remote:"E-Mail already exists,please enter another one."
	  		},
	  		"password":{
	  			required:"Password is required.", 
	  			notEqualPassword:"Password is required.",
	  			rangelength:"8 to 16 characters long including at least 1 number."
	  		},
	  		repassword:{
	  			required:"Repassword is required.",
	  			notEqualPassword:"Password is required.",
	  			equalTo:"Please enter the same Password again.",
	  		},
	  		"mobileNumber":{
  				required:"Moblie is required.",
  				notEqualMoblie:"Moblie is required.",
  				number:"Please enter a valid Moblie.",
  				remote:"Moblie already exists,please enter another one."
  			},	
	  	},
	  	errorPlacement: function(error, element) {
 				var span = $("<span class='icon errorinfo' />").append(error);
 				span.appendTo(element.parent());
 		}
	  	
	  });
		$('#regBtn').click(function(e) {
			if($('#regForm').valid()){
				$('#regForm').submit();
			}
		});
	});
	
	</script>
  </head>
  
  <body>
    <!--左侧部分 start-->
<div id="main_left">
    <header>
      <div class="logo"><a class="icon" href="${pageContext.request.contextPath}/user/toIndexPage"></a></div>
      <!--移动端显示的隐藏菜单小图标 start--><div class="smallmenu"><a href="javascript:void(0)" class="icon"></a></div><!--移动端显示的隐藏菜单小图标 end-->
      <div class="menu">
       <ul>
            <li><a href="#goTop" class="goTop">send  money</a></li>
            <li><a href="#goDown" class="goDown">how it works</a></li>
            <li class="col91"><a href="${pageContext.request.contextPath}/user/toRegister">SIGN UP</a></li>
            <li class="col91"><a href="${pageContext.request.contextPath}/user/toLogin">login</a></li>
       </ul>
       
       <!--国旗 start-->
      <span class="icon flag-en"></span>
      <span class="icon flag-china" style="display:none;"></span>
      <!--国旗 end-->
      
      <p class="social">
      <a class="icon icon-tw" target="_blank" title="Twitter" href=""></a> <a class="icon icon-fb" target="_blank" title="Facebook" href=""></a> <a class="icon icon-gp" target="_blank" title="Google+" href=""></a>
      </p>
      </div>
    </header>
    <!--移动端显示下点击右上小图标显示菜单 start-->
    <div class="dropmenu">
          <ul class="ul1">
            <li><a href="${pageContext.request.contextPath }/account/toAccount">Account Management</a></li>
            <li><a href="${pageContext.request.contextPath }/trans/toTransquery">Transaction Query</a></li>
            <li><a href="${pageContext.request.contextPath }/payee/toUserPayee">Payee Management</a></li>
          </ul>
          <ul class="ul2">
            <li><a href="${pageContext.request.contextPath }/trans/toSendMoney">send  money</a></li>
            <li><a href="javascript:void(0)">how it works</a></li>
            <li><a href="${pageContext.request.contextPath}/user/toRegister">register</a></li>
          </ul>
      </div>
   <!--移动端显示下点击右上小图标显示菜单 end-->   
</div>
<!--左侧部分 end-->

<!--右侧部分 start-->
<div id="main_right">
    <!--注册 start-->
     <div class="reg login posr">
     <form action="${pageContext.request.contextPath }/user/register" id="regForm" method="post">
       <ul class="formul">
          <li>
          	<input type="text" value="User Name" name="userCode" id="userCode" 
          		   class="input-txt" onblur="javascript:if($(this).val()==''){$(this).val('User Name');}" 
          	       onfocus="javascript:if($(this).val()=='User Name'){$(this).val('');}">
          </li>
          <li>
          	<input type="text" value="E-Mail" name="email" id="email" 
         		   class="input-txt" onblur="javascript:if($(this).val()==''){$(this).val('E-Mail');}" 
         		   onfocus="javascript:if($(this).val()=='E-Mail'){$(this).val('');}">
          </li>
          <li>
            <input type="password" name="password" id="password" class="input-txt" value="password"
            		onblur="javascript:if($(this).val()==''){$(this).val('password');}" 
         		   onfocus="javascript:if($(this).val()=='password'){$(this).val('');}">
          </li>
          <li>
          	<input type="password" name="repassword" id="repassword" class="input-txt" value="password"
          		   onblur="javascript:if($(this).val()==''){$(this).val('password');}" 
         		   onfocus="javascript:if($(this).val()=='password'){$(this).val('');}">
          </li>
       	  <li>
       	  	 <input type="text" value="Moblie" name="mobileNumber" id="mobileNumber" 
       	             class="input-txt" onblur="javascript:if($(this).val()==''){$(this).val('Moblie');}" 
       	             onfocus="javascript:if($(this).val()=='Moblie'){$(this).val('');}">
       	  </li>
          
       </ul>
      </form> 
      <a class="loginBtn" name="regBtn" id="regBtn" href="javascript:void(0);" >
         <span class="login-txt1">Create </span>
         <span class="icon login-icon">&gt;</span>
         <span class="login-txt2">Account </span>
         
      </a>

    </div>
    <!--注册 end-->
 </div>
<!--右侧部分 end-->
  </body>
</html>
