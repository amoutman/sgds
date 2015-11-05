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
<script src="${pageContext.request.contextPath}/resource/js/center.js"></script>
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
              	
                <div class="ware-img"><a href="${pageContext.request.contextPath}/product/toProductDetails?productId=${cd.productId }"><img src="${pageContext.request.contextPath}/resource/images/demo06.jpg" alt="水果" /></a></div>
                <div class="ware-info">
                	
                   <div class="ware-t-box clearfix">
                       <div class="ware-title">
                           <span class="h2">${cd.productName } 	
                       	   </span>
                           <span class="weight">${cd.unit }</span>
                       </div>
                       <div class="checkbox fr">
                       		<input type="hidden" name="productId" id="productId" value="${cd.productId }"/>
                		 	<input type="hidden" name="cdId" id="cdId" value="${cd.id}"/>
                       		<i class="ico-checkbox" name="isCheck"></i>
			          	</div>
                   </div>
                   <div class="cart-bar">
                   
                     <div class="price"> 
                       <span class="price-sign">¥</span>
                       <span class="price-num">${cd.price }</span>
                     </div>
                      <div class="detai-num">
                         <a href="javascript:void(0);" onClick="subCount(this)" class="num-math pull-left" opr="jian"><i>-</i></a>
                         <input type="hidden" name="productId" id="productId" value="${cd.productId }"/>
                		 <input type="hidden" name="cdId" id="cdId" value="${cd.id}"/>
                		 <input type="hidden" name="price" id="price" value="${cd.price}"/>
                         <input type="text" value="${cd.count }" class="num-input" id="count">
                         <a href="javascript:void(0);" onClick="addCount(this)" class="num-math pull-right" opr="jia"><i>+</i></a>
                      </div>
                      
                   </div>
                </div>
              </li>
         </c:forEach>     
           </ul>
           <!--产品列表 end-->
     
    </section>
    
    
    <!-- 按钮 start -->
    <div class="cartBtn cartBtn2">
             <a href="" class="btnPrice"> 
                  <span class="label">总价：</span>
                  <span class="price-sign">¥</span>
                  <span class="price-num" id="totalAmount">${cart.settleAmount}</span>
                  <span class="line"></span>
             </a>
             <a href="javascript:void(0);" class="btnDelete" onClick="deleteProduct()">删  除</a>
             <a href="javascript:void(0);" class="btnPink" onClick="toBuyProduct()" id="buyBtn">立即购买<input type="hidden" id="cartId" name="cartId" value="${cart.id }" /></a>
   </div>
   <!-- 按钮 end -->
   
   <!--底部导航 start-->
    <nav class="app-nav">
      <a href="javascript:void(0);" class="app-link app-link1 curr">
        <span class="app-icon"></span>
        <span class="nm">购物车</span>
      </a>
      <a href="${pageContext.request.contextPath}/index/toIndexPage" class="app-link app-link2">
        <span class="app-icon"></span>
        <span class="nm">首页</span>
      </a>
      <a href="${pageContext.request.contextPath}/userCenter/toUserCenter" class="app-link app-link3">
        <span class="app-icon"></span>
        <span class="nm">我的</span>
      </a>
    </nav>
    <!--底部导航 end-->
     <!-- 登录弹窗 start -->
	  	<div class="popbox" id="popbox-login">
        <div class="closeDiv"><a href="#" class="close-btn" id="close-btn-login" onClick="closeLogin()">x</a></div>
		<section class="clearfix">
        <div class="errcom">
       <div class="errinfo" style="display:none;">
                    <p><i><img src="images/icon_erro.png"></i> 请输入正确的手机号</p>
                    <span class="greybg"></span>
                </div>
        </div>
       <div class="com">
			<div class="com-left">账号：</div>
			<div class="com-right">
				<input type="text" placeholder="请输入您的账号 "/>
			</div>
		</div>
        <div class="line"></div>
		<div class="com">
			<div class="com-left">密码：</div>
			<div class="com-right">
				<input type="password" class="fl" placeholder="请输入您的密码">
			</div>
            
		</div>
	</section>
    <div class="login-bottom">	
        <button onClick="login()">登录</button>
        <p><a href="javascript:void(0);"  class="fr">忘记密码</a> <a href="">注册</a>  </p>
    </div>
	</div>
   <!-- 登录弹窗 end -->
   <form action="${pageContext.request.contextPath}/order/orderConfirm" id="orderConfirmForm" method="post">
   		<input type="hidden" name="productIds" id="productIds"/>
   </form>
</body>
<script type="text/javascript">
	function deleteProduct(){
		var productIds = "";
		var cdIds = "";
		$("i[name='isCheck']").each(function(){
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
			$.post(
				"deleteProductFromCart",
				{
					"productIds":productIds,
					"cdIds":cdIds
				},
				function(data){
					if(data["success"]){
						$("i[name='isCheck']").each(function(){
							$(this).parents(".ware-item").html("");
						});
					}
				},
				"json"
				)
			}
	}
	
	function addCount(obj){
		var currentCount = $(obj).parent().find("#count").val();
		var aCount = Number(currentCount) + 1;
		var cdId = $(obj).parent().find("#cdId").val();
		var productId = $(obj).parent().find("#productId").val();
		var price = $(obj).parent().find("#price").val();
		var totalAmount = $("#totalAmount").html();
		var newAmount = (Number(totalAmount)+Number(price)).toFixed(2);
		$.post(
			"calProductCount",
			{
				"type":"add",
				"cdId":cdId,
				"productId":productId,
				"count":aCount
			},
			function(data){
				if(data["success"]){
					$(obj).parent().find("#count").val(aCount);
					$("#totalAmount").html(newAmount);
				}
			},
			"json"
		)
		
	}
	
	function subCount(obj){
		var currentCount = $(obj).parent().find("#count").val();
		if(currentCount == 1){
			alert("商品数量至少为1!");
			return;
		}else{
			var aCount =  Number(currentCount) - 1;
			var cdId = $(obj).parent().find("#cdId").val();
			var productId = $(obj).parent().find("#productId").val();
			var price = $(obj).parent().find("#price").val();
			var totalAmount = $("#totalAmount").html();
			var newAmount = (Number(totalAmount)-Number(price)).toFixed(2);
			$.post(
				"calProductCount",
				{
					"type":"sub",
					"cdId":cdId,
					"productId":productId,
					"count":aCount
				},
				function(data){
					if(data["success"]){
						$(obj).parent().find("#count").val(aCount);
						$("#totalAmount").html(newAmount);
					}
				},
				"json"
		)
		
		}
		
	}
	
	function login(){
		var userName = $("#userName").val();
		var passworde = $("#password").val();
		
		$.post(
			"toLogin",
			{
				"userName":userName,
				"password":password
			},
			function(data){
				if(data["success"]){
					toOrder();
				}else{
					alert("用户名或密码错误");
				}
			},
			"json"
		)
	}
	
	function toBuyProduct(){
		$.post(
			"toBuyProduct",
			function(data){
				if(data["success"]){
					toOrder();
				}else{
					showLogin('popbox-login');
				}
			},
			"json"
		)
	}
	
	function toOrder(){
		var productIds = "";
		$("i[name='isCheck']").each(function(){
			if($(this).hasClass("checked") == true){
				if(productIds == ""){
					productIds = $(this).parent().find("#productId").val();
				}else{
					productIds = productIds +"," +$(this).parent().find("#productId").val();
				}
			}
		});
		$("#productIds").val(productIds);
		$("orderConfirmForm").submit();
	}
	
	$(function(){
		// 登录弹窗 tickbox('close-btn-login','popbox-login','buyBtn');	
		
	});	
	
	function closeLogin(){
		$('#popbox-login').fadeOut();
		return false;
	}
	
	function showLogin(boxID){
		var h = $(document).height();
		$('#'+boxID+'').css({ 'min-height': h });	
		$('#'+boxID+'').center();
		$('#'+boxID+'').fadeIn();
		return false;
	}
</script>
</html>