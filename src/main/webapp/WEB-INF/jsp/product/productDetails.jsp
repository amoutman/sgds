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
<title>产品详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.slides.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/center.js"></script>
</head>
<body>
<section class="bgGrey clearfix mb110">
     <!--产品展示图 start-->
     <div id="slides">
     <c:forEach var="pdp" items="${pdpList}">
     	<a href="javascript:void(0);" class="app-link"><img src="${pageContext.request.contextPath}/resource/${pdp.picPath}" alt="" /></a>
     </c:forEach>
     </div>
    <!--产品展示图 end-->
    
      <!-- 产品详情 start -->
       <div class="product-info clearfix">
               <div class="pro-com">
                <div class="pro-info clearfix">
                  <div class="pro-left">
                      <span class="h2">${product.productName}<input type="hidden" name="productId" id="productId" value="${product.id }"/></span>
                      <span class="weight">${product.unit}</span>
                      <span class="num"><i></i>已售：33413</span>
                  </div>
                  <div class="pro-right">
                     <span class="h3">果然之家旗舰店</span>
                     <span class="price"> 
                       <span class="price-num">${product.price}</span>
                       <span class="price-sign">¥</span>
                     </span>
                  </div>
                </div>
               
               <p>${product.productDesc }</p>
              </div>
              <!-- 产品详情 end -->
              
              <!--评论 start-->
              <div class="pro-com">
              <c:forEach var="pr" items="${prList }">
                <div class="comment">
                 <div class="comment-t">
                   <span class="star clearfix">
                   <c:if test="${pr.level == 1 }">
                  	 <i></i>
                   </c:if>
                   <c:if test="${pr.level == 2 }">
                  	 <i></i><i></i>
                   </c:if>
                   <c:if test="${pr.level == 3 }">
                  	 <i></i><i></i><i></i>
                   </c:if>
                   </span>
                 </div>
                 <div class="comment-c">
                   <p>${pr.descInfo}</p>
                 </div>
                 <div class="comment-b"><p><span class="fr">${pr.createdBy }</span> ${pr.createdByDate}</p> </div>
                 </div>
              </c:forEach>
              <!--评论 end-->
              
           </div>
	</section>
    
    
    <!-- 按钮 start -->
    <div class="productBtn">
             <a href="${pageContext.request.contextPath}/cart/toCart"><span class="cartIcon" id="end">
               <span class="cartNum" id="cartNum"></span>
             </span>
             </a>
             <a href="javascript:void(0);" onClick="addProductToCart()" class="btnYello">加入购物车</a>
             <a href="javascript:void(0);" onClick="toBuyProduct()" class="btnPink" id="buyBtn">立即购买</a>
          </div>
    <!-- 按钮 end -->
    
     <!-- 登录弹窗 start -->
	  	<div class="popbox" id="popbox-login" style="z-index:9999;">
        <div class="closeDiv"><a href="#" class="close-btn" id="close-btn-login" onClick="closeLogin()">x</a></div>
		<section class="clearfix">
        <div class="errcom">
       <div class="errinfo" style="display:none;">
                    <p><i><img src="images/icon_erro.png"></i> 请输入正确的手机号</p>
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
				<input type="password" id="password" class="fl" placeholder="请输入您的密码">
			</div>
            
		</div>
	</section>
    <div class="login-bottom">	
        <button onClick="login()">登录</button>
        <p><a href="javascript:void(0);"  class="fr">忘记密码</a> <a href="">注册</a>  </p>
    </div>
	</div>
   <!-- 登录弹窗 end -->
   <form action="${pageContext.request.contextPath}/order/orderConfirm" id="orderConfirmForm" method="post">
   		<input type="hidden" name="productIds" id="productIds"/>
   </form>
</body>
<script>
$(function() {
  $('#slides').slidesjs({
    width: 640,
    height: 250,
    navigation: false,
    play: {
        active: false,
        auto: true,
        interval: 3000,
        swap: true
    }
  });
  
});

function addProductToCart(){
	var productId = $("#productId").val();
	$.post(
			"${pageContext.request.contextPath}/cart/toAddProductToCart",
			{
				"productId":productId
			},
			"json"
	);
	addCartNum();
}

function addCartNum(){
	var cartNum = $("#cartNum").html();
	var num = 0;
	if(cartNum==""){
		num = 1;
	}else{
		num = Number(cartNum) + 1;
	}
	$("#cartNum").html(""+num);
}

function login(){
	var userName = $("#userName").val();
	var password = $("#password").val();
	$.post(
		"${pageContext.request.contextPath}/cart/toLogin",
		{
			"userName":userName,
			"password":password
		},
		function(data){
			if(data["success"]){
				toOrder();
			}else{
				alert("用户名或密码错误");
			}
		},
		"json"
	)
}

function toBuyProduct(){
	var productIds = $("#productId").val();
	if(productIds!=""){
		$.post(
			"${pageContext.request.contextPath}/cart/toBuyProduct",
			function(data){
				if(data["success"]){
					toOrder();
				}else{
					showLogin('popbox-login');
				}
			},
			"json"
		)
	}else{
		alert("请选择需要购买的商品");
	}
}

function toOrder(){
	var productIds = $("#productId").val();
	if(productIds!=""){
		$("#productIds").val(productIds);
		$("#orderConfirmForm").submit();
	}
}

$(function(){
	// 登录弹窗 tickbox('close-btn-login','popbox-login','buyBtn');	
	
});	

function closeLogin(){
	$('#popbox-login').fadeOut();
	return false;
}

function showLogin(boxID){
	var h = $(document).height();
	$('#'+boxID+'').css({ 'min-height': h });	
	$('#'+boxID+'').center();
	$('#'+boxID+'').fadeIn();
	return false;
}
</script>
</html>