package com.leopard.product.model;

//CREATE TABLE leo_product (
//
//	    pro_id NUMBER PRIMARY KEY,
//	    pro_name varchar2(50) NOT NULL,
//	    pro_info varchar2(500) NOT NULL,
//	    pro_price NUMBER NOT NULL,
//	    pro_img varchar2(200) NOT NULL
//
//	);

public class cartVO {
	
	private int cart_no;
	private String user_id;
	private String pro_name;
	private String pro_img;
	private String pro_info;
	private String pro_size;
	private String pro_color;
	private int quantity;
	private int pro_price;
	
	public cartVO() {
		// TODO Auto-generated constructor stub
	}
	

	public cartVO(int cart_no,String user_id, String pro_name, String pro_img, String pro_info, String pro_size, String pro_color,
			int quantity, int pro_price) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.pro_name = pro_name;
		this.pro_img = pro_img;
		this.pro_info = pro_info;
		this.pro_size = pro_size;
		this.pro_color = pro_color;
		this.quantity = quantity;
		this.pro_price = pro_price;
	}


	public int getCart_no() {
		return cart_no;
	}


	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_img() {
		return pro_img;
	}

	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}

	public String getPro_info() {
		return pro_info;
	}

	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}

	public String getPro_size() {
		return pro_size;
	}

	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}

	public String getPro_color() {
		return pro_color;
	}

	public void setPro_color(String pro_color) {
		this.pro_color = pro_color;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	
}