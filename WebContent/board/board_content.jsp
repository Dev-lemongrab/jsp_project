<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="../include/header.jsp" %>
   <link rel="stylesheet" type="text/css" href="/jsp_leopard/css/board.css">
    <title>Document</title>
</head>
<body>
<div class="container">
        <div class="content_div">
        <h2 class="main_text">제목: <label>${content.board_title }</label></h2>
        
    <table class="content_table">
        <tr>
            <td colspan="2">작성자: <label>${content.board_name }</label></td>
        </tr>
        <tr>
            <td colspan="2">조회수: <label>${content.board_hit }</label></td>
        </tr>
        <tr>
            <th class="title">내용</th>
            <td class="table_text"><textarea name="content" readonly="readonly" class="inputarea" cols="60" rows="10" >${content.board_content }</textarea></td>
        </tr>
        <tr>
            <td colspan="2">작성일자: <label>${content.board_date }</label></td>
        </tr>
       <c:choose>
        	<c:when test="${login.uId == content.user_id }">
            <tr class="writer_botton">
                <td colspan="2">
                <input type="button" value="글목록" class="table_button" onclick="history.back()">
                <input type="button" value="수정" class="table_button" onclick="location.href='/jsp_leopard/board/board_modify.jsp'">
                <input type="button" value="삭제" class="table_button" onclick = "confirm('정말 삭제하시겠습니까?'); location.href='/jsp_leopard/delete.board?bId=${content.board_id}';">
                <input type="button" value="새글쓰기" class="table_button" onclick="location.href='/jsp_leopard/board/board_write.jsp'">
            	</td>
            </tr>
            </c:when>
            <c:otherwise>
                <input type="button" value="글목록" class="table_button" onclick="location.href='/jsp_leopard/list.board?pageNo=1'">
                <input type="button" value="새글쓰기" class="table_button" onclick="location.href='/jsp_leopard/board/board_write.jsp'">            
            </c:otherwise>
        </c:choose> 
            
    </table>
    </div>
</div>
    <%@ include file="../include/footer.jsp" %>
  </body>
  
</html>