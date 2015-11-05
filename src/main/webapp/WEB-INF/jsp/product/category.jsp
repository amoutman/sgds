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
<title>分类列表</title>
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"name="viewport" /> 
<meta content="yes" name="apple-mobile-web-app-capable" /> 
<meta content="black" name="apple-mobile-web-app-status-bar-style" /> 
<meta content="telephone=no" name="format-detection" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/global.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common.js"></script>
</head>
<body>
<section class="clearfix">
     <!-- 水果分类 start -->
      <div class="titlebar">
       <div class="title">
            <h2><span class="nm">进口水果</span> <i></i></h2>
            <ul class="dropdown">
            <c:forEach var="category" items="${cList}">
            	<li><a href="${pageContext.request.contextPath}/category/toProductCategory?categoryId=${category.id}">${category.categoryName }</a></li>
            </c:forEach>
            </ul>
       </div>
      </div>
       <div class="shade"></div>
       <!-- 水果分类 end -->
       
       
       <!-- 分类列表 start -->
       <ul class="product-list clearfix">
          <c:forEach var="product" items="${pList}">
              <li>
                <a href="${pageContext.request.contextPath}/product/toProductDetails?productId=${product.id}" class="app-link clearfix"><img src="${pageContext.request.contextPath}/resource/${product.productMasterPicPath}" alt="水果" /></a>
                <div class="pro-info clearfix">
                  <div class="pro-left">
                      <span class="h2">${product.productName}</span>
                      <span class="weight">${product.unit}</span>
                      <span class="num"><i></i>已售：33413</span>
                  </div>
                  <div class="pro-right">
                     <span class="h3">果然之家旗舰店</span>
                     <span class="price"> 
                       <span class="price-num">${product.price }</span>
                       <span class="price-sign">¥</span>
                     </span>
                  </div>
                </div>
              </li>
           </c:forEach>
           </ul>
           <!-- 分类列表 end -->
	</section>
    
</body>
</html>