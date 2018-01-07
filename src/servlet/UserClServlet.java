package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

public class UserClServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("getInfo")) {
			UserBeanCl ubc = new UserBeanCl();
			ArrayList<UserBean> al = null;
			String username = (String)request.getSession().getAttribute("uname");
			try {
				al = ubc.getInfo(username);
				/*for(int i=0; i<al.size(); i++){
					UserBean ub = (UserBean)al.get(i);
					al.add(ub);
				}*/
				request.setAttribute("result", al);
				request.getRequestDispatcher("/users.jsp").forward(request, response);

			} catch(Exception ex) {
				
				ex.printStackTrace();
			}
			
		} else if(flag.equals("modify")) {
			UserBeanCl ubc = new UserBeanCl();
			boolean tag = false;
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int age = Integer.parseInt(request.getParameter("age"));
			String sex= request.getParameter("sex");
			
			tag = ubc.updateInfo(username, password, age, sex);
			if(tag) {
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/fail.jsp").forward(request, response);
			}
		}

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
		
	}
	
	
}
