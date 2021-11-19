<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="../include/header.jsp" %>
   <link rel="stylesheet" type="text/css" href="../css/board.css">

<script type="text/javascript">
		function formCheck(){
			if(f.subject.value==""){
				alert("제목을 입력하세요");
				f.subject.focus();
				return false;
			}
			if(f.content.value==""){
				alert("글 내용을 입력하세요");
				f.content.focus();
				return false;
			}
			return true;
		}
</script>
    <title>Document</title>
</head>
<body>
    <div class=" container">
        <h1>게시글 수정</h1>
        <form name="f" action="/jsp_leopard/modify.board?bId=${content.board_id}" method="post">
        <table class="board_write">
            <tr>
                <th class="title">이름</th>
                <td class="table_text"><input type="text"  readonly="readonly" value = "${content.board_name }" class="inputtext" size="15"></td>
            </tr>
            <tr>
                <th class="title">제목</th>
                <td class="table_text"><input type="text" name="subject" value = "${content.board_title }" class="inputtext" placeholder="글제목" size="35"></td>
            </tr>
            <tr>
                <th class="title">내용</th>
                <td class="table_text"><textarea name="content" class="inputarea" cols="60" rows="10" placeholder="게시글 내용을 입력하세요." >${content.board_content }</textarea></td>
            </tr>
            <tr class="writer_botton">
                <td colspan="2">
                <input type="submit" value="수정" onclick="confirm('정말 수정하시겠습니까?'); formCheck()" class="table_button">
                <input type="button" value="취소" onclick="history.back()"  class="table_button">
                <input type="button" value="글목록" class="table_button" onclick="location.href='/jsp_leopard/list.board?pageNo=1'"></td>
            </tr>            
            
    </table>
</form>
</div>
    <%@ include file="../include/footer.jsp" %>
  </body>
  
</html>