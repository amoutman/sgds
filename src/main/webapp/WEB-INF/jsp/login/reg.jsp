<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		success:function(){
			$(".errorinfo").remove();
		},
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
  			},
  			"country":{
  				required:true
  			}
	  	},
	  	messages:{
	  		"userCode":{
	  			required:"请输入用户名.",
	  			notEqualUserCode:"请输入用户名.",
	  			remote:"该用户名已存在，请输入另外一个."
	  		},
	  		"email":{
	  			required:"请输入电子邮件地址.", 
	  			notEqualEMail:"请输入电子邮件地址.", 
	  			email:"请输入正确的电子邮件地址.",
	  			remote:"该电子邮件地址已存在，请输入另外一个."
	  		},
	  		"password":{
	  			required:"请输入密码.", 
	  			notEqualPassword:"请输入密码.",
	  			rangelength:"密码必须为8到16位的字符且必须包含一个数字."
	  		},
	  		repassword:{
	  			required:"请确认密码.",
	  			notEqualPassword:"请确认密码.",
	  			equalTo:"请输入正确的密码.",
	  		},
	  		"mobileNumber":{
  				required:"请输入电话号码.",
  				notEqualMoblie:"请输入电话号码.",
  				number:"请输入正确的电话号码.",
  				remote:"该电话号码已存在，请输入另外一个."
  			},
  			"country":{
  				required:"请选择国家."
  			}	
	  	},
	  	errorPlacement: function(error, element) {
	  			error.removeClass("error");
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
	function countryManage(obj){
		//var currName = $(obj).find("#money-icon").html();
		var chCurrCountry = $(obj).find("#chCurrCountry").val();
		var currCountry = $(obj).find("#currCountry").val();
		$("#selectCountry").html(chCurrCountry);
		$("#country").val(currCountry);
		
	}
	
	</script>
  </head>
  
  <body>
    <div class="main">
   <div class="container">
      <div class="regCon">
         <div class="wrap">
            <span class="logo"><a class="icon" href="${pageContext.request.contextPath}/user/toIndexPage"></a></span>
            <div class="RegBox">
				<form action="${pageContext.request.contextPath }/user/register" id="regForm" method="post">
                  <ul class="s-hov" id="focus">
                    <li>
                    <span class="label">请输入账户名</span> <input type="text" class="input-txt" name="userCode" id="userCode">
                    </li>
                     <li style="z-index:100; overflow:visible;">
                      <div class="to-country">
                          <span class="add-on" id="selectCountry">选择国家</span><input type="hidden" id="country" name="country"/>
                          <ul class="calculator-dis" style="display:none">
                            <c:forEach var="curr" items="${currList }" varStatus="vs">
          					<li onclick="countryManage(this)">
          						<input type="hidden" id="currCountry" value="${curr.currencyCountry }">
          						<input type="hidden" id="chCurrCountry" value="${curr.chCurrCountry }">
          							<span class="money-icon">
          								<img src="${pageContext.request.contextPath}/resource/${curr.picPath}">
          							</span>${curr.chCurrCountry }
          					</li>                    
		 					</c:forEach>
                         </ul>
                       </div>
                     </li>
                    <li><span class="label">请输入邮箱</span> <input type="text" class="input-txt" name="email" id="email" ></li>
                    <li><span class="label">请输入密码</span> <input type="password" class="input-txt" name="password" id="password"></li>
                    <li><span class="label">请确认密码</span> <input type="password" class="input-txt" name="repassword" id="repassword" ></li>
                    <li><span class="label">请输入电话</span> <input type="text" class="input-txt" name="mobileNumber" id="mobileNumber" ></li>
                  </ul>
                </form>
                
                   <p class="pt10"><span class="fr">我已注册，现在<a href="${pageContext.request.contextPath}/user/toLogin" class="dlBtn">登录</a></span><span class="fl"><a class="reme" href="javascript:void(0)">我愿遵守某协议</a></span> </p>
                    <a href="javascript:void(0);" class="startBtn" id="regBtn">注 册</a>
                
            </div>
         </div>
      </div>
      <div class="indexImg">
         <div class="indexItems">
          <div style="background-image: url(${pageContext.request.contextPath}/resource/images/indexBg.jpg)" class="item"></div>
         </div>
      </div>
   </div>
</div>
</body>
</html>
