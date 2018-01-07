package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GoodBean;
import model.GoodBeanCl;

public class GoodClServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		String flag = null;
		flag  = request.getParameter("flag");
		
		if(flag.equals("showGoods")) {
			//显示所有商品
			ArrayList<GoodBean> al = null;
			GoodBeanCl gbl = new GoodBeanCl();
			try {
				al = gbl.getAllGoods();
				request.setAttribute("result", al);
				
				request.getRequestDispatcher("/goods.jsp?search=0").forward(request, response);
			} catch(Exception ex) {
				ex.printStackTrace();
			}
			
		} else if(flag.equals("searchGood")) {
			//搜索商品
			ArrayList<GoodBean> al = null;
			GoodBeanCl gbc = new GoodBeanCl();
			
			try {
				String fuzzName = request.getParameter("searchName");
				
				al = gbc.searchGood(fuzzName);
				
				request.setAttribute("result", al);
				request.setAttribute("isSearch", true);
				request.getRequestDispatcher("/goods.jsp?search=1").forward(request, response);
				
			} catch(Exception ex) {
				ex.printStackTrace();
				
			}

		} else if(flag.equals("addGood")) {
			//添加商品
			ArrayList<GoodBean> al = null;
			GoodBeanCl gbc = new GoodBeanCl();
			String name = request.getParameter("newname");
			String factory = request.getParameter("newfactory");
			String model = request.getParameter("newmodel");
			String specification = request.getParameter("newspecification");
			int price = Integer.parseInt(request.getParameter("newprice"));
			/*int quantity = Integer.parseInt(request.getParameter("newquantity"));*/
			int quantity = 0;
			boolean isSuc = false;
			
			try {
				isSuc = gbc.addGood(name, factory, model, specification, price, quantity);
				if(isSuc) {
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/fail.jsp").forward(request, response);
				}
				
			} catch(Exception ex) {
				ex.printStackTrace();
				
			}
			
		} else if(flag.equals("deleteGood")) {
			//删除商品
			ArrayList<GoodBean> al = null;
			GoodBeanCl gbc = new GoodBeanCl();
			
			boolean isSuc = false;
			
			try {
				String name = request.getParameter("deletename");
				isSuc = gbc.deleteGood(name);
				if(isSuc) {
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/fail.jsp").forward(request, response);
				}
				
			} catch(Exception ex) {
				ex.printStackTrace();
				
			}
			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		doGet(request, response);
	}
	
}
