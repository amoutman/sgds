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
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<style>
.app-nav{ max-width:100%;}
</style>
</head>
<body>
<section class="bgGrey mb210 clearfix">
      <div class="orderbar">
            <div class="checkbox fr">
			<label>全选</label><i class="ico-checkbox"></i>
			</div>
            <h2>订单列表</h2>
      </div>
     
       <!--产品列表 start-->
       <ul class="cart-group clearfix">
       <c:forEach var="cd" items="${cart.cdList}">
              <li class="ware-item">
                <div class="ware-img"><a href=""><img src="${pageContext.request.contextPath}/resource/${cd.productMasterPic }" alt="水果" /></a></div>
                <div class="ware-info">
                   <div class="ware-t-box clearfix">
                       <div class="ware-title">
                           <span class="h2">${cd.productName }</span>
                           <span class="weight">${cd.unit }</span>
                       </div>
                       <div class="checkbox fr">
                       <input type="hidden" name="productId" id="productId" value="${cd.productId }"/>
                       <input type="hidden" name="cdId" id="cdId" value="${cd.id}"/>
                       <li class="ico-checkbox" name="isCheck"></li>
			          </div>
                   </div>
                   <div class="cart-bar">
                   
                     <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${cd.price }</span>
                     </div>
                      <div class="detai-num">
                         <a href="javascript:void(0);" onClick="addCount(this)" class="num-math pull-left" opr="jian"><i>-</i></a>
                         <input type="text" value="${cd.count }" class="num-input" id="count">
                         <a href="javascript:void(0);" onClick="subCount(this)" class="num-math pull-right" opr="jia"><i>+</i></a>
                      </div>
                      
                   </div>
                </div>
              </li>
         </c:forEach>     
           </ul>
           <!--产品列表 end-->

    
    <!-- 收货地址 end -->

      <div class="deliver-address clearfix">
         <div class="address-left">
             <div class="address-info">李健（先生）  15330228301</div>
             <div class="address-info">大望路  温特莱中心  a座20层</div>
         </div>
         <div class="address-edit">
           <a href="" class="btnEdit"></a>
         </div>
      </div>
     <!-- 收货地址 end -->
     
    </section>
    
    
    <!-- 按钮 start -->
    <div class="cartBtn cartBtn2">
             <a href="" class="btnPrice"> 
                  <span class="label">总价：</span>
                  <span class="price-sign">¥</span>
                  <span class="price-num">${cart.settleAmount}</span>
                  <span class="line"></span>
             </a>
             <a href="javascript:void(0);" class="btnDelete" onClick="deleteProduct()">删  除</a>
             <a href="javascript:void(0);" class="btnPink">立即购买<input type="hidden" id="cartId" name="cartId" value="${cart.id }" /></a>
   </div>
   <!-- 按钮 end -->
   
   <!--底部导航 start-->
    <nav class="app-nav">
      <a href="购物车.html" class="app-link app-link1 curr">
        <span class="app-icon"></span>
        <span class="nm">购物车</span>
      </a>
      <a href="首页.html" class="app-link app-link2">
        <span class="app-icon"></span>
        <span class="nm">首页</span>
      </a>
      <a href="个人中心.html" class="app-link app-link3">
        <span class="app-icon"></span>
        <span class="nm">我的</span>
      </a>
    </nav>
    <!--底部导航 end-->
</body>
<script type="text/javascript">
	function deleteProduct(){
		var productIds = "";
		var cdIds = "";
		$("li[name='isCheck']").each(function(){
			if($(this).hasClass("checked") == true){
				if(productIds == ""){
					productIds = $(this).parent().find("#productId").val();
				}else{
					productIds = productIds +"," +$(this).parent().find("#productId").val();
				}
				
				if(cdIds == ""){
					cdIds = $(this).parent().find("#cdId").val();
				}else{
					cdIds = cdIds +"," +$(this).parent().find("#cdId").val();
				}
				
			}
		});
		if(confirm("确定要删除这些商品？")){
			$.post{
				"cart/deleteProductFromCart",
				{
					"productIds":productIds,
					"cdIds":cdIds
				},
				function(data){
					if(true){
						$("li[name='isCheck']").each(function(){
							$(this).parents(".ware-item").html("");
						});
					}
				},
				"json"
				}
			}
	}
	
	function addCount(obj){
		var currentCount = $(obj).parent().find("#count").val();
		var aCount = currentCount + 1;
		var cdId = $(obj).parents("。ware-item").find("#cdId").val();
		$.post{
			"cart/calProductCount",
			{
				"cdId":cdId,
				"count":aCount,
				"type":"add"
			},
			function(data){
				if(true){
					$(obj).parent().find("#count").val(aCount);
				}
			},
			"json"
		}
		
	}
	
	function subCount(obj){
		var currentCount = $(obj).parent().find("#count").val();
		if(currentCount == 1){
			alert("商品数量至少为1!");
			return;
		}else{
			var aCount = currentCount - 1;
			var cdId = $(obj).parents("。ware-item").find("#cdId").val();
			$.post{
				"cart/calProductCount",
				{
					"cdId":cdId,
					"count":aCount,
					"type":"sub"
				},
				function(data){
					if(true){
						$(obj).parent().find("#count").val(aCount);
					}
				},
				"json"
		}
		
		}
		
	}
		
</script>
</html>