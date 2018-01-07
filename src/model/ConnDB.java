package model;

import java.sql.*;

/**
 * @author 57470
 *
 */
public class ConnDB {
	
	private String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=ShopWarehouse";
	private String username = "shopadmin";
	private String password = "123456";
	
	public Connection getConn() {
		Connection dbConn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			dbConn = DriverManager.getConnection(dbURL, username, password);
			System.out.println("Database connection success!");
			
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Database connection faliure!");
		}
		
		return dbConn;
	}
}
