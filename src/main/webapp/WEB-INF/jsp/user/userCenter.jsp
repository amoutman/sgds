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
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<style>
body{max-width: 640px;}
</style>
</head>
<body>
<!-- 个人中心 start -->
<section class="mb110 bgGrey">
        <div class="head-img">
           <span class="my-img"><img src="${pageContext.request.contextPath}/resource/images/face.png"></span>
           <p>${user.userName }</p>
       </div>
        <ul class="usernav clearfix">
          <li class="dzf">
             <a href="待支付.html">
               <span class="navdemo">待支付</span>
               <span class="num">3</span>
             </a>
           </li>
          <li class="dsh">
             <a href="待收货.html">
               <span class="navdemo">待收货</span>
               <span class="num">20</span>
             </a>
           </li>
          <li class="ywc">
             <a href="已完成.html">
               <span class="navdemo">已完成</span>
               <span class="num">34</span>
             </a>
           </li>
          <li class="dpj">
             <a href="待评价.html">
               <span class="navdemo">待评价</span>
               <span class="num">8</span>
             </a>
           </li>
        </ul>
        
        <ul class="userlist">
           <li class="clearfix">
              <div class="m-con">
                  <div class="m-app-icon">
                  <span class="app-icon app-icon6"></span>
                  </div>
                  <div class="m-wid"><a href="${pageContext.request.contextPath}/receiver/toReceiver">收货人地址管理</a></div>
              </div>
           </li>
           <li class="clearfix">
              <div class="m-con">
                  <div class="m-app-icon">
                  <span class="app-icon app-icon7"></span>
                  </div>
                  <div class="m-wid"><a href="${pageContext.request.contextPath}/userCenter/toUserCoupon"><span class="djq">${couponCount }</span> 我的代金券</a></div>
              </div>
           </li>
           <li class="clearfix">
              <div class="m-con">
                  <div class="m-app-icon">
                  <span class="app-icon app-icon8"></span>
                  </div>
                  <div class="m-wid"><a href="${pageContext.request.contextPath}/userCenter/toUserIntegral"><span class="jf">${integral }分</span> 我的积分 </a></div>
              </div>
           </li>
        </ul>
    </section>
    <!-- 个人中心 end -->

    <!--底部导航 start-->
    <nav class="app-nav">
      <a href="${pageContext.request.contextPath}/cart/toCart" class="app-link app-link1">
        <span class="app-icon"></span>
        <span class="nm">购物车</span>
      </a>
      <a href="${pageContext.request.contextPath}/index/toIndexPage" class="app-link app-link2">
        <span class="app-icon"></span>
        <span class="nm">首页</span>
      </a>
      <a href="javascript:void(0);" class="app-link app-link3 curr">
        <span class="app-icon"></span>
        <span class="nm">我的</span>
      </a>
    </nav>
    <!--底部导航 end-->
</body>
</html>