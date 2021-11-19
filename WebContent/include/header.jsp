<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/reset.css">
		<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/header.css">

</head>
<body>
      
    <header id="header">
        <div class="top_nav_box">
            <h1 class="logo"><a href="/jsp_leopard/index.jsp"><img src="/jsp_leopard/images/logo2.png" alt=""></a></h1>
            <ul class="top_nav">
                <li class="login">
                	<a href="/jsp_leopard/user/join.jsp">JOIN</a>
               		<span class="point_event">
						<p class="point_text">2,000P</p>
					</span>
				</li>
      			<c:choose>
					<c:when test="${login==null }">
                		<li><a href="/jsp_leopard/user/login.jsp">LOGIN</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="/jsp_leopard/user/logout.jsp?logout=Logout">LOGOUT</a></li>
                		<li><a href="/jsp_leopard/user/mypage.jsp">MYPAGE</a></li>
		                <li><a href="/jsp_leopard/jsp_leopard/cartList.product">CART</a></li>
                	</c:otherwise>
                </c:choose>
            </ul>
			
            
        </div>
        <h1 class="tit"><a href="/jsp_leopard/index.jsp"><img src="/jsp_leopard/images/main_logo.png"></a></h1>
        <div class="gnb_box">
            <nav class="gnb">
            <ul class="left_gnb">
                <li><a href="/jsp_leopard/index.product?kind=new">신상품</a></li>
                <li><a href="/jsp_leopard/index.product?kind=today">당일배송</a></li>
                <li><a href="/jsp_leopard/index.product?kind=best">베스트</a></li>
                <li><a href="/jsp_leopard/index.product?kind=outer">아우터</a></li>
                <li><a href="/jsp_leopard/index.product?kind=top">상의</a></li>
                <li><a href="/jsp_leopard/index.product?kind=bottom">하의</a></li>
                <li><a href="/jsp_leopard/index.product?kind=bag">가방</a></li>
            </ul>
            <ul class="right_gnb">
                <li><a href="/jsp_leopard/list.board?pageNo=1">게시판</a></li>
                <li><a href="/jsp_leopard/board/faq.jsp">FAQ</a></li>
                <li><a href="/jsp_leopard/board/sevicenter.jsp">고객센터</a></li>
            </ul>
        </nav>
        </div>
        
    </header>
</body>
</html>