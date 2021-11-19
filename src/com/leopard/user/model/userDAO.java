package com.leopard.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//dao에서 connection 불러오는 작업
public class userDAO {
	
	private static userDAO dao;
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	private userDAO() throws ClassNotFoundException, SQLException {
		con = new userDBConn().getConnection();
	}
	
	public static userDAO getUserDAO() throws ClassNotFoundException, SQLException {
		if(dao==null) {
			dao = new userDAO();
		}
		return dao;
	}
//--------------------------커넥션풀 생성-------------------------------------
	
	
	
	//회원가입
	public boolean user_insert(String uId, String uPw, String uName, String uBirth,
							   String uGender, String uTel, String uEmail, String uAdr,
							   String uAd_sms,String uAd_email,int uPoint ) {
		
		String sql = "INSERT INTO leo_user VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		boolean success;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uId );
			pstmt.setString(2,uPw );
			pstmt.setString(3,uName );
			pstmt.setString(4,uBirth );
			pstmt.setString(5,uGender );
			pstmt.setString(6,uTel );
			pstmt.setString(7,uEmail );
			pstmt.setString(8,uAdr );
			pstmt.setString(9,uAd_sms );
			pstmt.setString(10,uAd_email );
			pstmt.setInt(11, uPoint);

			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			success = false;
			System.out.println("가입오류발생");
			e.printStackTrace();
		}
		
		return success; 
		
	}
	public boolean user_update(String uId, String uPw, String uName, String uBirth,
			String uGender, String uTel, String uEmail, String uAdr,
			String uAd_sms,String uAd_email ) {
		
		String sql = "UPDATE leo_user SET user_pw = ?, user_name =?, user_birth = ?, user_gender =?, user_tel = ?,"
				+ "user_email =?, user_adr = ?, user_ad_sms = ?, user_ad_email = ? WHERE user_id = ?";
		boolean success;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,uPw );
			pstmt.setString(2,uName );
			pstmt.setString(3,uBirth );
			pstmt.setString(4,uGender );
			pstmt.setString(5,uTel );
			pstmt.setString(6,uEmail );
			pstmt.setString(7,uAdr );
			pstmt.setString(8,uAd_sms );
			pstmt.setString(9,uAd_email );
			pstmt.setString(10, uId);
			
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			success = false;
			System.out.println("가입오류발생");
			e.printStackTrace();
		}
		
		return success; 
		
	}
	
	public boolean check_id(String id) {
		String sql = "SELECT * FROM leo_user WHERE user_id = ?";
		boolean Check = false; 
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Check = true;
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Check;
	}
	//로그인
	public boolean check_user(String id, String pw) {
		
		String sql = "SELECT user_id, user_pw FROM leo_user";
		boolean checkId = false; 
		
		try {
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("user_id").equals(id)) {
					if(rs.getString("user_pw").equals(pw))
						checkId = true;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checkId;
	}
	
	//회원정보 불러오기 
	public userVO user_info(String id) {
		String sql = "SELECT * FROM leo_user WHERE user_id = ?";
		userVO vo = new userVO();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setuId(rs.getString("user_id"));
				vo.setuPw(rs.getNString("user_pw"));
				vo.setuName(rs.getString("user_name"));
				vo.setuBirth(rs.getTimestamp("user_birth"));
				vo.setuGender(rs.getString("user_gender"));
				vo.setuTel(rs.getString("user_tel"));
				vo.setuEmail(rs.getString("user_email"));
				vo.setuAdr(rs.getString("user_adr"));
				vo.setuAd_sms(rs.getString("user_ad_sms"));
				vo.setuAd_email(rs.getString("user_ad_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
}
