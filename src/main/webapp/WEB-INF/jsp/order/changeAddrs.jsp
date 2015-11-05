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
<title>收件地址</title>
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/common.js"></script>

</head>
<body>
    <!-- 收货地址 end -->
    <section class="bgGrey mb110">
      <div class="address-tit">收件地址</div>
      <c:forEach items="receivers" var="receiver">
      <c:if test="${receiver.masterOrNot == 0 }">
      <div class="deliver-address default-address clearfix">
         <div class="address-left">
             <div class="address-info">${receiver.receiverName}<c:if test="${receiver.receiverSex == 0}">（先生）</c:if><c:if test="${receiver.receiverSex == 1}">（女士）</c:if>  ${receiver.receiverMobile}</div>
             <div class="address-info">${receiver.receiverProvince}  ${receiver.receiverRegion}  ${receiver.receiver_address}</div>
         </div>
         <div class="address-edit">
           <a href="修改地址.html" class="btnEdit"></a>
           <span class="set-default"><a href="#" onclick="javascript:changeDefAddress(${receiver.id},${productIds});">设为默认地址</a></span>
         </div>
      </div>
      </c:if>
      <c:if test="${receiver.masterOrNot != 0 }">
      <div class="deliver-address clearfix">
         <div class="address-left">
             <div class="address-info">${receiver.receiverName}<c:if test="${receiver.receiverSex == 0}">（先生）</c:if><c:if test="${receiver.receiverSex == 1}">（女士）</c:if>  ${receiver.receiverMobile}</div>
             <div class="address-info">${receiver.receiverProvince}  ${receiver.receiverRegion}  ${receiver.receiver_address}</div>
         </div>
         <div class="address-edit">
           <a href="修改地址.html" class="btnEdit"></a>
           <span class="set-default"><a href="#" onclick="javascript:changeDefAddress(${receiver.id},${productIds});">设为默认地址</a></span>
         </div>
      </div>
      </c:if>
      </c:forEach>
    </section>
    <!-- 收货地址 end -->

        
    <!-- 按钮 start -->
    <div class="addressBtn">
             <a href="#" class="btnPink" onclick="javascript:createAddress(${productIds});"><span class="add-address"><i></i>新建收货地址</span></a>
   </div>
   <!-- 按钮 end -->
</body>
<script type="text/javascript">
	function changeDefAddress(receiverId, productIds){
		$.post("/changeDefAddrs", { "receiverId" : receiverId , "productIds" : productIds } );
	}
	
	function createAddress(productIds){
		//$.post("/toInsertReceiver", { "productIds" : productIds } );
	}
</script>
</html>