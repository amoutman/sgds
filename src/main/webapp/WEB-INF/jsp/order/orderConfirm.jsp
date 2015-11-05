<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/resource/js/libs.jsp"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>订单确认</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/center.js"></script>
</head>
<body>
    
    <section class="bgGrey mb110">
    <form action="${pageContext.request.contextPath}/order/orderCommit" id="orderForm" method="post">
      <!-- 收货地址 end -->
      <div class="deliver-address clearfix">
         <div class="address-left" id="currReceiver">
             <div class="address-info">${receiver.receiverName}<c:if test="${receiver.receiverSex == 0}">（先生）</c:if><c:if test="${receiver.receiverSex == 1}">（女士）</c:if>  ${receiver.receiverMobile}</div>
             <div class="address-info">${receiver.receiverProvince}  ${receiver.receiverRegion}  ${receiver.receiver_address}</div>
             <input type="hidden" name="order.receiverId" id="receiverId" value="${receiver.id}" />
             <input type="hidden" name="order.productIds" id="productIds" value="${productIds}" />
             <input type="hidden" name="order.eta" id="eta" value="${expectedArrivalTime}" />
             <input type="hidden" name="order.couponId" id="couponId" value="" />
         </div>
         <div class="address-edit" id="address-tpye">
           <a href="#" class="btnEdit" onclick="changeAddr()"></a>
         </div>
      </div>
     </form>
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
            <div class="checkbox" id="${coupon.id}" onclick="checkCoupon(this)"><label>使用${coupon.amount}元代金券</label> <i class="ico-checkbox"></i></div>
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
                  <span class="price-num" id="totalAmount">${totalAmount}</span>
                  <span class="line"></span>
             </a>
             <a href="" class="btnPink" onclick="orderCommit()">提交订单</a>
   </div>
   <!-- 按钮 end -->
   
   
   
   <!-- 修改收货地址 start -->
	  	<div class="popbox" id="popbox-address">
        <div class="closeDiv"><a href="#" class="close-btn" id="close-btn-address">x</a></div>
		<section class="clearfix bgGrey mb110">
       <!-- 按钮 start -->
       <div class="addressBtn">
             <a href="添加地址.html" class="btnPink" onclick="createAddr()"><span class="add-address"><i></i>新建收货地址</span></a>
       </div>
       <!-- 按钮 end -->
		</section>
	</div>
   <!-- 修改收货地址 end -->
   
</body>
<script type="text/javascript">
/**
 * 更改收货地址
 */
function changeAddr(){
	$.post(
			"${pageContext.request.contextPath}/order/changeAddr",
			function(data){
				for(receiver in data.receivers){
					var str ="<div class="+"deliver-address clearfix"+">"+
			         "<div class='address-left' onclick='selectAddr("+${receiver.id}+")' id='"+${receiver.id}+"'>"+
		             "<div class='address-info' >"+${receiver.receiverName}+"<c:if test="+${receiver.receiverSex == 0}+">（先生）</c:if>"+
		             "<c:if test="+${receiver.receiverSex == 1}+">（女士）</c:if>"+ ${receiver.receiverMobile}"+</div>"+
		             "<div class='address-info' >"+${receiver.receiverProvince}+ ${receiver.receiverRegion}+ ${receiver.receiver_address}+"</div>"+
		         	 "</div>"+
		         	 "<div class='address-edit' >"+
		             "<a href='#' class='btnEdit' onclick='updateAddr("+${receiver.id}+")'></a>"+
		         	 "</div></div>";
					$(".addressBtn").before(str);
				}
				// 修改收货地址弹窗
				tickbox('close-btn-address','popbox-address','address-tpye');
			},
			"json"	
	);
}

/**
 * 选择收货地址
 */
function selectAddr(receiverId){
	$("#currReceiver").html($("#"+receiverid).html());
	$("#receiverId").val(receiverId);
}

/**
 * 订单提交
 */
function orderCommit(){
	$("#orderForm").submit();
}

function updateAddr(receiverId){
	/**获取productIds */
	var productIds = $("#productIds").val();
	$.post("${pageContext.request.contextPath}/order/prepareUpdateAddr", { "receiverId" : receiverId , "productIds" : productIds } );
}

function createAddr(){
	/**获取productIds */
	var productIds = $("#productIds").val();
	$.post("${pageContext.request.contextPath}/order/prpareCreateAddr", { "productIds" : productIds } );
}

function checkCoupon(val){
    $(val).children(".ico-checkbox").addClass("checked");
	$(val).parent(".voucher").siblings().children(".checkbox").children(".ico-checkbox").removeClass("checked");
	$(val).children("label").addClass("colorPink");
	$(val).parent(".voucher").siblings().children(".checkbox").children("label").removeClass("colorPink");
	$("#couponId").val($(val).id);
	$.post(
			"${pageContext.request.contextPath}/order/checkCoupon",
			{
				"couponId":$(val).id,
				"productIds":$("#productIds").val()
			},
			function(data){
				if (data.msg == "1") {
					$("#totalAmount").val(data.actualAmountPay);
				} else {
					// 失败了
					alert(data.msg);
				}
			},
			"json"	
	);
}
</script>
</html>