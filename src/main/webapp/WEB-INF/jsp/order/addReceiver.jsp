<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>添加地址</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.validate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#receiverForm").validate({
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
		
		$("#insertBtn").click(function(e){
			if($('#receiverForm').valid()){
				$('#receiverForm').submit();
			}
		});
	})
</script>
</head>
<body>
    <!-- 添加地址 end -->
    <section class="clearfix">
        <div class="address-tit">添加收件地址</div>
	</section>
    
    <section class="mb110">
    <form action="${pageContext.request.contextPath}/order/insertReceiver" id="receiverForm" method="post">
      <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon1"></span>
            </div>
            <input type="hidden" name="productIds" value="${productIds}"/>
            <div class="m-wid2"><input type="text" id="name-tpye" name="receiverName" placeholder="收货人姓名" /></div>
			<div class="radio">
						<input id="check3" type="radio" name="receiverSex" value="0" checked>
						<label for="check3">妹纸</label>
			</div>
			<div class="radio">
						<input id="check4" type="radio" name="receiverSex" value="1">
						<label for="check4">欧巴</label>
			</div>
		</div>
        <div class="m-con">
			<div class="m-app-icon">
               <span class="app-icon app-icon2"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="receiverMobile" placeholder="收货人电话" /></div>
		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon3"></span>
            </div>
            <div class="m-wid3"><input type="text" id="name-tpye" name="receiverProvince" placeholder="省份" /></div>
			<div class="m-wid4"><input type="text" id="name-tpye" name="receiverRegion" placeholder="地区" /></div>

		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon4"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="receiverAddress" placeholder="街道，楼层，门牌号" /></div>
		</div>
        <div class="m-con">
            <div class="m-app-icon">
               <span class="app-icon app-icon5"></span>
            </div>
            <div class="m-wid"><input type="text" id="name-tpye" name="note" placeholder="备注" /></div>
		</div>
	</form>
    </section>
    <!-- 添加地址 end -->

        
    <!-- 按钮 start -->
    <div class="addressBtn">
             <a href="javascript:void(0);" id="insertBtn" class="btnPink">确认添加</a>
   </div>
   <!-- 按钮 end -->
</body>
</html>