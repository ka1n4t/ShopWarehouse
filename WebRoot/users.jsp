<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人中心--库存物资管理系统</title>
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
				<li><a href="/ShopWarehouse/servlet/GoodClServlet?flag=showGoods">商品管理</a></li>
				<li class="active"><a href="#">个人中心</a></li>
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

	<%
		ArrayList<UserBean> al = (ArrayList<UserBean>) request.getAttribute("result");
		String username = null;
		String password = null;
		int age = 0;
		String sex = null;
		if (al.size() > 0) {
			UserBean ub = (UserBean) al.get(0);
			username = ub.getUsername();
			password = ub.getPassword();
			age = ub.getAge();
			sex = ub.getSex();
		}
	%>
	<form class="form-horizontal" role="form" action="UserClServlet?flag=modify" method="POST">
		<div class="form-group">
			<label for="username" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="username" name="username"
					value=<%=username%> style="width:250px;">
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password" value=<%=password %> name="password"  style="width:250px;">
			</div>
		</div>
		<div class="form-group">
			<label for="age" class="col-sm-2 control-label">年龄</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="age" name="age"
					value=<%=age%> style="width:250px;">
			</div>
		</div>
		<div class="form-group">
			<label for="sex" class="col-sm-2 control-label">性别</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="sex" name="sex"
					value=<%=sex%> style="width:250px;">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">上传修改</button>
			</div>
		</div>
	</form>

</body>
</html>