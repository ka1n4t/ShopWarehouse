package model;

import java.sql.*;
import java.util.ArrayList;


public class UserBeanCl {
	private Connection conn = null;
	private Statement statement = null;
	private ResultSet rs = null;
	
	public boolean addUser(String username, String password, int age, String sex) {
		boolean flag = false;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			String sql = "insert into users values('"+username+"', '"+password+"', '"+age+"', '"+sex+"')";
			
			int a = statement.executeUpdate(sql);
			if(a == 1) {
				flag = true;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		
		return flag;
	}
	
	/**更新用户信息
	 * @param username
	 * @param password
	 * @param age
	 * @param sex
	 * @return
	 */
	public boolean updateInfo(String username, String password, int age, String sex) {
		boolean flag = false;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			String sql = "update users set password='"+password+"', age='"+age+"', sex = '"+sex+"' where username='"+username+"'";
			
			int a = statement.executeUpdate(sql);
			if(a == 1) {
				flag = true;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		
		return flag;
	}
	
	/**获得当前用户信息
	 * @param username
	 * @return
	 */
	public ArrayList<UserBean> getInfo(String username) {
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			String sql = "select * from users where username = '"+username+"'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				UserBean ub = new UserBean();
				ub.setId(rs.getInt(1));
				ub.setUsername(rs.getString(2));
				ub.setPassword(rs.getString(3));
				ub.setAge(rs.getInt(4));
				ub.setSex(rs.getString(5));
				al.add(ub);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**验证用户名和密码
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean checkUser(String username, String password) {
		boolean flag = false;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			String sql = "select password from users where username = '"+username+"'";
			
			rs = statement.executeQuery(sql);
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					
					flag = true;
				}
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}

		
		
		return flag;
	}
	
	public void close() {
		
		try {
			if(rs!=null) {
				rs.close();
				rs = null;
			}
			if(statement!=null) {
				statement.close();
				statement = null;
			}
			if(conn!=null) {
				conn.close();
				conn = null;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
