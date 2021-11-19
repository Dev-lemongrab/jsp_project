package com.leopard.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.leopard.user.model.userDAO;
import com.leopard.user.model.userDBConn;

public class productDAO {
	private static productDAO dao;
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	private productDAO() throws ClassNotFoundException, SQLException {
		con = new productDBConn().getConnection();
	}
	
	public static productDAO getProductDAO() throws ClassNotFoundException, SQLException {
		if(dao==null) {
			dao = new productDAO();
		}
		return dao;
	}
//--------------------------커넥션풀 생성-------------------------------------
	
	
	public ArrayList<productVO> indexProduct(String kind) {
		String sql = "SELECT * FROM leo_product WHERE pro_kind = ?";
		
		ArrayList<productVO> productList = new ArrayList<productVO>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO(rs.getInt("pro_id"), rs.getString("pro_name"),
											 rs.getString("pro_info"), rs.getInt("pro_price"),
											 rs.getString("pro_img"), rs.getString("pro_kind"));
			productList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public productVO product_info(String pro_img) {
		String sql = "SELECT * FROM leo_product WHERE pro_img = ?";
		productVO vo = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pro_img);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new productVO(rs.getInt("pro_id"), rs.getString("pro_name"), 
						rs.getString("pro_info"), rs.getInt("pro_price"),rs.getString("pro_img"), rs.getString("pro_kind"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	public void insertCart(int cart_no, String user_id, String pro_name, String pro_img, String pro_info, 
						   String pro_size, String pro_color, int quantity, int pro_price) {
		
		String sql = "INSERT INTO cart VALUES(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			pstmt.setString(2, user_id);
			pstmt.setString(3, pro_name);
			pstmt.setString(4, pro_img);
			pstmt.setString(5, pro_info);
			pstmt.setString(6, pro_size);
			pstmt.setString(7, pro_color);
			pstmt.setInt(8, quantity);
			pstmt.setInt(9, pro_price);
			
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<cartVO> cart_list(String user_id) {
		
		String sql = "SELECT * FROM cart WHERE user_id = ?";
		
		ArrayList<cartVO> cartList = new ArrayList<cartVO>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartVO vo = new cartVO(rs.getInt("cart_no"), rs.getString("user_id"), rs.getString("pro_name"),
											 rs.getString("pro_img"), rs.getString("pro_info"),
											 rs.getString("pro_size"), rs.getString("pro_color"),
											 rs.getInt("quantity"), rs.getInt("pro_price"));
			cartList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartList;
	}
	public int cartCount() {
		
		String sql = "SELECT COUNT(*) FROM cart";
		int cartCount=0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartCount;
	
		
		
	}

	
}
