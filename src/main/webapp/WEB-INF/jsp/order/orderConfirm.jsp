<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>订单确认</title>
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/common.js"></script>

</head>
<body>
    
    <section class="bgGrey mb110">
      <!-- 收货地址 end -->
      <div class="deliver-address clearfix">
         <div class="address-left">
             <div class="address-info">${receiver.receiverName}<c:if test="${receiver.receiverSex == 0}">（先生）</c:if><c:if test="${receiver.receiverSex == 1}">（女士）</c:if>  ${receiver.receiverMobile}</div>
             <div class="address-info">${receiver.receiverProvince}  ${receiver.receiverRegion}  ${receiver.receiver_address}</div>
         </div>
         <div class="address-edit">
           <a href="#" class="btnEdit" onclick="javascript:changeAddress(${productIds});"></a>
         </div>
      </div>
    <!-- 收货地址 end -->
    
	<!-- 订单列表 start -->
	<ul class="cart-group clearfix">
		<c:forEach items="cardDetails" var="cardDetail">
	        <li class="ware-item">
	          <div class="ware-img"><img src="${cardDetail.productMasterPic}" alt="水果" /></div>
	          <div class="ware-info">
	             <div class="ware-t-box clearfix">
	                 <div class="ware-title">
	                     <span class="h2">${cardDetail.productName}</span>
	                     <span class="weight">${cardDetail.count}${cardDetail.unit}</span>
	                 </div>
	                 
	             </div>
	             <div class="cart-bar">
	             
	               <div class="price"> 
	                 <span class="price-sign">¥</span>
	                 <span class="price-num">${cardDetail.count}*${cardDetail.price}</span>
	               </div>
	               
	               </div>
	          </div>
	        </li>
		</c:forEach>
	</ul>
           
    <!-- 订单列表 end -->
    
    <!-- 预计到达时间 start -->
    <div class="box clearfix">
        <div class="box-left"><label>预计到达时间：</label></div>
        <div class="box-right">
          <P>${expectedArrivalTime}</P>
        </div>
    </div>
    <!-- 预计到达时间 end -->

    <!-- 可用代金券 start -->

     <div class="box voucherBox clearfix">
      <div class="box-left"><label>可用代金券：</label></div>
      <div class="box-right">
      	 <c:forEach items="coupons" var="coupon">
         <div class="voucher">
            <div class="checkbox"><label>使用${coupon.amount}元代金券</label> <i class="ico-checkbox"></i></div>
         </div>
         </c:forEach>
     </div>
     <!-- 可用代金券 end -->
    </section>
    
        
    <!-- 按钮 start -->
    <div class="orderBtn">
             <a href="" class="btnPrice"> 
                  <span class="label">总价：</span>
                  <span class="price-sign">¥</span>
                  <span class="price-num">${totalAmount}</span>
                  <span class="line"></span>
             </a>
             <a href="" class="btnPink">确认支付</a>
   </div>
   <!-- 按钮 end -->
</body>
<script type="text/javascript">
	function changeAddress(productIds){
		$.post("/changeAddrs", { "productIds" : productIds } );
	}
</script>
</html>