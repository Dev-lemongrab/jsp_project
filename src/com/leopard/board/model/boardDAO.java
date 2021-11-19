package com.leopard.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class boardDAO {
	private static boardDAO dao;
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	private static int id_num;
	
	private boardDAO() throws ClassNotFoundException, SQLException {
		con = new boardDBConn().getConnection();
	}
	
	public static boardDAO getBoardDAO() throws ClassNotFoundException, SQLException {
		if(dao==null) {
			dao = new boardDAO();
		}
		return dao;
	}

//-----------------------커넥션풀 생성--------------------------------------------------------

	public int getBoard_id() {
		String sql = "SELECT board_id FROM leo_board ORDER BY 1 ASC";
		int bid = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bid = rs.getInt("board_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bid;
	}
	public ArrayList<boardVO> board_list(int pageNo) {//1이면 1부터 10까지 2면 11부터 20까지
		
		ArrayList<boardVO> boardList = new ArrayList<boardVO>();
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY board_id DESC) as a, board_id, board_name, board_title, board_content," + 
				"board_date, board_hit, user_id FROM leo_board) WHERE a BETWEEN "+((pageNo-1)*10+1)+" AND "+pageNo*10+"";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardVO vo = new boardVO();
				vo.setBoard_id(rs.getInt("board_id"));
				vo.setBoard_name(rs.getString("board_name"));
				vo.setBoard_title(rs.getString("board_title"));
				vo.setBoard_date(rs.getTimestamp("board_date"));
				vo.setBoard_hit(rs.getInt("board_hit"));
				vo.setUser_id(rs.getString("user_id"));
				boardList.add(vo);
			}
			rs.close();//머 메모린지 뭔지 누수방지한다고 close 해줘야한다함..
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return boardList;	  
	}
	
	public boardVO board_content(String board_id) {
		String sql = "SELECT * FROM leo_board WHERE board_id = ?";
		boardVO vo = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(board_id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new boardVO(rs.getInt("board_id"), rs.getString("board_name"),
								 rs.getString("board_title"), rs.getString("board_content").replace("<br>", "\n"), 
								 rs.getTimestamp("board_date"), rs.getInt("board_hit"), rs.getString("user_id"));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public boolean board_insert(String board_name, String board_title, String board_content, String user_id) {
		
		String sql = "INSERT INTO leo_board(board_id, board_name, board_title, board_content, user_id) VALUES(?,?,?,?,?)";
		boolean insert_ok;
		try {
			id_num = boardDAO.getBoardDAO().getBoard_id();//매번 실행할때마다 id_num이 초기화 되기 땜시 현재 마지막 순번의 id_num 넣어주
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ++id_num);
			// 이때 dao 안에 있는 static 변수로 들어감 그럼 dao가 몇개가 어디에 언제 생성되더라도 static변수는 유지
			// 삭제할때도 하나씩 내려주면 됨 
			// 인서트할때마다 static변수 up delete할때마다 static변수 - 
			pstmt.setString(2, board_name);
			pstmt.setString(3, board_title);
			pstmt.setString(4, board_content);
			pstmt.setString(5, user_id);

			pstmt.executeUpdate();
			insert_ok = true;
			
			pstmt.close();
		} catch (SQLException | ClassNotFoundException e) {
			insert_ok = false;
			e.printStackTrace();
		}
		return insert_ok;
	}
	public void board_update(int board_id, String update_title, String update_content) {
		String sql = "UPDATE leo_board SET board_title = ?, board_content = ? WHERE board_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, update_title);
			pstmt.setString(2, update_content);
			pstmt.setInt(3, board_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void board_delete(int del_board_id){
		String sql = "DELETE FROM leo_board WHERE board_id = ?";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, del_board_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<boardVO> board_search(String kind, String search) {
		String sql = "SELECT * FROM leo_board WHERE "+ kind +" LIKE ?";
		ArrayList<boardVO> boardList = new ArrayList<boardVO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
				while (rs.next()) {
					boardVO vo = new boardVO();
					vo.setBoard_id(rs.getInt("board_id"));
					vo.setBoard_name(rs.getString("board_name"));
					vo.setBoard_title(rs.getString("board_title"));
					vo.setBoard_date(rs.getTimestamp("board_date"));
					vo.setBoard_hit(rs.getInt("board_hit"));
					vo.setUser_id(rs.getString("user_id"));
					boardList.add(vo);
				}
				rs.close();//머 메모린지 뭔지 누수방지한다고 close 해줘야한다함..
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	public void hit(String board_id) {
		String sql = "UPDATE leo_board SET board_hit = board_hit + 1 WHERE board_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board_id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	public int totalCount() throws SQLException {
		String sql = "SELECT COUNT(*) FROM leo_board";
		
		pstmt= con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		return totalCount;
	}

}
	