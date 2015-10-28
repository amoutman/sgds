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
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.slides.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<style>
body{max-width: 640px;}
</style>
</head>
<body>
<section class="bgGrey mb110">
  <!--产品展示图 start-->
   <div id="slides">
      <a href="" class="app-link"><img src="images/slide1.jpg" alt="" /></a>
      <a href="" class="app-link"><img src="images/slide2.jpg" alt="" /></a>
      <a href="" class="app-link"><img src="images/slide3.jpg" alt="" /></a>
    </div>
    <!--产品展示图 end-->
    
    <!--产品分类 start-->
    
           <ul class="style-list clearfix">
              <li>
                <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon1.png" alt="图标" /></span>
                 <span class="tit">热带水果</span>
                 </a>
              </li>
              <li>
                 <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon2.png" alt="图标" /></span>
                 <span class="tit">国产水果</span>
              </a>
              </li>
              <li>
                 <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon3.png" alt="图标" /></span>
                 <span class="tit">时令水果</span>
              </a>
              </li>
              <li>
                 <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon4.png" alt="图标" /></span>
                 <span class="tit">节日特惠</span>
              </a>
              </li>
              <li>
                 <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon5.png" alt="图标" /></span>
                 <span class="tit">进口水果</span>
              </a>
              </li>
              <li>
                 <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="images/app-icon6.png" alt="图标" /></span>
                 <span class="tit">礼品专区</span>
                 </a>
              </li>
           </ul>

    <!--产品分类 end-->
    
    <!--热门水果 start-->
    <div class="app-tit clearfix">
        <span class="xline"></span>
        <a href="" class="app-link"><img src="images/app-tit.png" alt="标题" /></a>
    </div>
    

         <ul class="activity-list clearfix">
              <li>
                <a href="详情.html" class="app-link">
                 <img src="images/demo01.jpg" alt="水果" />
                 </a>
              </li>
              <li>
                <a href="详情.html" class="app-link">
                 <img src="images/demo02.jpg" alt="水果" />
                 </a>
              </li>
              <li class="threedemo">
                 <a href="详情.html" class="app-link">
                 <img src="images/demo03.jpg" alt="水果" />
                 </a>
              </li>
         </ul>
	</section>
    <!--热门水果 end-->
    
    <!--底部导航 start-->
    <nav class="app-nav">
      <a href="购物车.html" class="app-link app-link1">
        <span class="app-icon"></span>
        <span class="nm">购物车</span>
      </a>
      <a href="首页.html" class="app-link app-link2 curr">
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
<script>
$(function() {
  $('#slides').slidesjs({
    width: 640,
    height: 250,
    navigation: false,
    play: {
        active: false,
        auto: true,
        interval: 3000,
        swap: true
    }
  });	
});
</script>
</html>