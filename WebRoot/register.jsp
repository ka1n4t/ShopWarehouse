<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册</title>
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
	</div>
	</nav>
	<form class="form-horizontal" role="form" method="POST" action="servlet/RegisterClServlet">
		<div class="form-group">
			<label for="username" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="username" style="width:250px;"
					placeholder="请输入用户名" name="username">
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password1" style="width:250px;"
					placeholder="请输入密码" name = "password1">
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">再输一次密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password2" style="width:250px;"
					placeholder="再输一次密码" name = "password2">
			</div>
		</div>
		<div class="form-group">
			<label for="sex" class="col-sm-2 control-label">性别(m/w)</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="sex" style="width:250px;"
					placeholder="请输入性别" name = "sex">
			</div>
		</div>
		<div class="form-group">
			<label for="age" class="col-sm-2 control-label">年龄</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="age" style="width:250px;"
					placeholder="请输入年龄" name = "age">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">注册</button>
			</div>
		</div>
	</form>
</body>
</html>