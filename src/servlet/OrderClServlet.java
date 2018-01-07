package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import java.util.ArrayList;

//对订单信息的增删改查进行控制
public class OrderClServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("showOrders")) {
			OrderBeanCl obl = new OrderBeanCl();
			ArrayList<OrderBean> al = obl.getAllOrders();

			request.setAttribute("result", al);
			request.getRequestDispatcher("/orders.jsp").forward(request, response);
			
		} else if(flag.equals("addOrder")) {
			
			boolean isSuc = false;
			String good_name = request.getParameter("good_name");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String corp_name = request.getParameter("corp_name");
			String operator = request.getParameter("operator");

			OrderBeanCl obc = new OrderBeanCl();
			
			isSuc = obc.addOrder(good_name, quantity, corp_name, operator);
			
			if(isSuc) {
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/fail.jsp").forward(request, response);
			}
		} else if(flag.equals("searchOrder")) {
			
			ArrayList<OrderBean> al = null;
			String good_name = request.getParameter("searchName");
			String search_date = request.getParameter("searchDate");
			OrderBeanCl obc = new OrderBeanCl();
			if(!good_name.equals("") && search_date.equals("")) {
				al = obc.searchOrdersByGoodName(good_name);
			} else if(good_name.equals("") && !search_date.equals("")) {
				al = obc.searchOrdersByDate(search_date);
			} else if(!good_name.equals("") && !search_date.equals("")) {
				al = obc.searchOrdersByNameAndDate(good_name, search_date);
			}
			
			request.setAttribute("result", al);
			request.setAttribute("isSearch", true);
			request.getRequestDispatcher("/orders.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
