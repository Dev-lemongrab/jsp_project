package com.leopard.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class productDBConn {
	private Connection con;

	   public productDBConn() throws ClassNotFoundException, SQLException {
	      Class.forName("oracle.jdbc.driver.OracleDriver");   
	      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "leopard", "leopard");
	   }

	   public Connection getConnection() {
	      return con;
	   }
}
