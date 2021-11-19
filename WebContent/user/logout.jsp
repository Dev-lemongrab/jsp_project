<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%//경로를 직접쳐서 로그아웃으로 접근한경우 로그아웃이 안되게 로그아웃버튼입력시 파라미터전달
    
    String logout = request.getParameter("logout");
    out.print("로그아웃요청리퀘스트객체");
	if(logout.equals("Logout")){
		session.invalidate();%>
	    <script>
			alert("로그아웃 처리되었습니다.");
			location.href="/jsp_leopard";
		</script>
	<%}else {%>
		<script>
			alert("정상적인 로그아웃 접근이 아닙니다.");
			location.href="/jsp_leopard";
		</script>
	<%} %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>