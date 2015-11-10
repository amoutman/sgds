<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/resource/js/libs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>订单确认</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resource/js/common.js"></script>
<script src="${ctx}/resource/js/center.js"></script>

</head>
<body>
    
    <section class="bgGrey mb110">
      <!-- 收货地址 end -->
      <c:if test="${receiver.receiverName != null}">
      <div class="deliver-address clearfix">
         <div class="address-left" id="currReceiver">
        	<div class="address-info">${receiver.receiverName}<c:if test="${receiver.receiverSex == 0}">（先生）</c:if><c:if test="${receiver.receiverSex == 1}">（女士）</c:if>  ${receiver.receiverMobile}</div>
            <div class="address-info">${receiver.receiverProvince}  ${receiver.receiverRegion}  ${receiver.receiverAddress}</div>
         </div>
         <div class="address-edit" id="address-tpye">
           <a href="javascript:void(0);" class="btnEdit" onclick="javascript:changeAddr();"></a>
         </div>
      </div>
      </c:if>
      <c:if test="${receiver.receiverName == null}">
	  	<div class="deliver-address clearfix">
		  	<div class="deliver-address clearfix">
	           <div class="clearfix" style="padding:10px 0; "><a class="btnPink2" href="javascript:void(0);" style="width:50%;float:none;margin:0 auto;display:block;" onclick="createAddr()">+添加收货地址</a></div>
	        </div>
		</div>
	  </c:if>
		<form action="${ctx}/order/orderCommit" id="orderForm" method="post">
	      <input type="hidden" name="receiverId" id="receiverId" value="${receiver.id}" />
	      <input type="hidden" name="productIds" id="productIds" value="${productIds}" />
	      <input type="hidden" name="eta" id="eta" value="${expectedArrivalTime}" />
	      <input type="hidden" name="couponId" id="couponId" value="" />
	    </form>
		<form action="${ctx}/order/prpareCreateAddr" id="prpareCreateAddrForm" method="post">
	      <input type="hidden" name="productIds" id="createAddrProductIds" value="${productIds}" />
	    </form>
	    <form action="${ctx}/order/prepareUpdateAddr" id="prepareUpdateAddrForm" method="post">
	      <input type="hidden" name="productIds" id="updateAddrProductIds" value="${productIds}" />
	      <input type="hidden" name="receiverId" id="updateAddrReceiverId" value="" />
	    </form>
	    <form action="${ctx}/order/prepareOrderPay" id="prepareOrderPayForm" method="post">
	      <input type="hidden" name="orderId" id="orderId" value="" />
	    </form>
    <!-- 收货地址 end -->
    
	<!-- 订单列表 start -->
      <ul class="cart-group clearfix">
      		<c:forEach items="${cardDetails}" var="cardDetail">
	        <li class="ware-item">
	          <div class="ware-img"><img src="${pageContext.request.contextPath}/resource/${cardDetail.productMasterPic}" alt="水果" /></div>
	          <div class="ware-info">
	             <div class="ware-t-box clearfix">
	                 <div class="ware-title">
	                     <span class="h2">${cardDetail.productName}</span>
	                     <span class="weight">${cardDetail.unit}  x${cardDetail.count}</span>
	                 </div>
	                 
	             </div>
	             <div class="cart-bar">
	             
	               <div class="price"> 
	                 <span class="price-sign">¥</span>
	                 <span class="price-num">${cardDetail.count * cardDetail.price}</span>
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
         <c:forEach items="${coupons}" var="coupon">
         <div class="voucher">
            <div class="checkbox" id="${coupon.id}" onclick="checkCoupon(this)"><label>使用${coupon.amount}元代金券</label> <i class="ico-checkbox"></i></div>
         </div>
         </c:forEach>
     </div>
     <!-- 可用代金券 end -->
    </section>
    
        
    <!-- 按钮 start -->
    <div class="orderBtn">
             <a href="javascript:void(0);" class="btnPrice"> 
                  <span class="label">总价：</span>
                  <span class="price-sign">¥</span>
                  <span class="price-num" id="totalAmount">${totalAmount}</span>
                  <span class="line"></span>
             </a>
             <a href="javascript:void(0);" class="btnPink" onclick="orderCommit()">提交订单</a>
   </div>
   <!-- 按钮 end -->
   
   
   
   <!-- 修改收货地址 start -->
	  	<div class="popbox" id="popbox-address">
        <div class="closeDiv"><a href="javascript:void(0);" class="close-btn" id="close-btn-address">x</a></div>
		<section class="clearfix bgGrey mb110" id = "changeAddrSection">
       <!-- 按钮 start -->
       <div class="addressBtn">
             <a href="javascript:void(0);" class="btnPink" onclick="createAddr()"><span class="add-address"><i></i>新建收货地址</span></a>
       </div>
       <!-- 按钮 end -->
		</section>
	</div>
   <!-- 修改收货地址 end -->
   <!-- 错误信息 end -->
    <div class="payErr">
     <div class="errcom" style="display:none;">
       <div style="top:1em;" class="errinfo">
                    <p><i><img src="${pageContext.request.contextPath}/resource/images/icon_erro.png"></i> 支付失败!</p>
                    <span class="greybg"></span>
                </div>
        </div>
   </div>
   <!-- 错误信息 end --> 
</body>
<script type="text/javascript">
	function orderCommit(){
		//地址判断
		var receiverId = $("#receiverId").val();
		if(receiverId == null || receiverId == ""){
			//错误显示
			$(".errinfo p").html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i>请先新建收货地址");
			$(".errinfo").css('display','block');
			setTimeout("$('.errinfo').css('display','none')",2000);
			return;
		}
		
		$.post(
				"${ctx}/order/orderCommit",
				$("#orderForm").serialize(),
				function(data){
					if (data.msg == "1") {
						// 跳到登录成功的页面
						$("#orderId").val(data.orderId);
						$("#prepareOrderPayForm").submit();
					} else {
						// 失败了
						$(".errinfo p").html("<i><img src='${pageContext.request.contextPath }/resource/images/icon_erro.png'></i> "+data.msg);
						$(".errinfo").css('display','block');
						setTimeout("$('.errinfo').css('display','none')",2000);
					}
				},
				"json"	
		);
	}

	function createAddr(){
		$("#prpareCreateAddrForm").submit();
	}
	
	function changeAddr(){
		$.post(
				"${pageContext.request.contextPath}/order/changeAddr",
				function(data){
					$("#changeAddrSection").html("<div class='addressBtn'><a href='javascript:void(0);' class='btnPink' onclick='createAddr()'><span class='add-address'><i></i>新建收货地址</span></a></div>");
					$.each(data.receivers, function(i,item){ 
						var str ="<div class='deliver-address clearfix'>"+
				         "<div class='address-left' onclick='selectAddr(this)' id='"+item.id+"'>"+
			             "<div class='address-info' >"+item.receiverName+"<c:if test='"+item.receiverSex == 0+"'>（先生）</c:if>"+
			             "<c:if test='"+item.receiverSex == 1+"'>（女士）</c:if>"+item.receiverMobile+"</div>"+
			             "<div class='address-info' >"+item.receiverProvince +"  "+ item.receiverRegion +"  "+ item.receiverAddress+"</div>"+
			         	 "</div>"+
			         	 "<div class='address-edit' >"+
			             "<a href='javascript:void(0);' class='btnEdit' onclick='updateAddr(this)' id='"+item.id+"'></a>"+
			         	 "</div></div>";
			         	$("#changeAddrSection").prepend(str);
		            });  
					// 修改收货地址弹窗 
					tickbox('close-btn-address','popbox-address','address-tpye');
				},
				"json"	
		);
	}
	
	function selectAddr(val){
		$("#currReceiver").html($(val).html());
		$("#receiverId").val(val.id);
		$("#close-btn-address").click();
	}
	
	function updateAddr(val){
		$("#updateAddrReceiverId").val(val.id);
		$("#prepareUpdateAddrForm").submit();
	}
	
	function checkCoupon(val){
	    $(val).children(".ico-checkbox").addClass("checked");
		$(val).parent(".voucher").siblings().children(".checkbox").children(".ico-checkbox").removeClass("checked");
		$(val).children("label").addClass("colorPink");
		$(val).parent(".voucher").siblings().children(".checkbox").children("label").removeClass("colorPink");
		$("#couponId").val(val.id);
		$.post(
				"${pageContext.request.contextPath}/order/checkCoupon",
				{
					"couponId":val.id,
					"productIds":$("#productIds").val()
				},
				function(data){
					if (data.msg == "1") {
						$("#totalAmount").text(data.actualAmountPay);
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