package com.leopard.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.leopard.user.model.userDAO;


@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       

    public UserController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		String servicePath = request.getRequestURI().substring(request.getContextPath().length()+1,
																request.getRequestURI().lastIndexOf("."));
		
		
		System.out.println(servicePath);//경로를 간단하게 따줌

		
		switch (servicePath) {//들어가는 경로
		
		case "user/insert":
			System.out.println("회원 insert!");
			boolean insert = false;
			String uId = request.getParameter("id"); String uAd_sms = request.getParameter("snsagree"); String uAd_email = request.getParameter("emailagree");
			String uPw = request.getParameter("passwd"); String uName = request.getParameter("name"); String uBirth = request.getParameter("birth");
			String uGender = request.getParameter("Gender"); String uTel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"); String uEmail = request.getParameter("email_1")+"@"+request.getParameter("email_2");
			String uAdr = request.getParameter("adr"); int uPoint = Integer.parseInt(request.getParameter("point")); 
			String Inserturl = "";
			try {
				boolean check = userDAO.getUserDAO().check_id(uId);
				if(check) {
					PrintWriter out = response.getWriter();//자바스크립트 내용 출력해줄 수 있는 객체 생성
					
					String htmlCode = "<script> \r\n"//자바스크립트 내용 \ㅜ줄띄우기 
							+ "alert(\"Duplicated ID\"); \r\n"
							+ "history.back(); \r\n"
							+ "</script>";
					out.print(htmlCode);
					out.flush();
				}else {
					insert = userDAO.getUserDAO().user_insert(uId, uPw, uName, uBirth, uGender, uTel, uEmail, uAdr, uAd_sms, uAd_email, uPoint);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			if(insert) {
				System.out.println("회원가입완료");
				Inserturl = "join_ok.jsp";
				request.setAttribute("name", uName);//리퀘스트에 이름정보만 넣어준다.
				RequestDispatcher rd = request.getRequestDispatcher(Inserturl);
				rd.forward(request, response);
			}
			else {
				System.out.println("회원가입실패");//콘솔창에 회원가입실패라고 넣어줌
				Inserturl = "join.jsp";
			}
			
			
			break;
			
		case "user/modify":
			System.out.println("회원 modify!");
			boolean modify = false;
			String uIdM = request.getParameter("id"); String uAd_smsM = request.getParameter("snsagree"); String uAd_emailM = request.getParameter("emailagree");
			String uPwM = request.getParameter("passwdM"); String uNameM = request.getParameter("name"); String uBirthM = request.getParameter("birth");
			String uGenderM = request.getParameter("Gender"); String uTelM = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"); String uEmailM = request.getParameter("email_1")+"@"+request.getParameter("email_2");
			String uAdrM = request.getParameter("adr");  
			String modifyurl = "";
			
			try {
				modify = userDAO.getUserDAO().user_update(uIdM, uPwM, uNameM, uBirthM, uGenderM, uTelM, uEmailM, uAdrM, uAd_smsM, uAd_emailM);
				
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
			
			if(modify) {
				System.out.println("회원정보수정");
				modifyurl = "mypage.jsp";
				try {
					request.getSession().setAttribute("login", userDAO.getUserDAO().user_info(uIdM));
				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
				RequestDispatcher rd = request.getRequestDispatcher(modifyurl);
				rd.forward(request, response);
			}
			else {
				System.out.println("회원정보수정실패");//콘솔창에 회원가입실패라고 넣어줌
				modifyurl = "mypage.jsp";
			}
			
			
			break;
			
		case "user/login" :
			System.out.println("회원 login!");
			
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			boolean user_check = false;
			String Loginurl = "";
			try {
				user_check = userDAO.getUserDAO().check_user(id, pw);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			if (user_check) {
				System.out.println("로그인 성공");
				Loginurl = "../index.jsp";
				HttpSession session = request.getSession();
				try {
					session.setAttribute("login", userDAO.getUserDAO().user_info(id));//vo
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}else {
				System.out.println("로그인 실패");//콘솔창에 로그인 실패라고 넣어줌
				PrintWriter out = response.getWriter();//자바스크립트 내용 출력해줄 수 있는 객체 생성
				
				String htmlCode = "<script> \r\n"//자바스크립트 내용 \ㅜ줄띄우기 
						+ "alert(\"Check your Id or Password.\"); \r\n"
						+ "history.back(); \r\n"
						+ "</script>";
				out.print(htmlCode);
				out.flush();
				Loginurl = "login.jsp";
				return;
			}
			RequestDispatcher rqd = request.getRequestDispatcher(Loginurl);
			rqd.forward(request, response);
			break;

		default:
			break;
		}
		
	}

}
