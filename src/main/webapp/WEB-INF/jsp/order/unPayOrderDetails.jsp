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
<script type="text/javascript">
	function deleteOrder(){
		var orderId = $("#orderId").val();
		$.post{
			"userCenter/deleteOrder",
			{
				"orderId":orderId
			},
			function(data){
				if(data["sucess"]){
					alert(data["msg"]);
					window.location.href="${pageContext.request.contextPath}/userCenter/toUnPayOrder";
				}else{
					alert("删除失败");
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
            <h2>待支付</h2>
      </div>
      
      
      <div class="orderDiv">
    
      <div class="orderNum">
         订单号：${order.orderNo }<br/>
         创建时间：${order.createdDate }
      </div>
      <ul class="cart-group clearfix">
      		<c:forEach var="od" items="${odList }">
              <li class="ware-item">
                <div class="ware-img"><a href=""><img src="${pageContext.request.contextPath}/resource/${od.productMasterPic}" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <span class="fr">X${od.count }</span>
                       <div class="ware-title">
                           <span class="h2">${od.productName }</span>
                           <span class="weight">${od.unit }</span>
                       </div>
                       
                   </div>
                   <div class="cart-bar">
                     <span class="fr"> ¥${od.productAmount}</span>
                     
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
           <div class="pir-l"><strong>实际应付：</strong></div>
           <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${order.practticalCoping }</span>
           </div>
     </div>
     </div>
     <div class="tac clearfix">
       <a class="btnPink2" href="">支付</a><a class="btnWhite2" href="">删除订单<input type="hidden" name="orderId" id="orderId" value="${order.id }"/></a> 
     </div>
     
    </div>
    </section>
</body>
</html>