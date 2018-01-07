package servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserBeanCl;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;




public class RegisterClServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		
		if(password1.equals(password2)) {
			UserBeanCl ubc = new UserBeanCl();
			if(ubc.addUser(username, password1, age, sex)) {
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
		}
		
		request.getRequestDispatcher("/fail.jsp").forward(request, response);
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
}
