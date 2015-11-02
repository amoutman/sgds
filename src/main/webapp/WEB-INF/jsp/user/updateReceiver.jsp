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
<title>修改地址</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateForm").validate({
		success:function(){
			$(".errorinfo").remove();
		},
		rules:{
			"receiverName":{
				required:true
			},
			"receiverMobile":{
				required:true
			},
			"receiverProvince":{
				required:true
			},
			"receiverRegion":{
				required:true
			},
			"receiverAddress":{
				required:true
			}
		},
		messages:{
			"receiverName":{
				required:"收货人姓名不能为空"
			},
			"receiverMobile":{
				required:"收货人电话不能为空"
			},
			"receiverProvince":{
				required:"收货人省份不能为空"
			},
			"receiverRegion":{
				required:"收货人地区不能为空"
			},
			"receiverAddress":{
				required:"收货人街道楼层门牌号不能为空"
			}
		},
	  	errorPlacement: function(error, element) {
 				var span = $("<span class='icon errorinfo' />").append(error);
 				span.appendTo(element.parent());
 		}
		
	});
	
	$("#updateBtn").click(function(e){
		if($('#updateForm').valid()){
			$('#updateForm').submit();
		}
	});
})
</script>
</head>
<body>
<!-- 修改地址 end -->
    <section class="clearfix">
        <div class="address-tit">修改收件人信息</div>
	</section>
    
    <section class="mb110">
    <from action="${pageContext.request.contextPath}/receiver/updateReceiver" id="updateForm" method="post">
      <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon1"></span>
            </div>
            <div class="m-wid2"><input type="text" id="name-tpye" name="receiverName" value="${receiver.receiverName }" placeholder="收货人姓名" /></div>
			<div class="radio">
						<input id="check3" type="radio" name="receiverSex" value="check3" <c:if test="${receiver.receiverSex == 1}">checked</c:if> >
						<label for="check3">妹纸</label>
			</div>
			<div class="radio">
						<input id="check4" type="radio" name="receiverSex" value="check4" <c:if test="${receiver.receiverSex == 0}">checked</c:if>>
						<label for="check4">欧巴</label>
			</div>
		</div>
        <div class="m-con">
			<div class="m-app-icon">
               <span class="app-icon app-icon2"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="receiverMobile" value="${receiver.receiverMobile }" placeholder="收货人电话" /></div>
		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon3"></span>
            </div>
            <div class="m-wid3"><input type="text" id="name-tpye" name="receiverProvince" value="${receiver.receiverProvince }" placeholder="北京市" /></div>
			<div class="m-wid4"><input type="text" id="name-tpye" name="receiverRegion" value="${receiver.receiverRegion }" placeholder="双桥" /></div>

		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon4"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="receiverAddress" value="${receiver.receiverAddress }" placeholder="楼层，门牌号" /></div>
		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon5"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="note" value="${receiver.note }" placeholder="备注" /></div>
		</div>
		</from>
    </section>
    <!-- 修改地址 end -->

        
    <!-- 按钮 start -->
    <div class="addressBtn">
             <a href="javascript:void(0);" id="updateBtn" class="btnPink">确认修改</a>
   </div>
   <!-- 按钮 end -->
</body>
</html>