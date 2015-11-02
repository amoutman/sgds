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
<title>待支付</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
</head>
<body>
 <section class="bgGrey mb110">
    
    <div class="orderbar">
            <h2>待支付</h2>
      </div>
      
    
<c:forEach var="order" items="${orderList }">
    <div class="orderDiv mb10">
    
      <div class="orderNum">订单号：${order.orderNo }</div>
      <!-- 收货地址 end -->
      <div class="deliver-address clearfix">
         
             <div class="address-edit"><a href="" class="btnEdit"></a></div>
             <div class="address-info">收货人：${order.receiver.receiverName }（<c:if test="${order.receiver.receiverSex == 0 }">先生</c:if><c:if test="${order.receiver.receiverSex == 1}">女士</c:if>）&nbsp;&nbsp;&nbsp;手机：${order.receiver.receiverMobile }</div>
             <div class="address-info">收货地址：${order.receiver.receiverAddress }</div>
         
      </div>
     <!-- 收货地址 end -->
     
    <div class="orderPri clearfix">
           <div class="pir-l">共 <span>${order.productCount }</span> 件商品</div>
           <div class="price"> 
                       <label>实际应付:</label>
                       <span class="price-sign">¥</span>
                       <span class="price-num">${order.productTotalAmount }</span>
           </div>
     </div>
     <div class="tac clearfix">
       <a class="btnPink2" href="">支付</a><a class="btnYello2" href="待支付详情.html">查看详情</a><a class="btnWhite2" href="">删除订单</a> 
     </div>
     
    </div>
   </c:forEach>
      
    </section>
</body>
</html>