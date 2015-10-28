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
   	<c:forEach var="advert" items="${aList}">
   		<a href="${pageContext.request.contextPath}/${advert.url }" class="app-link"><img src="${pageContext.request.contextPath}/resource/${advert.pic_path }" alt="" /></a>
   	</c:forEach>
    </div>
    <!--产品展示图 end-->
    
    <!--产品分类 start-->
    
           <ul class="style-list clearfix">
           	<c:forEach var="category" items="${cList}">
              <li>
                <a href="分类列表.html" class="app-link">
                 <span class="app-icon"><img src="${pageContext.request.contextPath}/resource/${category.categoryPicPath}" alt="图标" /></span>
                 <span class="tit">${category.categoryName }</span>
                 </a>
              </li>
             </c:forEach>
           </ul>

    <!--产品分类 end-->
    
    <!--热门水果 start-->
    <div class="app-tit clearfix">
        <span class="xline"></span>
        <a href="" class="app-link"><img src="${pageContext.request.contextPath}/resource/images/app-tit.png" alt="标题" /></a>
    </div>
    

         <ul class="activity-list clearfix">
          <c:forEach var="hp" items="${hList}">
          
              <li>
                <a href="详情.html" class="app-link">
                 <img src="${pageContext.request.contextPath}/resource/${hp.productPicPath}" alt="水果" />
                 </a>
              </li>
           </c:forEach>
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