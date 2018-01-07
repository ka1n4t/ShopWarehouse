<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.GoodBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品管理--库存物资管理系统</title>
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
				<li><a href="/ShopWarehouse/servlet/OrderClServlet?flag=showOrders">订单管理</a></li>
				<li class="active"><a href="#">商品管理</a></li>
				<li><a href="/ShopWarehouse/servlet/UserClServlet?flag=getInfo">个人中心</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<%
				if(session.getAttribute("isLogin") == null){
					response.sendRedirect("/ShopWarehouse/login.jsp");
				}else {
					out.print("<li><a href='/ShopWarehouse/logout.jsp'>登出</a></li>");
				}
			%>
			</ul>
		</div>
		</div>
	</nav>
	
	<form class="form-inline col-lg-5 pull-right" role="form" method="GET" action="GoodClServlet">
		<div class="form-group">
			<input type="text" class="hidden" value="searchGood" name="flag">
			<label class="sr-only" for="searchName">名称</label>
			<input type="text" class="form-control" id="searchName" name="searchName" placeholder="请输入商品的名称">
		</div>
		<button type="submit" class="bun btn-default">搜索</button>
	</form>
	
	
	<table class="table table-bordered">
		<caption>所有商品</caption>
		<thead>
			<tr>
				<th>名称</th>
				<th>型号</th>
				<th>价格</th>
				<th>规格</th>
				<th>工厂</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
	<%
		ArrayList<GoodBean> al = (ArrayList<GoodBean>)request.getAttribute("result");
		Object isSearch = request.getAttribute("isSearch");
		
			//显示所有商品
			for(int i=0; i<al.size(); i++) {
				GoodBean gb = (GoodBean)al.get(i);
				out.print("<tr>");
				out.print("<td>"+gb.getName()+"</td>");
				out.print("<td>"+gb.getModel()+"</td>");
				out.print("<td>"+gb.getPrice()+"</td>");
				out.print("<td>"+gb.getSpecification()+"</td>");
				out.print("<td>"+gb.getFactory()+"</td>");
				out.print("<td>"+gb.getQuantity()+"</td>");
				out.print("<td><a href='GoodClServlet?flag=deleteGood&deletename="+java.net.URLEncoder.encode(gb.getName())+"'>删除</a></td>");
				out.print("</tr>");
			}
	
			if(isSearch == null) {
	%>
	<form class="form-inline col-lg-5 pull-right" role="form" method="GET" action="GoodClServlet">
			<input type="text" class="hidden" value="addGood" name="flag">
		<tr>
			<td>
				<input type="text" class="form-control" name="newname" placeholder="名称">
			</td>
			<td>
				<input type="text" class="form-control" name="newmodel" placeholder="型号">
			</td>
			<td>
				<input type="text" class="form-control" name="newprice" placeholder="价格">
			</td>
			<td>
				<input type="text" class="form-control" name="newspecification" placeholder="规格">
			</td>
			<td>
				<input type="text" class="form-control" name="newfactory" placeholder="工厂">
			</td>
			<td>
				不可设置
			</td>
			<td>
				<button type="submit" class="bun btn-default">添加</button>
			</td>
		</tr>
	</form>
		<%
			}
		%>
		</tbody>
	</table>
	
	
</body>
</html>