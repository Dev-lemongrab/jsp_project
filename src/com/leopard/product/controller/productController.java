package com.leopard.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.leopard.board.model.boardDAO;
import com.leopard.board.model.boardVO;
import com.leopard.product.model.cartVO;
import com.leopard.product.model.productDAO;
import com.leopard.product.model.productVO;
import com.leopard.user.model.userDAO;
import com.leopard.user.model.userVO;

@WebServlet("*.product")
public class productController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public productController() {
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
		
			case "index":
				System.out.println("상품 진열 작업");
				ArrayList<productVO> productList = null;
				String kind = request.getParameter("kind");
				try {
					 productList = productDAO.getProductDAO().indexProduct(kind);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
				
				ServletContext application = getServletContext();
				application.setAttribute("productList", productList);
				
				if(kind.equals("main")) {
					response.sendRedirect("/jsp_leopard/MainPage.jsp");
					System.out.println("list완료");
				}else if(kind.equals("best")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=best");
					System.out.println("list완료");
				}else if(kind.equals("new")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=new");
					System.out.println("list완료");
				}else if(kind.equals("today")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=today");
					System.out.println("list완료");
				}else if(kind.equals("outer")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=outer");
					System.out.println("list완료");
				}else if(kind.equals("top")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=top");
					System.out.println("list완료");
				}else if(kind.equals("bottom")) {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=bottom");
					System.out.println("list완료");
				}else {
					response.sendRedirect("/jsp_leopard/product/product.jsp?kind=bag");
					System.out.println("list완료");
				}
					
				break;
			
			case "detail" :
				System.out.println("제품상세보기");
				
				String pro_img = request.getParameter("pro_img");
				productVO vo  =null;
				try {
					 vo = productDAO.getProductDAO().product_info(pro_img);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				System.out.println("여기");
				HttpSession session = request.getSession();
				session.setAttribute("product", vo);

				response.sendRedirect("/jsp_leopard/product/detail.jsp");
				
				System.out.println("저기");
				break;
			
			case "product/cart" :
				System.out.println("장바구니등록");
				
				productVO pro_vo = (productVO)request.getSession().getAttribute("product");
				userVO user_vo = (userVO)request.getSession().getAttribute("login");
				int cart_no =0;
				try {
					cart_no = productDAO.getProductDAO().cartCount();
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				String[] itemList = request.getParameter("itemList").split(",");
				
				int itemQuantity = itemList.length/5;
				
				for(int i = 0; i < 5*itemQuantity ; i += 5) {//만약 물건이2개라면 10 미만 까지 0, 5 
					try {
						productDAO.getProductDAO().insertCart(++cart_no,user_vo.getuId(), itemList[i], pro_vo.getPro_img(),
																pro_vo.getPro_info(),itemList[i+2], itemList[i+1],
																Integer.parseInt(itemList[i+3]), Integer.parseInt(itemList[i+4]));
					} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
						
						e.printStackTrace();
					}
				}
				
				RequestDispatcher rdlist = request.getRequestDispatcher("/jsp_leopard/cartList.product");
				rdlist.forward(request, response);
				
			break;
			
			case "jsp_leopard/cartList" : 
				System.out.println("장바구니보기");
				userVO user = (userVO)request.getSession().getAttribute("login");
				ArrayList<cartVO> cartList = null;
				
				try {
					cartList = productDAO.getProductDAO().cart_list(user.getuId());
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.getSession().setAttribute("cartList", cartList);
				
				response.sendRedirect("/jsp_leopard/user/cart.jsp");
				
			}
	}
}
