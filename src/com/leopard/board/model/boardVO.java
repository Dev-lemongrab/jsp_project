package com.leopard.board.model;

import java.sql.Timestamp;



public class boardVO {
	private int board_id = 0;
	private String board_name;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private int board_hit;
	private String user_id;
	private boolean newMark;
	
	
	public boardVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public boardVO(int board_id, String board_name, String board_title,String board_content, Timestamp board_date, int board_hit, String user_id) {
		super();
		this.board_id = board_id;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_hit = board_hit;
		this.user_id = user_id;
		
		
	}
	
	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getBoard_content() {
		return board_content;
	}



	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}



	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}



	public boolean isNewMark() {
		return newMark;
	}



	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	
	
	
	
}
