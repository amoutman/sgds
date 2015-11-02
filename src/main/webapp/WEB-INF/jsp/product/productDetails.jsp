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
</head>
<body>
<section class="bgGrey clearfix mb110">
     <!--产品展示图 start-->
     <div id="slides">
     <c:forEach var="pdp" items="${pdpList}">
     	<a href="" class="app-link"><img src="${pageContext.request.contextPath}/resource/${pdp.picPath}" alt="" /></a>
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
              <c:forEach var="pr" items="prList">
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
             <a href=""><span class="cartIcon" id="end">
               <span class="cartNum" id="cartNum" style="display:none">10</span>
             </span>
             </a>
             <a href="" onClick="addProductToCart()" class="btnYello">加入购物车</a>
             <a href="" class="btnPink">立即购买</a>
          </div>
    <!-- 按钮 end -->
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
			"cart/toAddProductToCart",
			{
				"productId":productId
			},
			"json"
		  );
	addCartNum();
}

function addCartNum(){
	var cartNum = $("#cartNum").html();
	var num = cartNum + 1;
	$("#cartNum").html(num);
}
</script>
</html>