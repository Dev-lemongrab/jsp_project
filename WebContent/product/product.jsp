<%@page import="com.leopard.product.model.productVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.kind }</title>
<link rel="stylesheet" type="text/css" href="../css/best1.css"> 



</head>
<body>
   <%@ include file="../include/header.jsp" %>
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <div id ="text_name">
    	<h1>${param.kind } </h1><br><br><br>
	   <c:choose>
	   		<c:when test="${productList.size() == 0 }">
	   			<h5>상품 준비 중입니다.</h5>
	   		</c:when>
	   </c:choose>
   </div>
  
<div id="bt">
   
<div class="best_0" id="section">

<table border="1" cellpadding="0" cellspacing="10">
				
				<!-- 조그만 사진 4줄 -->
					<tr>
						<c:forEach var="i" items="${productList }">
						<c:choose>
							<c:when test="${i.pro_id<=12 }">
							<td align="center" onClick="location.href='/jsp_leopard/detail.product?pro_img=${i.pro_img}'" style="cursor:pointer;">
			 		            <a href="/jsp_leopard/detail.product?pro_img=${i.pro_img}"><img id="imsi" src="${i.pro_img }" style="width: 80%; height: auto;" alt="" ></a>
			 		            <p class="best_name"><b>${i.pro_name }</b></p>
			 					<p class="best_soname" >${i.pro_info }</p>
			 					<p class="price">${i.pro_price }</p><br><br>
			 				</td>
			 				</c:when>
			 			</c:choose>
			 			</c:forEach>
					</tr>

					<tr>
						<c:forEach var="i" items="${productList }">
						<c:choose>
							<c:when test="${i.pro_id>=13 &&i.pro_id<=16 }">
							<td align="center" onClick="location.href='/jsp_leopard/detail.product?pro_img=${i.pro_img}'" style="cursor:pointer;">
			 		            <a href="/jsp_leopard/detail.product?pro_img=${i.pro_img}"><img id="imsi" src="${i.pro_img }" style="width: 80%; height: auto;" alt="" ></a>
			 		            <p class="best_name"><b>${i.pro_name }</b></p>
			 					<p class="best_soname">${i.pro_info }</p>
			 					<p class="price">${i.pro_price }</p><br><br>
			 				</td>
			 				</c:when>
			 			</c:choose>
			 			</c:forEach>
					</tr>
				
				
</table>

<table border="1">
				<tr>
					<c:forEach var="i" items="${productList }" step="4">
							<td align="center" onClick="location.href='/jsp_leopard/detail.product?pro_img=${i.pro_img }'" style="cursor:pointer;"> 
			 		             <a href="/jsp_leopard/detail.product?pro_img=${i.pro_img }"><img id="imsi" src="${i.pro_img }" style="width: 90%; height: auto; Padding-top:30px;" alt="" ></a>
			 		            <p class="best_name">${i.pro_name }</p>
			 					<p class="best_soname">${i.pro_info }</p>
			 					<p class="price">${i.pro_price }</p><br><br>
			 		      	</td>
			 		</c:forEach>
			 	</tr>
			 	
</table>

</div>
</div>
<%@ include file ="../include/footer.jsp" %>
</body>
</html>