<html>
<body>
<%--<jsp:forward page="index/toIndexPage"/>--%>
<%--response.sendRedirect("index/toIndexPage"); --%>
<%RequestDispatcher dispatcher = request.getRequestDispatcher("index/toIndexPage"); 
  dispatcher.forward(request, response); %>
</body>
</html>