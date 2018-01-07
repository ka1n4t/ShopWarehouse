<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.*" %>
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
				<li class="active"><a href="#">订单管理</a></li>
				<li><a href="/ShopWarehouse/servlet/GoodClServlet?flag=showGoods">商品管理</a></li>
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
	
	<form class="form-inline col-lg-5 pull-right" role="form" method="GET" action="OrderClServlet">
		<div class="form-group">
			<input type="text" class="hidden" value="searchOrder" name="flag">
			<label class="sr-only" for="searchName">名称</label>商品名称
			<input type="text" class="form-control" id="searchName" name="searchName" placeholder="请输入订单中商品的名称">
			<label class="sr-only" for="searchDate">日期</label>日期
			<input style="width:130px" type="text" class="form-control" id="searchDate" name="searchDate" placeholder="如：2018-01-01">
		</div>
		<br>
		<button type="submit" class="bun btn-default pull-right ">搜索</button>
	</form>
	
	
	<table class="table table-bordered">
		<caption>所有订单</caption>
		<thead>
			<tr>
				<th>商品名称</th>
				<th>数量</th>
				<th>日期</th>
				<th>时间</th>
				<th>入库(出库)单位</th>
				<th>送货(提货)人姓名</th>
				<th>库存</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			ArrayList<OrderBean> al = (ArrayList<OrderBean>)request.getAttribute("result");
			Object isSearch = request.getAttribute("isSearch");
			String good_id = null;
			String good_name = null;
			GoodBeanCl gbc = new GoodBeanCl();
			int quantity = 0;
			
			for(int i=0; i<al.size(); i++) {
				OrderBean ob = (OrderBean)al.get(i);
				quantity = gbc.getQuantityByName(ob.getGood_name());
				out.print("<tr>");
				out.print("<td>"+ob.getGood_name()+"</td>");
				out.print("<td>"+ob.getQuantity()+"</td>");
				out.print("<td>"+ob.getMonth_time()+"</td>");
				out.print("<td>"+ob.getClock_time()+"</td>");
				out.print("<td>"+ob.getCorp_name()+"</td>");
				out.print("<td>"+ob.getOperator()+"</td>");
				out.print("<td>"+quantity+"</td>");
				out.print("<td>无</td>");
				/* out.print("<td><a href='GoodClServlet?flag=deleteGood&deletename="+java.net.URLEncoder.encode(gb.getName())+"'>删除</a></td>"); */
				out.print("</tr>");
			}
		
			if(isSearch == null) {
				//显示添加表单
		%>
	<form class="form-inline col-lg-5 pull-right" role="form" method="GET" action="OrderClServlet">
			<input type="text" class="hidden" value="addOrder" name="flag">
		<tr>
			<td>
				<input type="text" class="form-control" name="good_name" placeholder="商品名称(请确保已存在)">
			</td>
			<td>
				<input style="width:210px" type="text" class="form-control" name="quantity" placeholder="数量(出库值为负且小于库存)">
			</td>
			<td>
				不可设置
			</td>
			<td>
				不可设置
			</td>
			<td>
				<input style="width:150px" type="text" class="form-control" name="corp_name" placeholder="入库(出库)单位">
			</td>
			<td>
				<input style="width:150px" type="text" class="form-control" name="operator" placeholder="送货(提货)人姓名">
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