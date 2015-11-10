<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>收件地址</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script type="text/javascript">
	function setDefaultAdd(obj){
		if($(obj).parent().parent().parent().hasClass("default-address")){
			return;
		}
		var receiverId = $(obj).parent().find("#receiverId").val();
		$.post(
			"updateReceiverDefault",
			{
				"receiverId":receiverId
			},
			function(data){
				if(data["success"]){
					$(".default-address").removeClass("default-address");
					$(obj).parent().parent().parent().addClass("default-address");
				}else{
					alert(data["msg"]);
				}
			},
			"json"
		)
	}
</script>
</head>
<body>
 <!-- 收货地址 end -->
    <section class="bgGrey mb110">
      <div class="address-tit">收件地址</div>
       <c:forEach var="receiver" items="${rList}">
       		<c:if test="${receiver.masterOrNot == 0 }">
       			<div class="deliver-address default-address clearfix">
         			<div class="address-left">
             			<div class="address-info">${receiver.receiverName }（<c:if test="${receiver.receiverSex == 1 }">先生</c:if><c:if test="${receiver.receiverSex == 0}">女士</c:if>）  ${receiver.receiverMobile }</div>
             			<div class="address-info">${receiver.receiverAddress }</div>
         			</div>
         			<div class="address-edit">
          		    	<a href="${pageContext.request.contextPath}/receiver/toUpdateReceiver?receiverId=${receiver.id}" class="btnEdit"></a>
           				<span class="set-default"><input type="hidden" name="receiverId" id="receiverId" value="${receiver.id}"/><a href="javascript:void(0);" onClick="setDefaultAdd(this)">设为默认地址</a></span>
         			</div>
      			</div>
       		</c:if>
       		<c:if test="${receiver.masterOrNot == 1 }">
       		    <div class="deliver-address clearfix">
         			<div class="address-left">
            			<div class="address-info">${receiver.receiverName }（<c:if test="${receiver.receiverSex == 1 }">先生</c:if><c:if test="${receiver.receiverSex == 0}">女士</c:if>）  ${receiver.receiverMobile }</div>
             			<div class="address-info">${receiver.receiverProvince } ${receiver.receiverRegion } ${receiver.receiverAddress }</div>
         			</div>
         			<div class="address-edit">
           				<a href="${pageContext.request.contextPath}/receiver/toUpdateReceiver?receiverId=${receiver.id}" class="btnEdit"></a>
           				<span class="set-default"><input type="hidden" name="receiverId" id="receiverId" value="${receiver.id}"/><a href="javascript:void(0);" onClick="setDefaultAdd(this)">设为默认地址</a></span>
         			</div>
      			</div>
       		</c:if>
       </c:forEach>
    </section>
    <!-- 收货地址 end -->

        
    <!-- 按钮 start -->
    <div class="addressBtn">
             <a href="${pageContext.request.contextPath}/receiver/toInsertReceiver" class="btnPink"><span class="add-address"><i></i>新建收货地址</span></a>
   </div>
   <!-- 按钮 end -->
</body>
</html>