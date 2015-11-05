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
<title>查看订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
</head>
<body>
<section class="bgGrey mb110">
      <div class="orderbar">
            <h2>订单详情</h2>
      </div>
    
	<!-- 订单详情 start -->
      <ul class="cart-group clearfix">
      		<c:forEach var="od" items="${odList }">
              <li class="ware-item">
                <div class="ware-img"><a href=""><img src="${pageContext.request.contextPath}/resource/${od.productMasterPic}" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <div class="ware-title">
                           <span class="h2">${od.productName }</span>
                           <span class="weight">${od.unit }</span>
                       </div>
                       
                   </div>
                   <div class="cart-bar">
                     <div class="time">${order.createdDate }</div>
                     <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${od.price }</span>
                     </div>
                     
                     </div>
                </div>
              </li>
           </c:forEach>  
    </ul>
         
    <div class="box orderBox clearfix">
          <div class="fr"><label>联系电话：</label> <span>${receiver.receiverMobile }</span></div>
          <div class="fl"><label>收货人：</label> <span>${receiver.receiverName }</span></div>
    </div>
    
    <div class="box orderBox">
          <div class="clearfix"><label>收货人地址：</label> </div>
          <p>${receiver.receiverProvince }${receiver.receiverRegion }${receiver.receiverAddress }</p>
    </div>
    
    <div class="box orderBox clearfix">
          <p>订单号：${order.orderNo }</p>
          <p>交易时间：${order.createdDate }</p>
          <p>完成时间：${order.receivedDate }</p>
          <p>卖家信息：北京市果然爱你水果旗舰店</p>
    </div>
    
  <!-- 订单详情 end -->
   </section>
</body>
</html>