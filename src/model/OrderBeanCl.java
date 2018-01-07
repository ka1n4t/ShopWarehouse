package model;

import java.sql.*;

import java.util.ArrayList;
import model.*;

public class OrderBeanCl {
	
	private Connection conn = null;
	private Statement statement = null;
	private ResultSet rs = null;
	private String sql = null;
	
	
	/**增加订单
	 * @param good_name
	 * @param quantity
	 * @param corp_name
	 * @param operator
	 * @return
	 */
	public boolean addOrder(String good_name, int quantity, String corp_name, String operator) {
		boolean flag = false;
		GoodBeanCl gbc = new GoodBeanCl();
		String good_id = null;
		String month_time = null;
		String clock_time = null;

		try {
			if(!gbc.isGoodExist(good_name)) {
				//商品不存在，无法添加订单
				return flag;
			}
			ArrayList<String> good_id_al = gbc.getGoodIdByName(good_name);
			for(int i=0; i<good_id_al.size(); i++) {
				good_id = good_id_al.get(i);
			}
			
			//获得当前时间
			java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("HH:mm:ss");
			java.util.Date currentTime = new java.util.Date();
			month_time = formatter1.format(currentTime);
			clock_time = formatter2.format(currentTime);
			
			
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "insert into orders values('"+good_id+"','"+quantity+"','"+month_time+"','"+clock_time+"','"+corp_name+"','"+operator+"')";
			
			//插入orders表中
			int a = statement.executeUpdate(sql);
			if(a == 1) {
				//更新goods表中对应商品的数量
				if(gbc.buyOrSaleGood(good_name, quantity)) {
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
	
	/**通过模糊商品名搜索订单
	 * @param goodname
	 * @return
	 */
	public ArrayList<OrderBean> searchOrdersByGoodName(String goodname) {
		
		ArrayList<OrderBean> al = new ArrayList<OrderBean>();
		ArrayList<GoodBean> gal = null;
		String good_name = null;
		
		try {
			GoodBeanCl gbc = new GoodBeanCl();
			
			gal = gbc.searchGood(goodname);
			OrderBeanCl obc = new OrderBeanCl();
			
			for(int i=0; i<gal.size(); i++) {
				GoodBean gb = gal.get(i);
				//获得正确商品名
				good_name = gb.getName();
				//搜索
				al.addAll(obc.getOrdersByGoodName(good_name));
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
			
		return al;
	}
	
	public ArrayList<OrderBean> searchOrdersByDate(String search_date) {
		
		ArrayList<OrderBean> al = new ArrayList<OrderBean>();
		String raw_clock_time = null;
		String clock_time = null;
		String good_name = null;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from orders where month_time like '%"+search_date+"%'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				
				//将日期格式化
				raw_clock_time = rs.getString(5);
				clock_time = raw_clock_time.substring(0, 8);
				
				ob.setId(rs.getInt(1));
				ob.setGood_id(rs.getInt(2));
				ob.setQuantity(rs.getInt(3));
				ob.setMonth_time(rs.getString(4));
				ob.setClock_time(clock_time);
				ob.setCorp_name(rs.getString(6));
				ob.setOperator(rs.getString(7));
				
				//通过商品id关联到商品表，并获取商品名称
				GoodBeanCl gbl = new GoodBeanCl();
				good_name = gbl.getGoodNameById(rs.getInt(2));
				if(good_name != null) {
					ob.setGood_name(good_name);
				}
				
				al.add(ob);
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	public ArrayList<OrderBean> searchOrdersByNameAndDate(String good_name, String search_date) {
		
		ArrayList<OrderBean> al = new ArrayList<OrderBean>();
		ArrayList<String> sal = new ArrayList<String>();
		String good_id = null;
		String raw_clock_time = null;
		String clock_time = null;
		try {
			GoodBeanCl gbc = new GoodBeanCl();
			sal = gbc.getGoodIdByName(good_name);
			for(int i=0; i<sal.size(); i++) {
				good_id = sal.get(i);
			}
			
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from orders where good_id="+good_id+" and month_time like '%"+search_date+"%'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				
				//将日期格式化
				raw_clock_time = rs.getString(5);
				clock_time = raw_clock_time.substring(0, 8);
				
				ob.setId(rs.getInt(1));
				ob.setGood_id(rs.getInt(2));
				ob.setQuantity(rs.getInt(3));
				ob.setMonth_time(rs.getString(4));
				ob.setClock_time(clock_time);
				ob.setCorp_name(rs.getString(6));
				ob.setOperator(rs.getString(7));
				
				//通过商品id关联到商品表，并获取商品名称
				GoodBeanCl gbl = new GoodBeanCl();
				good_name = gbl.getGoodNameById(rs.getInt(2));
				if(good_name != null) {
					ob.setGood_name(good_name);
				}
				
				al.add(ob);
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	/**
	 * @param good_name
	 * @return
	 */
	public ArrayList<OrderBean> getOrdersByGoodName(String good_name) {
		ArrayList<String> sal = null;
		ArrayList<OrderBean> al = null;
		ArrayList<OrderBean> result_al = new ArrayList<OrderBean>();
		String good_id = null;
		try {
			GoodBeanCl gbc = new GoodBeanCl();
			sal = gbc.getGoodIdByName(good_name);
			for(int i=0; i<sal.size(); i++) {
				good_id = sal.get(i);
				al = this.getOrdersByGoodId(Integer.parseInt(good_id));
				for(int j=0; j<al.size(); j++) {
					OrderBean ob = al.get(j);
					result_al.add(ob);
				}
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return result_al;
		
	}
	
	
	/**
	 * @param id
	 * @return
	 */
	public ArrayList<OrderBean> getOrdersByGoodId(int id) {
		ArrayList<OrderBean> al = new ArrayList<OrderBean>();
		String good_name = null;
		String sql = null;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from orders where good_id="+id;
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setId(rs.getInt(1));
				ob.setGood_id(rs.getInt(2));
				ob.setQuantity(rs.getInt(3));
				ob.setMonth_time(rs.getString(4));
				ob.setClock_time(rs.getString(5));
				ob.setCorp_name(rs.getString(6));
				ob.setOperator(rs.getString(7));
				
				//通过商品id关联到商品表，并获取商品名称
				GoodBeanCl gbl = new GoodBeanCl();
				good_name = gbl.getGoodNameById(rs.getInt(2));
				if(good_name != null) {
					ob.setGood_name(good_name);
				}
				al.add(ob);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**获得所有订单
	 * @return
	 */
	public ArrayList<OrderBean> getAllOrders() {
		
		ArrayList<OrderBean> al = new ArrayList<OrderBean>();
		String good_name = null;
		String raw_clock_time = null;
		String clock_time = null;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from orders";
			
			//取出所有商品信息
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				
				//将日期格式化
				raw_clock_time = rs.getString(5);
				clock_time = raw_clock_time.substring(0, 8);
				
				ob.setId(rs.getInt(1));
				ob.setGood_id(rs.getInt(2));
				ob.setQuantity(rs.getInt(3));
				ob.setMonth_time(rs.getString(4));
				ob.setClock_time(clock_time);
				ob.setCorp_name(rs.getString(6));
				ob.setOperator(rs.getString(7));
				
				//通过商品id关联到商品表，并获取商品名称
				GoodBeanCl gbl = new GoodBeanCl();
				good_name = gbl.getGoodNameById(rs.getInt(2));
				if(good_name != null) {
					ob.setGood_name(good_name);
				}
				
				al.add(ob);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
		
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(conn != null) {
				conn.close();
				conn = null;
			}
			if(statement != null) {
				statement.close();
				statement = null;
			}	
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}


	
}
