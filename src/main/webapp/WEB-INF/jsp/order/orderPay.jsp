<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/resource/js/libs.jsp"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<title>支付页面</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/style.css" />
<script type="text/javascript" src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resource/js/common.js"></script>
<script type="text/javascript">
	function selectCashOnDelivery(){
		$(".mbox").show();
	}
	
	function confirmCashOnDelivery(orderId){
		$.post("${pageContext.request.contextPath}/order/orderPay", { "orderId" : orderId, "payMode" : 2 } );
	}
</script>
</head>
<body>
    
    <section class="bgGrey ">

    
    <!-- 预计到达时间 start -->
    <div class="box paybox clearfix">
        <div class="checkbox fl">
			<i class="ico-checkbox"></i>
	    </div>
        <div class="box-left"><label>微信支付</label><span class="payimg payimg1"></span></div>
    </div>
    <!-- 预计到达时间 end -->

    <!-- 可用代金券 start -->

     <div class="box paybox clearfix"  id="hdpay" onclick="selectCashOnDelivery()">
      <div class="checkbox fl">
			<i class="ico-checkbox"></i>
	  </div>
      <div class="box-left"><label>货到付款</label><span class="payimg payimg2"></span></div>

     </div>
     <!-- 可用代金券 end -->
    </section>
    
   <!-- 按钮 end -->
   
   
   <!--弹窗-->
   <div class="tcbg"></div>
   <div class="mbox" style="display:none;">
             <div class="mbcon">
                 <p>付款方式：<span class="colorred">货到付款</span></p>
                 <p>付款总额：<span class="coloryello font20">230￥</span></p>
             </div>
             <div class="mboxbtn">
             <a href="" class="btnPink" onclick="confirmCashOnDelivery(${orderId})">确认</a> <a href="#" class="btnDelete">取消</a>
             </div>
   </div>
   

   
</body>

</html>