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
    
       function calAmount(){
        var currName = $("#currName").html();
    	if(currName == "Currency"){
    		alert("请选择接收币种");
    	}else{
    		var trsAmount = $("#amount-send").val();
    		
    	   	var exchangeRateHighS = $("#sExchangeRateHigh").val();
			var exchangeRateS = $("#sExchangeRate").val();
			//var cRateS = (Number(exchangeRateS)-Number(exchangeRateHighS)).toFixed(4);
			
    		//var currSign = $("#sCurrSign").val();
			var changeAmountS = (Number(trsAmount)/100).toFixed(2);
			var cAmountS = (Number(changeAmountS)*Number(exchangeRateS)).toFixed(2);
			//var cAmountS1 = (Number(changeAmountS)*Number(exchangeRateHighS)).toFixed(2);
			
			
    		var exchangeRate = $("#nExchangeRate").val();
    		var exchangeRateHigh = $("#nExchangeRateHigh").val();
    		//var currSign = $("#nCurrSign").val();
			
			
			var changeAmount = (Number(cAmountS)*100).toFixed(2);
			//var chAmount = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cAmount1 = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cAmount = (Number(changeAmount)/Number(exchangeRate)).toFixed(2);
			
			var cRate = (Number(exchangeRate)/100).toFixed(4);
			var cAmountd = (Number(cAmount)-Number(cAmount1)).toFixed(2);
			var cRateAmount = (Number(cAmountd)*Number(cRate)).toFixed(2);
			//var cRateAmount = (Number(cAmount1)-Number(cAmount)).toFixed(2);
			var cRateS = (Number(exchangeRateS)/100).toFixed(4);
			var cRateAmountS = (Number(cRateAmount)/Number(cRateS)).toFixed(2);
			
			$("#amount-recived").val(cAmount);
			$("#trsAmt").html(cRateAmountS);
			$("#trsSign").html($("#sCurrSign").val());
		}
	}
	
	function calAmountf(){
        var currName = $("#currName").html();
    	if(currName == "Currency"){
    		alert("请选择接收币种");
    	}else{
    		//var sAmount = $("#amount-send").val();
    		var exchangeRateHighS = $("#sExchangeRateHigh").val();
			var exchangeRateS = $("#sExchangeRate").val();
			//var cRateS = (Number(exchangeRateS)-Number(exchangeRateHighS)).toFixed(4);
			
    		//var currSign = $("#sCurrSign").val();
			
			
    		var exchangeRate = $("#nExchangeRate").val();
    		var exchangeRateHigh = $("#nExchangeRateHigh").val();
    		//var currSign = $("#nCurrSign").val();
			var trsAmount = $("#amount-recived").val();
			

			var changeAmount = (Number(trsAmount)/100).toFixed(2);

			var cAmount1 = (Number(changeAmount)*Number(exchangeRateHigh)).toFixed(2);
			var cAmount = (Number(changeAmount)*Number(exchangeRate)).toFixed(2);
			
			var changeAmountS = (Number(cAmount)*100).toFixed(2);
			var cAmountS = (Number(changeAmountS)/Number(exchangeRateS)).toFixed(2);
			
			var cRate = (Number(exchangeRateS)/100).toFixed(4);
			var cAmountd = (Number(cAmount1)-Number(cAmount)).toFixed(2);
			var cRateAmount = (Number(cAmountd)/Number(cRate)).toFixed(2);

			$("#amount-send").val(cAmountS);
			$("#trsAmt").html(cRateAmount);
			$("#trsSign").html($("#sCurrSign").val());
		}
	}
	
	function manageCurrS(obj){
		var currencyName = $(obj).find("#currencyName").val();
		var currSign = $(obj).find("#currSign").val();
		var exchangeRate = $(obj).find("#exchangeRate").val();
		var exchangeRateHigh = $(obj).find("#exchangeRateHigh").val();
		
		$("#sExchangeRate").val(exchangeRate);
		$("#sExchangeRateHigh").val(exchangeRateHigh);
		$("#sCurrSign").val(currSign);
		$("#currNameS").html(currencyName);
		$("#sCurrNameS").val(currencyName);
		
		var sAmount = $("#amount-send").val();
		var rCurrency = $("#currName").html();
		if(rCurrency != "Currency" && rCurrency != ""){
			var exchangeRateHighS = $("#sExchangeRateHigh").val();
			var exchangeRateS = $("#sExchangeRate").val();
			//var cRateS = (Number(exchangeRateS)-Number(exchangeRateHighS)).toFixed(4);
			
    		//var currSign = $("#sCurrSign").val();
			var changeAmountS = (Number(sAmount)/100).toFixed(2);
			var cAmountS = (Number(changeAmountS)*Number(exchangeRateS)).toFixed(2);
			//var cAmountS1 = (Number(changeAmountS)*Number(exchangeRateHighS)).toFixed(2);
			
			//alert(cAmountS);
			var exchangeRateHigh = $("#nExchangeRateHigh").val();
			var exchangeRate = $("#nExchangeRate").val();
			
    		//var currSign = $("#nCurrSign").val();
			var changeAmount = (Number(cAmountS)*100).toFixed(2);
			var cAmount1 = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cAmount = (Number(changeAmount)/Number(exchangeRate)).toFixed(2);
			var cAmountd = (Number(cAmount)-Number(cAmount1)).toFixed(2);
			
			var cRate = (Number(exchangeRate)/100).toFixed(4);
			var cRateAmount = (Number(cAmountd)*Number(cRate)).toFixed(2);
			var cRateS = (Number(exchangeRateS)/100).toFixed(4);
			var cRateAmountS = (Number(cRateAmount)/Number(cRateS)).toFixed(2);
			$("#amount-recived").val(cAmount);
			$("#trsAmt").html(cRateAmountS);
			$("#trsSign").html($("#sCurrSign").val());
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
		$("#nCurrName").val(currencyName);
		
		
			var sAmount = $("#amount-send").val();
			if(sAmount!=""){
		    var exchangeRateHighS = $("#sExchangeRateHigh").val();
			var exchangeRateS = $("#sExchangeRate").val();
			var cRateS = (Number(exchangeRateS)-Number(exchangeRateHighS)).toFixed(4);
			
    		//var currSign = $("#sCurrSign").val();
			var changeAmountS = (Number(sAmount)/100).toFixed(2);
			var cAmountS = (Number(changeAmountS)*Number(exchangeRateS)).toFixed(2);
			//var cAmountS1 = (Number(changeAmountS)*Number(exchangeRateHighS)).toFixed(2);
			
			
			//var exchangeRateHigh = $("#nExchangeRateHigh").val();
			var exchangeRate = $("#nExchangeRate").val();
			
    		//var currSign = $("#nCurrSign").val();
			var changeAmount = (Number(cAmountS)*100).toFixed(2);
			var cAmount1 = (Number(changeAmount)/Number(exchangeRateHigh)).toFixed(2);
			var cAmount = (Number(changeAmount)/Number(exchangeRate)).toFixed(2);
			var cAmountd = (Number(cAmount)-Number(cAmount1)).toFixed(2);
			var cRate = (Number(exchangeRate)/100).toFixed(4);
			var cRateAmount = (Number(cAmountd)*Number(cRate)).toFixed(2);
			var cRateS = (Number(exchangeRateS)/100).toFixed(4);
			var cRateAmountS = (Number(cRateAmount)/Number(cRateS)).toFixed(2);
			//
			$("#amount-recived").val(cAmount);
			$("#trsAmt").html(cRateAmountS);
			$("#trsSign").html($("#sCurrSign").val());
			}
	}
	
	function toSendMoney(){
		var currName = $("#nCurrName").val();
		var rAmount = $("#amount-recived").val();
		var sAmount = $("#amount-send").val();
		window.location.href="${pageContext.request.contextPath }/trans/toSendMoneyS?currName="+currName+"&sAmount="+sAmount+"&rAmount="+rAmount;
	}
</script>
  </head>
  
  <body>
    <div class="container">
      <div class="indexCon">
         <div class="wrap">
           <div class="indexTop">
            <span class="logo"></span>
            <span class="loginBar"><a href="${pageContext.request.contextPath}/user/toLogin" class="linkLogin">登陆</a> <a href="${pageContext.request.contextPath}/user/toRegister" class="linkReg">注册</a></span>
          </div>
           <div class="slogan"></div>
           <div class="appendBox">
           
              <div class="m-append">
                 <span class="nm">寄出</span>
                 <input type="tel" name="sourceValue" class="amount" id="amount-send" onchange="calAmount()" maxlength="" value="1000" onblur="javascript:if($(this).val()==''){$(this).val('1000');}" onfocus="javascript:if($(this).val()=='1000'){$(this).val('');}">
                 <div class="m-calculator-con">
                    <span class="calculator-tit icon" id="currNameS">人民币</span><input type="hidden" id="sCurrNameS"/><input type="hidden" id="sCurrSign" value="￥"/><input type="hidden" id="sExchangeRate" value="100"/><input type="hidden" id="sExchangeRateHigh" value="100"/>
                    <ul style="display:none" class="calculator-dis">
                        <c:forEach var="curr" items="${currList }" varStatus="vs">
          						<li onclick="manageCurrS(this)" <c:if test="${curr.currencyCode == '1' }">class="dishover"</c:if>>
          						<input type="hidden" id="currencyName" value="${curr.currencyName }"/>
          						<input type="hidden" id="currSign" value="${curr.currencySign }"/>
          						<input type="hidden" id="exchangeRate" value="${curr.exchangeRate }"/>
          						<input type="hidden" id="exchangeRateHigh" value="${curr.exchangeRateHigh }"/>
          						<span class="money-icon"><img src="${pageContext.request.contextPath}/resource/${curr.picPath}"></span>${curr.chCurrName }
          						</li>                       
		 				</c:forEach>
                    </ul>
           		 </div>
              </div>
              <div class="m-append m-accept">
                 <span class="nm">接受</span>
                 <input type="tel" name="sourceValue" id="amount-recived" class="amount"  maxlength="" value="${recicedMoney} " onchange="calAmountf()" onblur="javascript:if($(this).val()==''){$(this).val('1000');}" onfocus="javascript:if($(this).val()=='1000'){$(this).val('');}">
                 <div class="m-calculator-con">
                    <span class="calculator-tit icon" id="currName">美元</span><input type="hidden" id="nCurrName" value="USD"><input type="hidden" id="nCurrSign"/><input type="hidden" id="nExchangeRate" value="${currUsd.exchangeRate }"/><input type="hidden" id="nExchangeRateHigh" value="${currUsd.exchangeRateHigh }"/>
                    <ul style="display:none" class="calculator-dis">
                        <c:forEach var="curr" items="${currList }" varStatus="vs">
          					<li onclick="manageCurr(this)">
          						<input type="hidden" id="currencyName" value="${curr.currencyName }"/>
          						<input type="hidden" id="currSign" value="${curr.currencySign }"/>
          						<input type="hidden" id="exchangeRate" value="${curr.exchangeRate }"/>
          						<input type="hidden" id="exchangeRateHigh" value="${curr.exchangeRateHigh }"/>
          						<span class="money-icon">
          							<img src="${pageContext.request.contextPath}/resource/${curr.picPath}">
          						</span>${curr.chCurrName }
          						</li>                       
		 				</c:forEach>
                    </ul>
           		 </div>
              </div>
              <div class="s-append"> <span class="fl">相对于银行,我们为您节省了：<span id="trsSign">￥</span><span class="priceNum" id="trsAmt">${subMoney }</span></span></div>
              <a href="javascript:void(0)" class="startBtn" onclick="toSendMoney()">确 认</a>
           </div>
         </div>
      </div>
      <div class="indexImg">
         <div class="indexItems">
          <div style="background-image: url(${pageContext.request.contextPath}/resource/images/indexBg.jpg)" class="item"></div>
         </div>
      </div>
   </div>
</body>
</html>
