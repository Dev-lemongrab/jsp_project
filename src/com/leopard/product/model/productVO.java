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

public class productVO {
	private int pro_id;
	private String pro_name;
	private String pro_info;
	private int pro_price;
	private String pro_img;
	private String pro_kind;
	
	
	public productVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public productVO(int pro_id, String pro_name, String pro_info, int pro_price, String pro_img, String pro_kind) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.pro_info = pro_info;
		this.pro_price = pro_price;
		this.pro_img = pro_img;
		this.pro_kind = pro_kind;
	}



	public String getPro_kind() {
		return pro_kind;
	}



	public void setPro_kind(String pro_kind) {
		this.pro_kind = pro_kind;
	}



	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_info() {
		return pro_info;
	}
	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	} 
	
	
}
