<!--<%@page import="jdk.management.resource.internal.TotalResourceContext"%>-->
<%@page import="com.leopard.board.model.pagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.leopard.board.model.boardVO"%>
<%@page import="java.util.ArrayList"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
        
 	
 	<%
    	ArrayList<boardVO> boardList = (ArrayList)session.getAttribute("boardList");
    	pagingVO paging = (pagingVO)session.getAttribute("paging");
    	int board_num = boardList.size();
    	if(paging != null){
    		board_num = paging.getTotalCount()-(10*(paging.getPageNo()-1));
    	}
    	
    	
    %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/board.css">  
</head>
<body>
	<c:choose>
		<c:when test="${login==null }">
			<script>
				alert("로그인이 필요한 서비스입니다.");
				location.href="/jsp_leopard/user/login.jsp";
			</script>
		</c:when>
		<c:otherwise>
		<%@ include file="../include/header.jsp" %>
		<div class="container">	
		<h1>문의 게시판</h1>
			<table class="board_table">
			<tr class="table_top">
				<th class="top1">글 번호</th>
				<th class="top2">작성자</th>
				<th class="top3">제목</th>
				<th class="top4">날짜</th>
				<th class="top5">조회수</th>		
			</tr>
	        <c:forEach var="b" items="${boardList }">
				<tr class="table_content">
					<td><%=board_num-- %></td>
					<td>${b.board_name }</td>
					<td>
						<a href = "/jsp_leopard/content.board?bId=${b.board_id }&pageNo=${param.pageNo}">${b.board_title }</a>
							&nbsp;&nbsp;
							<c:if test="${b.newMark }">
								<img alt = "newMark" src = "/jsp_leopard/images/icon_new.gif">
							</c:if>
					</td>
					<td>
						<fmt:formatDate value = "${b.board_date }" pattern = "yyyy년 MM월 dd일 E요일 HH:mm"/>	
					</td>
					<td>${b.board_hit }</td>			
				</tr>
			</c:forEach>
	        <tr>
	            <td colspan="5">
	                <form action="/jsp_leopard/search.board" class="table_form" >
	                  <div class="">
	                    <select name="kind" class = "table_select">
	                        <option value = "board_title">제목</option>
	                        <option value = "board_content">내용</option>
	                        <option value = "board_name">이름</option>								
	                    </select>
	                    <input type="hidden" name ="pageNo" value ="1">
	                    <input type="text" name="search" placeholder= " 검색" class="table_search" >
	                    <input type="submit" value="검색" class="table_button table_search">
	                    <input type="button" value="글 작성" class="table_button table_search" onclick="location.href='/jsp_leopard/board/board_write.jsp'">
	                  </div>
	                </form> 
	            </td>
	        </tr>
	        <tr>
	        	<td>
	        		<a href = "/jsp_leopard/list.board?pageNo=${paging.prevPageNo }">prev</a> 
	        	</td>
	        	<td colspan="5">
	        		<c:forEach var="i"  begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
						<a href ="/jsp_leopard/list.board?pageNo=${ i}">${ i} &nbsp;</a>
	        		</c:forEach>
	        	</td>	 
	        	<td>
	        		<a href ="/jsp_leopard/list.board?pageNo=${paging.nextPageNo }"> next</a>
	        	</td>       		
	        </tr>
			</table>
		</div>
		
	    <%@ include file="../include/footer.jsp" %>     
	  </c:otherwise>
	</c:choose>
</body>
</html>