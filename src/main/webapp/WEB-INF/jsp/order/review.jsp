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
<title>我要评价</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script type="text/javascript">
	function review(obj){
		if($(obj).hasClass("on")){
			$(obj).removeClass("on");
		}else{
			$(obj).addClass("on");
		}
	}
	
	function insertReview(){
		var level = 0;
		var productId = $("#productId").val();
		var orderDetailsId = $("#orderDetailsId").val();
		var descInfo = $("#descInfo").val();
		
		$("li").each(function(){
			if($(this).hasClass("on")){
				level = level + 1;
			}
		});
		
		$.post{
			"product/insertReview",
			{
				"productId":productId,
				"orderDetailsId":orderDetailsId,
				"level":level,
				"descInfo":descInfo
			},
			function(data){
				if(data["success"]){
					window.location.href="${pageContext.request.contextPath}/userCenter/toUnEvaluatedOrder";
				}
			},
			"json"
		}
	}
</script>
</head>
<body>
<section class="bgGrey mb110">
    
    <div class="orderbar">
            <h2>评价订单</h2>
      </div>
      
     <div class="clearfix">
      <div class="ware-item">
                <div class="ware-img"><a href="${pageContext.request.contextPath}/userCenter/toOrderDetails"><img src="${pageContext.request.contextPath}/resource/${orderDetails.productMasterPic}" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <div class="ware-title">
                           <span class="h2">${orderDetails.productName }</span>
                           <span class="weight">${orderDetails.unit }</span>
                       </div>
                       
                   </div>
                   <div class="cart-bar">
                     <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${orderDetails.price }</span>
                     </div>
                     
                     </div>
                </div>
      </div>
     </div>         
    <!--评论 start-->
      <div class="commentBox">

                  <h3>商品评价</h3>
                 <div class="star clearfix"><i onClick="review(this)"></i><i onClick="review(this)"></i><i onClick="review(this)"></i><i onClick="review(this)"></i><i onClick="review(this)"></i></div>
                 <div class="comment-edit">
                 <input type="hidden" name="productId" id="productId" value="${orderDetails.productId }"/>
                 <input type="hidden" name="orderDetailsId" id="orderDetailsId" value="${orderDetails.id }"/>
                   <textarea name="descInfo" id="descInfo"></textarea>
                </div>


      </div>
     <!--评论 end-->
    </section>
    
    <!-- 按钮 start -->
    <div class="addressBtn">
             <a href="javascript:void(0);" onClick="insertReview()" class="btnPink">提交评价</a>
   </div>
   <!-- 按钮 end -->
</body>
</html>