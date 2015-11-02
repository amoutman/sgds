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
<title>已完成</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
</head>
<body>
<section class="bgGrey mb110">
    
    <div class="orderbar">
            <h2>已完成</h2>
      </div>
      
      
      <div class="orderDiv mb10">
     <div class="orderselect">
        <label>订单查询：</label><select name="select" id="select">
         <option value="1">近1周订单</option>
         <option value="1">近2周订单</option>
         <option value="1">近3周订单</option>
       </select>
     </div>
     <c:forEach var="order" items="${orderList }"> 
      <div class="orderNum">
         订单号：${order.orderNo }<br/>
         创建时间：${order.createdDate }<br/>
         完成时间：${order.receivedDate }
      </div>
      <ul class="cart-group clearfix">
      		<c:forEach var="product" items="${order.productList }">
              <li class="ware-item">
                <div class="ware-img"><a href=""><img src="${pageContext.request.contextPath}/resource/${product.productMasterPic}" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <span class="fr">X3</span>
                       <div class="ware-title">
                           <span class="h2">${product.productName}</span>
                           <span class="weight">${product.unit}</span>
                       </div>
                       
                   </div>
                   <div class="cart-bar">
                     <span class="fr"> ¥${product.price}</span>
                     
                     </div>
                </div>
              </li>
             </c:forEach> 
              
           </ul>
      <div class="orderPri">
             <div class="clearfix">
               <div class="pir-l">订单总额：</div>
               <div class="price"><span class="font24 color333 block">¥${order.productTotalAmount }</span></div>
             </div>
             <div class="clearfix">
               <div class="pir-l">代金券使用折扣：</div>
               <div class="price"><span class="font24 color333 block">-${order.couponAmount }</span></div>
             </div>
     
      <div class="clearfix">
           <div class="pir-l">实际应付：</div>
           <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${order.productTotalAmount }</span>
           </div>
     </div>
     </div>

     
    </div>
  </c:forEach>  
    </section>
</body>
</html>