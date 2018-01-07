<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>库存物资管理系统</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse " role="navigation">
		<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">库存物资管理系统</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="servlet/OrderClServlet?flag=showOrders">订单管理</a></li>
				<li><a href="servlet/GoodClServlet?flag=showGoods">商品管理</a></li>
				<li><a href="servlet/UserClServlet?flag=getInfo">个人中心</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<%
				if(session.getAttribute("isLogin") != null){
					out.print("<li><a href='logout.jsp'>登出</a></li>");
				}
			%>
			</ul>
		</div>
		</div>
	</nav>
	<%
		if(session.getAttribute("isLogin") == null) {
			response.sendRedirect("login.jsp");
			//pageContext.include("login.jsp");
		} else {
			%>
			<h1>Welcome!</h1>
			<br>
			<br>
			<br>
			<h3>系统架构</h3>
			<hr>
			<p class="lead">
				前端:BootStrap
				<br>
				后端:MVC
			</p>
			<%
		}

	%>

	
</body>
</html>