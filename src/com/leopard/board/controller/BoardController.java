package com.leopard.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.CookieStore;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.leopard.board.model.boardDAO;
import com.leopard.board.model.boardVO;
import com.leopard.board.model.pagingVO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String servicePath = request.getRequestURI().substring(request.getContextPath().length()+1,
				request.getRequestURI().lastIndexOf("."));


		System.out.println(servicePath);
		
		switch (servicePath) {
		
			case "list":
				System.out.println("list작업");
				List<boardVO> boardList = null;
				int pageNo = Integer.parseInt(request.getParameter("pageNo"));
				
				pagingVO paging = new pagingVO();
				paging.setPageNo(pageNo);
				try {
					paging.paging();
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		    	
		    	request.getSession().setAttribute("paging", paging);
		    	
				try {
					System.out.println(paging.getPageNo());
					 boardList = boardDAO.getBoardDAO().board_list(paging.getPageNo());
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				for(boardVO vo : boardList) {
					if(System.currentTimeMillis() - vo.getBoard_date().getTime() > 60*60*24*1000) {//현재시간-작성시간 24시간 보다 크면 newMark = false;작으면 true;
						vo.setNewMark(false);
					}else {
						vo.setNewMark(true);
					}
				}
				request.getSession().setAttribute("boardList", boardList);
				
				RequestDispatcher rdlist = request.getRequestDispatcher("board/board_list.jsp");
				rdlist.forward(request, response);
				System.out.println("list완료");
				break;
				
			case "write":
				System.out.println("게시물 등록");
				String board_name = request.getParameter("name");
				String board_title = request.getParameter("subject");
				String board_content = request.getParameter("content").replace("\n", "<br>");//자바로들어오는 개행을 html 개행문자로 바꿔
				String user_id = request.getParameter("user_id");
				
				boolean insert_ok = false;
				
			try {
				 insert_ok = boardDAO.getBoardDAO().board_insert(board_name, board_title, board_content, user_id);
				
				 if(insert_ok) {
					 PrintWriter out = response.getWriter();
					 String msg = "<script> \r\n"
					 		+ "alert(\"Insert your content successfully.\"); \r\n"
					 		+ "location.href = '/jsp_leopard/list.board?pageNo=1'; \r\n"	
					 		+ "</script>";
					 out.print(msg);
					 out.close();
					 
				 }
					 
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
			
			case "content" : 
				System.out.println("게시물 확인");
				
			//게시물 제목 누르면 컨트롤러로 이동 -> 쿠키확인 -> 있으면 바로 보여줌/없으면 쿠키생성하고 리퀘스트에 담아서 보냄
				String board_id = request.getParameter("bId");
				request.setAttribute("pageNo", request.getParameter("pageNo"));
				Cookie[] hitCookies = request.getCookies();//요청에 쿠키가 있는지 확인함...쿠키는 배열로받는다
				boardVO vo  = null;
				boolean flag = false;
				for(Cookie c : hitCookies ) {//쿠키를 하나씩 꺼내서 
					if(c.getValue().equals(board_id)) {//그 값이 hitCookie 인지 확인
						flag = true;//맞으면 쿠키가 살아있는거니까 그냥 컨텐츠만 보여줌
					}
					
				}
				
				if(flag == false){//아니면 쿠키생성해주고 조회수를 올려줌
					Cookie hitCookie = new Cookie("hitCookie", board_id);//name, value 차례로 넣어
					hitCookie.setMaxAge(5);
					response.addCookie(hitCookie);
					try {
						boardDAO.getBoardDAO().hit(board_id);
					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					}
				}
				try {
					vo = boardDAO.getBoardDAO().board_content(board_id);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}						
				request.getSession().setAttribute("content", vo);
				RequestDispatcher rdContent = request.getRequestDispatcher("board/board_content.jsp");
				rdContent.forward(request, response);
			break;
			
			case "modify" : 
				System.out.println("게시물 수정");
				int update_board_id = Integer.parseInt(request.getParameter("bId"));
				String update_title = request.getParameter("subject");
				String update_content = request.getParameter("content");
				
				try {
					boardDAO.getBoardDAO().board_update(update_board_id, update_title, update_content);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
				RequestDispatcher rdContent2 = request.getRequestDispatcher("content.board");
				rdContent2.forward(request, response);
			break;
			
			case "delete" :
				System.out.println("게시물 삭제");
				int del_board_id = Integer.parseInt(request.getParameter("bId"));
				try {
					boardDAO.getBoardDAO().board_delete(del_board_id);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				response.sendRedirect("/jsp_leopard/list.board?pageNo=1");
			break;
			
			case "search" : 
				System.out.println("게시물검색");
				String kind = request.getParameter("kind");
				String search = "%" + request.getParameter("search")+"%";
				ArrayList<boardVO> boardList2 = new ArrayList<boardVO>();			
	
		    	
		    	try {
		    		boardList2 = boardDAO.getBoardDAO().board_search(kind, search);
		    		
		    	} catch (ClassNotFoundException | SQLException e) {
		    		e.printStackTrace();
		    	}
				
				for(boardVO vo2 : boardList2) {
					if(System.currentTimeMillis() - vo2.getBoard_date().getTime() > 60*60*24*1000) {//현재시간-작성시간 24시간 보다 크면 newMark = false;작으면 true;
						vo2.setNewMark(false);
					}else {
						vo2.setNewMark(true);
					}
				}
				request.getSession().setAttribute("boardList", boardList2);
				
				response.sendRedirect("/jsp_leopard/board/board_list.jsp");
			break;
			default:
			break;
			}
	}
}
