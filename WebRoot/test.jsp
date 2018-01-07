<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*搜索商品 		
		GoodBeanCl gbc = new GoodBeanCl();
		ArrayList<GoodBean> al = new ArrayList<GoodBean>();
		al = gbc.searchGood("机");
		//System.out.print(al);
		for(int i = 0;i < al.size();i++) {
			GoodBean gb = (GoodBean)al.get(i);
			System.out.print(gb.getId()+" ");
			System.out.print(gb.getName()+" ");
			System.out.print(gb.getFactory()+" ");
			System.out.print(gb.getModel()+" ");
			System.out.print(gb.getPrice()+" ");
			System.out.print(gb.getQuantity()+" ");
			System.out.print(gb.getSpecification()+" ");
			System.out.println();
		} */
		
		/*获得所有商品信息
		GoodBeanCl gbc = new GoodBeanCl();
		ArrayList<GoodBean> al = new ArrayList<GoodBean>();
		al = gbc.getAllGoods();
		for(int i = 0; i < al.size(); i++) {
			GoodBean gb = (GoodBean)al.get(i);
			out.print(gb.getId()+" ");
			out.print(gb.getName()+" ");
			out.print(gb.getFactory()+" ");
			out.print(gb.getModel()+" ");
			out.print(gb.getPrice()+" ");
			out.print(gb.getQuantity()+" ");
			out.print(gb.getSpecification()+" ");
			out.print("<br>");
		} */
		
		/* 获得当前用户信息
		UserBeanCl ubc = new UserBeanCl();
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		String username = (String)session.getAttribute("uname");
		al = ubc.getInfo(username);
		for(int i=0; i<al.size(); i++) {
			UserBean ub = (UserBean)al.get(i);
			out.print(ub.getId()+" ");
			out.print(ub.getUsername()+" ");
			out.print(ub.getAge()+" ");
			out.print(ub.getSex()+" ");
			out.print("<br>");
		} */
		
		/*更新用户信息 
		UserBeanCl ubc = new UserBeanCl();
		String username = "admin";
		String password = "123456";
		int age = 1;
		String sex = "w";
		boolean flag = ubc.updateInfo(username, password, age, sex);
		if(flag) {
			out.print("suc!");
		} else {
			out.print("fail!");
		} */	
		
		/*获得所有订单
		OrderBeanCl obc = new OrderBeanCl();
		ArrayList<OrderBean> al = obc.getAllOrders();
		for(int i=0; i<al.size(); i++) {
			OrderBean ob = (OrderBean)al.get(i);
			out.print(ob.getId());
			out.print(ob.getGood_name()+" ");
			out.print(ob.getQuantity()+" ");
			out.print(ob.getMonth_time()+" ");
			out.print(ob.getClock_time()+" ");
			out.print(ob.getCorp_name()+" ");
			out.print(ob.getOperator()+" ");
			out.print("<br>");
		}*/
		
		/* 通过模糊商品名搜索订单
		OrderBeanCl obc = new OrderBeanCl();
		String good_name = "笔";
		ArrayList<OrderBean> al = obc.searchOrdersByGoodName(good_name);
		for(int i=0; i<al.size(); i++) {
			OrderBean ob = (OrderBean)al.get(i);
			out.print(ob.getId());
			out.print(ob.getGood_name()+" ");
			out.print(ob.getQuantity()+" ");
			out.print(ob.getMonth_time()+" ");
			out.print(ob.getClock_time()+" ");
			out.print(ob.getCorp_name()+" ");
			out.print(ob.getOperator()+" ");
			out.print("<br>");
		} */
		
		/*增加入库订单*/
		/* boolean flag = false;
		OrderBeanCl obc = new OrderBeanCl();
		String good_name = "笔记本";
		int quantity = 15;
		String corp_name = "test_corp";
		String operator = "test_web";
		flag = obc.addOrder(good_name, quantity, corp_name, operator);
		out.print(flag); */
		
		/*增加出库订单*/
		/* boolean flag = false;
		OrderBeanCl obc = new OrderBeanCl();
		String good_name = "笔记本";
		int quantity = -35;
		String corp_name = "test_corp";
		String operator = "test_web";
		flag = obc.addOrder(good_name, quantity, corp_name, operator);
		out.print(flag); */
		
		//获取当前时间
		/* SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();
		String  now = formatter.format(currentTime);
		out.print(now); */
	%>
</body>
</html>