package com.leopard.user.model;

import java.sql.Timestamp;

public class userVO {
	
	
	private String uId;
	private String uPw;
	private String uName;
	private Timestamp uBirth;
	private String uGender;
	private String uTel;
	private String uEmail;
	private String uAdr;
	private String uAd_sms;
	private String uAd_email;
	private int uPoint;
	
	public userVO() {
		// TODO Auto-generated constructor stub
	}

	public userVO(String uId, String uPw, String uName, Timestamp uBirth, String uGender, String uTel, String uEmail,
			String uAdr, String uAd_sms, String uAd_email, int uPoint) {
		super();
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uBirth = uBirth;
		this.uGender = uGender;
		this.uTel = uTel;
		this.uEmail = uEmail;
		this.uAdr = uAdr;
		this.uAd_sms = uAd_sms;
		this.uAd_email = uAd_email;
		this.uPoint = uPoint;
	}

	public int getuPoint() {
		return uPoint;
	}

	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public Timestamp getuBirth() {
		return uBirth;
	}

	public void setuBirth(Timestamp uBirth) {
		this.uBirth = uBirth;
	}

	public String getuGender() {
		return uGender;
	}

	public void setuGender(String uGender) {
		this.uGender = uGender;
	}

	public String getuTel() {
		return uTel;
	}

	public void setuTel(String uTel) {
		this.uTel = uTel;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuAdr() {
		return uAdr;
	}

	public void setuAdr(String uAdr) {
		this.uAdr = uAdr;
	}

	public String getuAd_sms() {
		return uAd_sms;
	}

	public void setuAd_sms(String uAd_sms) {
		this.uAd_sms = uAd_sms;
	}

	public String getuAd_email() {
		return uAd_email;
	}

	public void setuAd_email(String uAd_email) {
		this.uAd_email = uAd_email;
	}
	
	
	
	
	
}
