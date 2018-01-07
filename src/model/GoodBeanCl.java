package model;

import java.sql.*;
import java.util.ArrayList;


//对商品表的增删改查
public class GoodBeanCl {
	private Connection conn = null;
	private Statement statement = null;
	private String sql = null;
	
	private ResultSet rs = null;
	
	public boolean buyOrSaleGood(String good_name, int quan) {
		boolean flag = false;
		int ori_quan = 0;
		int real_quan = 0;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select quantity from goods where name ='"+good_name+"'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				ori_quan = rs.getInt(1);
			}
			real_quan = ori_quan + quan;
			
			//如果出库数量大于库存数量，则返回false
			if(real_quan<0) {
				flag = false;
				return flag;
			}
			
			sql = "update goods set quantity="+real_quan+" where name='"+good_name+"'";
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
	
	/**添加商品
	 * @param name
	 * @param factory
	 * @param model
	 * @param specification
	 * @param price
	 * @param quantity
	 * @return
	 */
	public boolean addGood(String name, String factory, String model, String specification, int price, int quantity) {
		boolean flag = false;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "insert into goods values('"+name+"','"+factory+"','"+model+"','"+specification+"','"+price+"','"+quantity+"')";
			
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
	
	
	/**删除商品
	 * @param name
	 * @return
	 */
	public boolean deleteGood(String name) {
		boolean flag = false;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "delete from goods where name = '"+name+"'";
			
			int a = statement.executeUpdate(sql);
			if(a == 1) {
				flag = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return flag;
	}
	
	/**判断商品是否存在
	 * @param name
	 * @return
	 */
	public boolean isGoodExist(String name) {
		boolean flag = false;
		int result = 0;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select id from goods where name ='"+name+"'";
			
			rs = statement.executeQuery(sql);
			
			while(rs.next()) {
				result = rs.getInt(1);
				if(result != 0) {
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

	/**更新商品信息
	 * @param name
	 * @param factory
	 * @param model
	 * @param specification
	 * @param price
	 * @return
	 */
	public boolean updateGood(String name, String factory, String model, String specification, int price) {
		boolean flag = false;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "update goods set name='"+name+"', factory='"+factory+"', model='"+model+"', specification='"+specification+"', price='"+price+"' where name='"+name+"'";
			
			int a = statement.executeUpdate(sql);
			if(a == 1) {
				flag = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return flag;
	}
	
	
	/**查询商品信息
	 * @param fuzzname
	 * @return
	 */
	public ArrayList<GoodBean> searchGood(String fuzzname) {

		ArrayList<GoodBean> al = new ArrayList<GoodBean>();
		rs = null;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from goods where name like '%"+fuzzname+"%'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				GoodBean gb = new GoodBean();
				gb.setId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setFactory(rs.getString(3));
				gb.setModel(rs.getString(4));
				gb.setSpecification(rs.getString(5));
				gb.setPrice(rs.getInt(6));
				gb.setQuantity(rs.getInt(7));
				al.add(gb);
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	/**获得所有商品信息
	 * @return
	 */
	public ArrayList<GoodBean> getAllGoods() {
		ArrayList<GoodBean> al = new ArrayList<GoodBean>();
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select * from goods";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				GoodBean gb = new GoodBean();
				gb.setId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setFactory(rs.getString(3));
				gb.setModel(rs.getString(4));
				gb.setSpecification(rs.getString(5));
				gb.setPrice(rs.getInt(6));
				gb.setQuantity(rs.getInt(7));
				al.add(gb);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**通过商品id获得商品名
	 * @param id
	 * @return
	 */
	public String getGoodNameById(int id) {
		String result = null;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select name from goods where id="+id;
			
			rs = statement.executeQuery(sql);
			//哪怕只有一个结果也要用此while循环！
			while(rs.next()) {
				result = rs.getString(1);
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return result;
	}
	
	/**通过模糊商品名获得商品id(返回0到多个结果集)
	 * @param name
	 * @return ArrayList<String>
	 */
	public ArrayList<String> getGoodIdByName(String name) {
		ArrayList<String> al = new ArrayList<String>();
		String id = null;
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select id from goods where name like '%"+name+"%'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				id = rs.getString(1);
				al.add(id);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	
	/**获得商品库存
	 * @param goodname
	 * @return
	 */
	public int getQuantityByName(String goodname) {
		
		int quantity = 0;
		
		try {
			conn = new ConnDB().getConn();
			statement = conn.createStatement();
			sql = "select quantity from goods where name = '"+goodname+"'";
			
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				quantity = rs.getInt(1);
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close();
		}
		
		return quantity;
		
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
