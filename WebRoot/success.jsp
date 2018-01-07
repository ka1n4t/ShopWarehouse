<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>操作成功！</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse " role="navigation">
		<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/ShopWarehouse/index.jsp">库存物资管理系统</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="OrderClServlet?flag=showOrders">订单管理</a></li>
				<li><a href="GoodClServlet?flag=showGoods">商品管理</a></li>
				<li><a href="UserClServlet?flag=getInfo">个人中心</a></li>
			</ul>
		</div>
		</div>
	</nav>

	<h3>操作成功！</h3>
	<a href="/ShopWarehouse/index.jsp">回到主页</a>
	
</body>
</html>