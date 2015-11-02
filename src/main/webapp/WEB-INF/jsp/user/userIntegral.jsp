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
<title>我的积分</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<style>
body{background-color:#fff;}
</style>
</head>
<body>
 <!-- 我的积分 start -->
<section class="mb110">
        <div class="integral-img">
           <p>我的积分：</p>
           <span class="integral-num">${integral }</span>
       </div>
       <div class="integral-t"><h2>积分使用记录</h2></div>
       <div class="integral-list clearfix">
        <!--积分增加 start-->
          <ul class="add-integral">
          	<c:forEach var="ui" items="${uiList }">
          	<c:if test="${ui.direction == 1 }">
          	<li>
               <div class="integral-com clearfix">
                 <span class="img"><img src="${pageContext.request.contextPath}/resource/images/face.png"></span>
                 <span class="xline"></span>
                 <span class="dot"></span>
               </div>
              <div class="integral-info">
               <span class="integral-f1">+${ui.integral }积分</span>
               <span class="integral-f2">${ui.descInfo }</span>
               <span class="integral-f3">${ui.createdDate }</span>
               </div>
            </li>
            </c:if>
          	</c:forEach>   	
          </ul>
          <!--积分增加 end-->
          
          <!--积分减少 start-->
          <ul class="minu-integral">
          <c:forEach var="ui" items="${uiList }">
          	<c:if test="${ui.direction == -1 }">
          	<li>
               <div class="integral-com clearfix">
                 <span class="img"><img src="${pageContext.request.contextPath}/resource/images/face.png"></span>
                 <span class="xline"></span>
                 <span class="dot"></span>
               </div>
              <div class="integral-info">
               <span class="integral-f1">－${ui.integral }积分</span>
               <span class="integral-f2">${ui.descInfo }</span>
               <span class="integral-f3">${ui.createdDate }</span>
               </div>
            </li>
            </c:if>
          </c:forEach>  
          </ul>
          <!--积分减少 end-->
       </div>
    </section>
    <!-- 我的积分 end -->
</body>
</html>