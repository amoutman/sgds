$(function () {
	$(".dropdown li:last-child").css("border-bottom","0");
	
	 //点击弹出
	 $(".titlebar").click(function () {
        $(this).children().children(".dropdown").slideDown();
		$(".shade").show();
    })

	 //点击以外的区域子 弹窗隐藏
    $(document).bind("click", function (e) {
        var target = $(e.target);
        if (target.closest(".titlebar").length == 0) {
            $(".dropdown").fadeOut('fast');
			$(".shade").hide();
        }
    })
	
	
	//全选按钮
	$(".orderbar .checkbox .ico-checkbox").click(function(){
		var isChecked = $(this).hasClass("checked");
		$(this).toggleClass("checked");
		if (!isChecked)
			$(".ware-info .ware-t-box .checkbox .ico-checkbox").addClass("checked");
		else
			$(".ware-info .ware-t-box .checkbox .ico-checkbox").removeClass("checked");
	});
		
	$(".ware-info .ware-t-box .checkbox .ico-checkbox").click(function(){
		$(this).toggleClass("checked");

		var allChecked = true;
		$(".ware-info .ware-t-box .checkbox .ico-checkbox").each(function() {
			if ($(this).hasClass("checked") == false)
				allChecked = false;
		});
		if (allChecked == true)
			$(".orderbar .checkbox .ico-checkbox").addClass("checked");
		else
			$(".orderbar .checkbox .ico-checkbox").removeClass("checked");
	});
	
	//付款方式选择
	$(".paybox .checkbox").click(function (){
         $(this).children(".ico-checkbox").addClass("checked");
		 $(this).parent(".paybox").siblings().children(".checkbox").children(".ico-checkbox").removeClass("checked");
    })
   $("#hdpay .checkbox").click(function (){
	    $(this).parent("#hdpay").addClass("hdpay");
	   })
	
//	//优惠券选择
//	 $(".voucher .checkbox").click(function () {
//        $(this).children(".ico-checkbox").addClass("checked");
//		$(this).parent(".voucher").siblings().children(".checkbox").children(".ico-checkbox").removeClass("checked");
//		$(this).children("label").addClass("colorPink");
//		$(this).parent(".voucher").siblings().children(".checkbox").children("label").removeClass("colorPink");
//		$("#couponId").val($(this).id);
//		$.post(
//				"${pageContext.request.contextPath}/order/checkCoupon",
//				{
//					"couponId":$(this).id,
//					"productIds":$("#productIds").val()
//				},
//				function(data){
//					if (data.msg == "1") {
//						$("#totalAmount").val(data.actualAmountPay);
//					} else {
//						// 失败了
//					}
//				},
//				"json"	
//		);
//    })
	
	//付款方式关闭		
	$(".mbox .btnDelete").click(function(){
		$(".mbox").fadeOut(300);
		$(".tcbg").fadeOut(300);
	})	
		
})


// 弹窗
function tickbox(closeID,boxID,typeID){
		$('#'+closeID+'').click(function(){
			$('#'+boxID+'').fadeOut();
			return false;
		});
		$('#'+typeID+'').click(function(){
			var h = $(document).height();
			$('#'+boxID+'').css({ 'min-height': h });	
			$('#'+boxID+'').center();
			$('#'+boxID+'').fadeIn();
			return false;
		});
}