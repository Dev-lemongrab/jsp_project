<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/cart.css?ver=2">

	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/reset.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
	<script>
	$(function(){
	    
	    //alert('test')

	    var tabmenu = $('.tab_menu li')
	    var tabcon = $('.tab_con')
	    
	    
	    var tab = function(){
	        $(this).addClass('on')
	        $(this).siblings().removeClass('on')
	        
	        var index = $(this).index()
	        
	        tabcon.hide()
	        tabcon.eq(index).fadeIn()
	    }
	        tabmenu.click(tab)
	    tabmenu.first().trigger('click')
	    
	})
	</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <div class="container">
        <div class="all">
            <h1>CART</h1>
            
            <ul class="tab_menu">
	        <li>국내배송상품</li>
	        <li>해외배송상품</li>
	      
	    </ul>

	    <div class="tab_con_wrap wrapper">
	        <div class="tab_con">

			<table class="cart_table">
			<tr class="cart_top">
				<th class="top0">선택</th>
				<th class="top1">이미지</th>
				<th class="top2">상품명</th>
				<th class="top3">상품정보</th>
				<th class="top4">수량</th>
				<th class="top5">금액</th>		
			</tr>
<%-- 	        <tr>
	            <td class="cart_list1"><img src="${p.pro_img }" alt=""></td>
	            <td class="cart_list2">${p.pro_name }</td>
	            <td class="cart_list3">${p.pro_info }</td>
	            <td class="cart_list4">수량</td>
	            <td class="cart_list5">${p.pro_price }</td>
	        </tr> --%>
	   <c:forEach var="i" items="${cartList }">
	        <tr class="cart_box">
	       		<td class="cart_list cart_list2"><input type="checkbox" /></td>
	            <td class="cart_list cart_list1"><img src="${i.pro_img }" alt="" /></td>
	            <td class="cart_list cart_list2">${i.pro_name }</td>
	            <td class="cart_list cart_list3">${i.pro_info }</td>
	            <td class="cart_list cart_list4">${i.quantity }</td>
	            <td class="cart_list cart_list5">${i.pro_price }</td>
	        </tr>
	  </c:forEach>
	        <tr>
	        <td colspan="6" class="cart_info">
	        	<p>[기본배송] 상품구매금액 <strong>39,800</strong> + 배송비<strong>2,500</strong> = 합계 : <strong>32,500</strong>원</p>
	        </td>
	        </tr>
			</table>
			<div class="cart_list_btn">
				선택 상품을 
				<input type="button" onclick="location.href='./board_write.jsp'" value="선택삭제" class="btn_cart"/>
			 	<input type="button" onclick="location.href='./board_write.jsp'" value="장바구니 비우기" class="btn_cart"/>
			</div>
		</div>
		<!--con1 end-->
		   <div class="tab_con">
	        	<table class="cart_table">
			<tr class="cart_top">
				<th class="top0">선택</th>
				<th class="top1">이미지</th>
				<th class="top2">상품명</th>
				<th class="top3">상품정보</th>
				<th class="top4">수량</th>
				<th class="top5">금액</th>		
			</tr>
	        <tr class="cart_box">
	       		<td class="cart_list cart_list2"><input type="checkbox" /></td>
	            <td class="cart_list cart_list1"><img src="../images/product_1.gif" alt="" /></td>
	            <td class="cart_list cart_list2">상품명</td>
	            <td class="cart_list cart_list3">상품정보</td>
	            <td class="cart_list cart_list4">수량</td>
	            <td class="cart_list cart_list5">금액</td>
	        </tr>
	        <tr>
	        <td colspan="6" class="cart_info">
	        	<p>[기본배송] 상품구매금액 <strong>39,800</strong> + 배송비<strong>2,500</strong> = 합계 : <strong>32,500</strong>원</p>
	        </td>
	        </tr>
			</table>
			<div class="cart_list_btn">
				선택 상품을 
				<input type="button" onclick="location.href='./board_write.jsp'" value="선택삭제" class="btn_cart"/>
			 	<input type="button" onclick="location.href='./board_write.jsp'" value="장바구니 비우기" class="btn_cart"/>
			</div>
	    </div>
	    	<div class="cart_buy_btn">
				<input type="button" onclick="location.href='      '" value="상품주문하기" class="btn_order buy_btn"/>
			 	<input type="button" onclick="location.href='      '" value="쇼핑계속하기" class="btn_shop buy_btn"/>
			</div>
	    </div>
	 
	    </div>
            
            
		</div>
    </div>
  	<%@ include file="../include/footer.jsp" %>
</body>
</html>