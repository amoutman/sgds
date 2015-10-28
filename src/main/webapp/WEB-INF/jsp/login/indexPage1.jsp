<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
 <meta name="apple-mobile-web-app-capable" content="yes" />
 <meta name="apple-mobile-web-app-status-bar-style" content="blank" />
 <meta name="format-detection" content="telephone=no" />
 <meta content="email=no" name="format-detection" />
 <title>首页</title>
 <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/style.js"></script>
	
	<script type="text/javascript">
    //标签切换
      $(function(){
		   var len=$("#deconum > li").length;	//小圆点的个数
		   var timer;
		   var index=0;	
		   $("#deconum li").mouseover(function(){
			     index=$("#deconum li").index(this);
				 showImage(index);
		   }).eq(0).mouseover();
			 timer=setInterval(function(){
				 showImage(index);
				 index++;
				 if(index==len){
					 index=0;
					 }
			},3000);
	    });
	    function showImage(index){//内容和圆点相关联的函数
		   $("#decoimg_a .decoimg_b").eq(index).fadeIn(400).siblings().hide();
		   $("#deconum li a").removeClass("current").eq(index).addClass("current");
		} 

	//菜单锚点定位           
	jQuery.fn.anchorGoWhere = function(options){
		 var obj = jQuery(this);
		  var defaults = {target:0, timer:1000};
		  var o = jQuery.extend(defaults,options);
		  obj.each(function(i){
			  jQuery(obj[i]).click(function(){
				  var _rel = jQuery(this).attr("href").substr(1);
				  switch(o.target){
					  case 1: 
						 var _targetTop = jQuery("#"+_rel).offset().top;
						 jQuery("html,body").animate({scrollTop:_targetTop},o.timer);
						 break;
					case 2:
						 var _targetLeft = jQuery("#"+_rel).offset().left;
						 jQuery("html,body").animate({scrollLeft:_targetLeft},o.timer);
						 break;
				 }
				 return false;
			 });                  
		 });
	 };
	 
 $(function() {
	 
	 //菜单锚点定位调用函数  
     $(".goTop,.goDown").anchorGoWhere({target:1});

    //视觉差背景滚动
     s = skrollr.init();
	 
	 //地图
	 var random = function() {
			return parseInt(Math.random() * 14);
		}
	var animat = function() {
	var n = random();
	$(".mapbox > div").each(function(index) {
				if (n == index) {
					$(this).fadeIn(1000);
				} else {
					$(this).fadeOut(1000);
				}
			});
	}
	setInterval(animat, 2000);	
    });
	
	
	//输入框点击默认文字消失，字体颜色改变
   $(document).ready(function(){
	   
	$(".amount1").click(function(){
	if($(this).val()=="YOU SEND"){
	  $(this).val("");
	  $(this).addClass("focus");
	}
	});
	$(".amount1").blur(function(){
	if($(this).val()==""){
	$(this).val("YOU SEND");
	 $(this).removeClass("focus");
	}
	});
	
	$(".amount2").click(function(){
	if($(this).val()=="RECIVED"){
	  $(this).val("");
	  $(this).addClass("focus");
	}
	});
	$(".amount2").blur(function(){
	if($(this).val()==""){
	$(this).val("RECIVED");
	 $(this).removeClass("focus");
	}
	});
	
}); 
    function calAmount(){
        var currName = $("#currName").html();
    	if(currName == "Currency"){
    		alert("请选择接收币种");
    	}else{
    		var exchangeRate = $("#nExchangeRate").val();
    		var exchangeRateHigh = $("#nExchangeRateHigh").val();
    		var currSign = $("#nCurrSign").val();
			var trsAmount = $("#amount-send").val();
			var cRate = (Number(exchangeRate)-Number(exchangeRateHigh)).toFixed(4);
			var changeAmount = (Number(trsAmount)*100).toFixed(2);
			//var chAmount = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cAmount = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cRateAmount = (Number(trsAmount)/Number(cRate)).toFixed(2);
			$("#amount-recived").val(cAmount);
			$("#trsAmt").html(cRateAmount);
			//$("#trsSign").html(currSign);
		}
	}
	
	function calAmountf(){
        var currName = $("#currName").html();
    	if(currName == "Currency"){
    		alert("请选择接收币种");
    	}else{
    		var exchangeRate = $("#nExchangeRate").val();
    		var exchangeRateHigh = $("#nExchangeRateHigh").val();
    		var currSign = $("#nCurrSign").val();
			var trsAmount = $("#amount-recived").val();
			var cRate = (Number(exchangeRate)-Number(exchangeRateHigh)).toFixed(4);
			alert(cRate);
			var changeAmount = (Number(trsAmount)/100).toFixed(2);
			alert(changeAmount);
			var cAmount = (Number(changeAmount)*Number(exchangeRate)).toFixed(2);
			var cRateAmount = (Number(changeAmount)*Number(cRate)).toFixed(2);
			$("#amount-send").val(cAmount);
			$("#trsAmt").html(cRateAmount);
			//$("#trsSign").html(currSign);
		}
	}
	
	function manageCurr(obj){
		var currencyName = $(obj).find("#currencyName").val();
		var currSign = $(obj).find("#currSign").val();
		var exchangeRate = $(obj).find("#exchangeRate").val();
		var exchangeRateHigh = $(obj).find("#exchangeRateHigh").val();
		
		$("#nExchangeRate").val(exchangeRate);
		$("#nExchangeRateHigh").val(exchangeRateHigh);
		$("#nCurrSign").val(currSign);
		$("#currName").html(currencyName);
		
		var trsAmount = $("#amount-recived").val();
		if(trsAmount != "RECIVED" && trsAmount != ""){
			var exchangeRateHigh = $("#nExchangeRateHigh").val();
			var exchangeRate = $("#nExchangeRate").val();
			var cRate = (Number(exchangeRate)-Number(exchangeRateHigh)).toFixed(4);
			
    		var currSign = $("#nCurrSign").val();
			var changeAmount = (Number(trsAmount)/100).toFixed(2);
			var cAmount = (Number(changeAmount)*Number(exchangeRateHigh)).toFixed(2);
			var cRateAmount = (Number(changeAmount)*Number(cRate)).toFixed(2);
			$("#amount-send").val(cAmount);
			$("#trsAmt").html(cRateAmount);
			//$("#trsSign").html(currSign);
		}
	}
	
	function toSendMoney(){
		var currName = $("#currName").html();
		var rAmount = $("#amount-recived").val();
		var sAmount = $("#amount-send").val();
		window.location.href="${pageContext.request.contextPath }/trans/toSendMoneyS?currName="+currName+"&sAmount="+sAmount+"&rAmount="+rAmount;
	}
</script>
<style>
  .focus{color:#1293c7 !important; font-size:18px !important; font-family:fontBk;}
</style>
  </head>
  
  <body>
    <!--左侧部分 start-->
<div id="main_left">
<header>
      <div class="logo"><a class="icon" href="${pageContext.request.contextPath}/user/toIndexPage"></a></div>
     <!-- 移动端显示的隐藏菜单小图标 start--><div class="smallmenu"><a href="javascript:void(0)" class="icon"></a></div><!--移动端显示的隐藏菜单小图标 end-->
      <div class="menu">
       <ul>
            <li><a href="#goTop" class="goTop sendmoney">send  money</a></li>
            <li><a href="#goDown" class="goDown">how it works</a></li>
            <li class="col91"><a href="${pageContext.request.contextPath}/user/toRegister">SIGN UP</a></li>
            <li class="col91"><a href="${pageContext.request.contextPath}/user/toLogin">login</a></li>
       </ul>
       
      <!-- 国旗 start --> 
      <span class="icon flag-en"></span>
      <span class="icon flag-china" style="display:none;"></span>
      <!--国旗 end-->
      
      <p class="social">
      <a class="icon icon-tw" target="_blank" title="Twitter" href=""></a> <a class="icon icon-fb" target="_blank" title="Facebook" href=""></a> <a class="icon icon-gp" target="_blank" title="Google+" href=""></a>
      </p>
      </div>
</header>
    <!--移动端显示下点击右上小图标显示菜单 start-->
    <div class="dropmenu">
          <ul class="ul1">
             <li><a href="${pageContext.request.contextPath }/account/toAccount">Account Management</a></li>
            <li><a href="${pageContext.request.contextPath }/trans/toTransquery">Transaction Query</a></li>
            <li><a href="${pageContext.request.contextPath }/payee/toUserPayee">Payee Management</a></li>
          </ul>
          <ul class="ul2">
            <li><a href="${pageContext.request.contextPath }/trans/toSendMoney">send  money</a></li>
            <li><a href="javascript:void(0)">how it works</a></li>
            <li><a href="${pageContext.request.contextPath}/user/toRegister">register</a></li>
          </ul>
      </div>
  <!-- 移动端显示下点击右上小图标显示菜单 end   -->
</div>
<!--左侧部分 end-->

<!--右侧部分 start-->
<div id="main_right">
<section>
   <!--首页右侧第一部分 start-->
   <div class="m-onefloor" id="goTop">
         <h2>move  money  for  more</h2>
         <p class="desc">Banks charge hidden fees when you send money abroad. <br/>
            With TransferWise you save up to 90%. Problem solved, money saved.</p>
         <div class="m-append">
        	 <div class="m-calculator clearFix mt40">
            <input type="text" maxlength="" value="YOU SEND" id="amount-send" class="amount" name="sourceValue" onchange="calAmount()" onblur="javascript:if($(this).val()==''){$(this).val('YOU SEND');}" onfocus="javascript:if($(this).val()=='YOU SEND'){$(this).val('');}">
            <div class="m-calculator-con calculator-c1">
                <span class="calculator-tit icon">RMB</span>
                <span class="calculator-rect"></span>
                <ul class="calculator-dis" style="display:none">
                <c:forEach var="curr" items="${currList }" varStatus="vs">
          			<c:if test="${curr.currencyCode == '1' }">
    					<li onclick="wuyetdclick(this)" class="dishover"><span class="money-icon1"><img src="${pageContext.request.contextPath}/resource/images/rmb.png"></span>RMB</li>   			     	
          			</c:if>
          			<c:if test="${curr.currencyCode != '1' }">
          				<li onclick="wuyetdclick(this)"><span class="money-icon${curr.currencyCode }"><img src="${pageContext.request.contextPath}/resource/${curr.picPath}"></span>${curr.currencyName }</li>                    
          			</c:if>    
		 		</c:forEach>

                </ul>
            </div>
         </div>
         </div>
         <div class="m-append">
      	   <div class="m-calculator m-calculator2 clearFix mt10">
            <input type="text" maxlength="" value="RECIVED" id="amount-recived" class="amount" name="sourceValue" onchange="calAmountf()" onblur="javascript:if($(this).val()==''){$(this).val('RECIVED');}" onfocus="javascript:if($(this).val()=='RECIVED'){$(this).val('');}">
            <div class="m-calculator-con calculator-c2">
                <span class="calculator-tit icon" id="currName">Currency</span><input type="hidden" id="nCurrSign"/><input type="hidden" id="nExchangeRate"/><input type="hidden" id="nExchangeRateHigh"/>
                <span class="calculator-rect"></span>
                <ul class="calculator-dis" style="display:none">
                <c:forEach var="curr" items="${currList }" varStatus="vs">
          			<li onclick="manageCurr(this)">
          			<input type="hidden" id="currencyName" value="${curr.currencyName }"/>
          			<input type="hidden" id="currSign" value="${curr.currencySign }"/>
          			<input type="hidden" id="exchangeRate" value="${curr.exchangeRate }"/>
          			<input type="hidden" id="exchangeRateHigh" value="${curr.exchangeRateHigh }"/>
          			<span class="money-icon${curr.currencyCode }"><img src="${pageContext.request.contextPath}/resource/${curr.picPath}"></span>${curr.currencyName }</li>                       
		 		</c:forEach>
                </ul>
            </div>
         </div>
         </div>
         <p>You could save an average of <span id="trsSign">￥</span><span id="trsAmt">0.00</span> vs your bankWhy?</p>
         <a class="btn startBtn" href="javascript:void(0)" onclick="toSendMoney()">GET STARTED</a>
   </div>
   <!--首页右侧第一部分 end-->
   
   <!--首页右侧第二部分 start-->
   <div class="m-twofloor clearFix">
      <div class="m-art">
         <div class="art-con">
          <strong>WELCOME TO MONEY 
    WITHOUT BORDERS</strong>
         <span>Sending money abroad is deceptively expensive, thanks to the hidden fees we’ve all been forced to pay. The banks claim “free money transfers”, “0% commission.” </span>
         </div>
         <div class="bgbar"></div>
       </div>
       <ul id="da-thumbs" class="da-thumbs">
            <li class="da-thumbs-one">
                <a href="">
                    <span class="icon"></span>
             	    <h2>cost</h2>
                    <div class="descDiv">
                       <span class="icon"></span>
             	       <p>Instant transfer to many countries.Send & receive notifications by SMS and email.</p>
                    </div>
                </a>
            </li>
            <li class="da-thumbs-two">
                <a href="">
                    <span class="icon"></span>
             	    <h2>Fast</h2>
                    <div class="descDiv">
                        <span class="icon"></span>
                        <p>Instant transfer to many countries.Send & receive notifications by SMS and email.</p>
                     </div>
                </a>
            </li>
            <li class="da-thumbs-three">
                <a href="">
                    <span class="icon"></span>
             	    <h2>simpe</h2>
                    <div class="descDiv">
                        <span class="icon"></span>
                        <p>Instant transfer to many countries.Send & receive notifications by SMS and email.</p>
                    </div>
                </a>
            </li>
            <li class="da-thumbs-four">
                <a href="">
                    <span class="icon"></span>
             	    <h2>truth</h2>
                    <div class="descDiv">
             	     <span class="icon"></span>
             	     <p>Instant transfer to many countries.Send & receive notifications by SMS and email.</p>
                   </div>
                </a>
            </li>
		</ul>
   </div>
   <!--首页右侧第二部分 end-->
   
   <!--首页右侧第三部分 start-->
   <div class="m-three-floor clearFix">
      <p class="starblock img" data-move-y="0px" data-move-x="-350px"><img src="${pageContext.request.contextPath}/resource/images/banner-1.png"></p>
      <p class="text starblock" data-move-y="0px" data-move-x="350px"><img src="${pageContext.request.contextPath}/resource/images/text.png"></p>
      <p class="text2"><img src="${pageContext.request.contextPath}/resource/images/text2.png"></p>
   </div>
   <!--首页右侧第三部分 end-->
   
   <!--视觉差滚屏 start-->
  
   <div class="m-four-floor clearFix">
       <h2>How do we help you save money</h2>
       <ul class="clearFix">
       	<li>
           <h3>More money than banks and other enterprises</h3>
           <p><img src="${pageContext.request.contextPath}/resource/images/infor-1.png"></p>
        </li>
        <li>
           <h3>More money than banks and other enterprises</h3>
           <p><img src="${pageContext.request.contextPath}/resource/images/infor-2.png"></p>
        </li>
        <li>
           <h3>More money than banks and other enterprises</h3>
           <p><img src="${pageContext.request.contextPath}/resource/images/infor-3.png"></p>
        </li>
       </ul>
   </div>
   <!--视觉差滚屏 end-->
   
   <!--标签切换 start-->
   <div class="m-five-floor clearFix" id="goDown">
        
       <div id="decoroll" class="tab-content">
            <h2>How it works</h2>
            <!--内容切换 end-->
            <div id="decoimg_a" class="tab-con">
                <div class="decoimg_b">
                    <p class="img"><img src="${pageContext.request.contextPath}/resource/images/how-1.png"></p>
                	<h3>Get started</h3>
                    <p>
                    Enter how much you're transferring and 
                    where to. You can send to your own
                     account abroad or another person or
                      business.
                     </p>
                </div>
                <div class="decoimg_b">
                   <p class="img"><img src="${pageContext.request.contextPath}/resource/images/how-2.png"></p>
                	<h3>Get started2</h3>
                    <p>
                    Enter how much you're transferring and 
                    where to. You can send to your own
                     account abroad or another person or
                      business.
                     </p>
                </div>
                <div class="decoimg_b">
                   <p class="img"><img src="${pageContext.request.contextPath}/resource/images/how-3.png"></p>
                	<h3>Get started3</h3>
                    <p>
                    Enter how much you're transferring and 
                    where to. You can send to your own
                     account abroad or another person or
                      business.
                     </p>
                </div>
                <div class="decoimg_b">
                   <p class="img"><img src="${pageContext.request.contextPath}/resource/images/how-4.png"></p>
                	<h3>Get started4</h3>
                    <p>
                   Enter how much you're transferring and 
                    where to. You can send to your own
                     account abroad or another person or
                      business.
                     </p>
                </div>
            </div>
            <!--内容切换 end-->
            
            <!--数字切换 start-->
            <ul id="deconum" class="num_a">
                <li><a href="javascript:void(0)" hidefocus="true" target="_self" class="current">01</a></li>
                <li><a href="javascript:void(0)" hidefocus="true" target="_self">02</a></li>
                <li><a href="javascript:void(0)" hidefocus="true" target="_self">03</a></li>
                <li><a href="javascript:void(0)" hidefocus="true" target="_self">04</a></li>
            </ul>
            <!--数字切换 end-->
           
      </div>
   </div>
   <!--标签切换 end-->
   
   
   <!--地图 start-->
   <div class="m-six-floor">
       <h2>remittor  ALL OVER THE WORLD</h2>
      <div class="mapbox">
		    <div class="num1" style="display:block;">
               <h3>SGD¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num2">
              <h3>THB¥4500</h3>
              <span>moments ago </span>
            </div>
    		<div class="num3">
               <h3>HKW¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num4">
               <h3>MOP¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num5">
               <h3>CHF¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num6">
               <h3>HKD¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num7">
               <h3>GBP£4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num8">
               <h3>AUD$4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num9">
               <h3>EUR€4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num10">
               <h3>NZD$4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num11">
               <h3>RMB¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num12">
               <h3>JPY¥4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num13">
                <h3>USD$4500</h3>
               <span>moments ago </span>
            </div>
    		<div class="num14">
               <h3>CAD$4500</h3>
               <span>moments ago </span>
            </div>
      </div>
   </div>
   <!--地图 end-->
</section>   
   <!--页脚 start-->
     <div class="footer">
      <ul class="footer-nav clearFix">
         <li>
			<h3>Company &amp; Team</h3>
			<ul class="footer-item">
				<li><a href="">Company &amp; Team</a></li>
				<li><a href="">News &amp; Blog</a></li>
				<li><a href="">Press</a></li>
				<li><a href="">Careers</a></li>
			</ul>
		</li>
        <li>
			<h3>Help &amp; Support</h3>
			<ul class="footer-item">
				<li><a href="">Getting started</a></li>
				<li><a href="">Pricing</a></li>
				<li><a href="">Supported currencies</a></li>
				<li><a href="">Best Price Guarantee</a></li>
                <li><a href="">FAQ</a></li>
			</ul>
		</li>
        <li>
			<h3>Contact</h3>
            <p>support@transferwise.com</p>
            <p>UK: +44 (0)2036950999<br>
					US: +1888083833<br>
					DE: +4930224030208<br>
					<a href="">More ways</a></p>

		</li>
      </ul>
      </div>
  <!-- 页脚 end-->
   
</div>
<!--右侧部分 start-->

</body>
        <script src="${pageContext.request.contextPath}/resource/js/modernizr.custom.97074.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.hoverdir.js"></script>	
		<script type="text/javascript">
			$(function() {
				$(' #da-thumbs > li ').each( function() { $(this).hoverdir({
					hoverDelay : 75
				}); } );

			});
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.smoove.js"></script>
        <script type="text/javascript">$('.starblock').smoove({offset:'20%'});</script>
</html>
