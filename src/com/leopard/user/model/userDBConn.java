package com.leopard.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class userDBConn {
	
	
	private Connection con;

	   public userDBConn() throws ClassNotFoundException, SQLException {
	      Class.forName("oracle.jdbc.driver.OracleDriver");   
	      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "leopard", "leopard");
	   }

	   public Connection getConnection() {
	      return con;
	   }
}
