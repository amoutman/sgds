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
<title>待评价</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
</head>
<body>
 <section class="bgGrey mb110">
    
    <div class="orderbar">
            <h2>待评价</h2>
      </div>
      
      <ul class="cart-group clearfix">
      		<c:forEach var="object" items="oList">
              <li class="ware-item">
                <div class="ware-img"><a href="查看订单.html"><img src="${pageContext.request.contextPath}/resource/${object.product.productMasterPicPath}" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <div class="ware-title">
                           <span class="h2">${object.product.productName}</span>
                           <span class="weight">${object.product.unit}</span>
                       </div>
                       
                   </div>
                   <div class="cart-bar">
                     <a class="c-btn" href="${pageContext.request.contextPath}/product/toProductReview?productId=${object.product.id}&orderId=${object.orderId}">评价</a>
                     <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${object.product.price}</span>
                     </div>
                     
                     </div>
                </div>
              </li>
            </c:forEach>  
           </ul>

    </section>
</body>
</html>