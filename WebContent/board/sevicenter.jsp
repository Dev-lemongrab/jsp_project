<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/center.css">
<meta charset="UTF-8">
<title>고객센터</title>


</head>
<body>
	<%@ include file="../include/header.jsp" %>

<div class="container">
	<h1 class="top_text">고객센터</h1>
	<div class="service_king">
		<div class="service_1">
			<p class="center_1">레오파드 고객센터</p>
				<div class ="image1">
					<img  class = "image3" src="../images/call.png" width=70 height=70 />
				</div>
			<p class="tel_call">1234-4567</p>
			<p class="center_3">
			상담시간: AM 10:00 ~ PM 17:00<br>
			점심시간: PM 12:30 ~ PM 13:30</p>
			 <p>(주말 및 공휴일 휴무)</p>
		</div>
		<div  class="service_2">
				 <p class="center_4">편리한 실시간 상담</p>
				     <div class ="image1">
						<img class = "image4" src="../images/speech.png" width=70 height=70 />
					 </div>
				<p class = "ser_text">카톡친구추가</p>
				<p class = "ser_text1">+LEOPARD</p>
				 <p>상담시간  AM 10:00 ~ PM 17:00 </p>
		</div>
	</div>
</div>
    <%@ include file="../include/footer.jsp" %> 
</body>
</html>