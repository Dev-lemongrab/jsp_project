<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 창</title>
    <script src='http://code.jquery.com/jquery-1.8.2.min.js'></script>
    <script src="../js/payment.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- <script src="../js/import.js"></script> -->



<link rel="stylesheet" href="../css/payment.css">
<%
	request.setCharacterEncoding("UTF-8");
	// String[] arr = request.getParameterValues("itemList");
	String[] arr = (String[])request.getParameterValues("itemList");
%>
<script>	


	if(${login == null}){
		alert('로그인이 필요합니다.')
		location.href ='/jsp_leopard/user/login.jsp';
	}else if (${param.itemList == ""}){
		alert('최소 한개이상의 제품을 선택해주세요!')
		history.back()
	}
	var str='<%=arr[0]%>';
	var list=str.split(",");
	
	var result = [];
	
	for(i=0; i<list.length; i+=5) 
		result.push(list.slice(i, i+5));
	console.log(result)
	
$(document).ready(function () {
	
	
	showList(); //가져온 데이터를 뿌려주는 함수호출
	var list="";
	function showList(){
	    for(let i=0;i<result.length;i++){
	        list2="<tr class='cart_box'>";
	        for(let j=0;j<result[i].length;j++){
	            list2+="<td class='cart_list'>"+result[i][j]+"</td>";
	        }
	        list2+="</tr>";	
	        $('#mytable > tbody').append(list2);
	    }
	    showPrice();
	}
	
	
	function showPrice(){
		var itemprice=0;
		var delivery=2500;
		for(let i=0;i<result.length;i++){
				itemprice+=parseInt(result[i][4]);				
		}
		var totalprice=delivery+itemprice;
		$('#totalprice').text(totalprice);
		$('#itemprice').text(itemprice);
	}
	
	$('.btn_order').click(function(){
		iamport();
	})
	
	function iamport(){
		//가맹점 식별코드
		IMP.init('imp30707647');
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '<c:out value ="LEOPARD ${login.uName}님의 결제"/>' , //결제창에서 보여질 이름
		    amount : $('#totalprice').text(), //실제 결제되는 가격  //여기부분 수정해서 토탈 가격으로 바꾸면 결재 ok
		    buyer_email : '<c:out value="${login.uEmail}"/>',  
		    buyer_name : '<c:out value="${login.uName}"/>',
		    buyer_tel : '<c:out value="${login.uTel}"/>',
		    buyer_addr : '<c:out value="${login.uAdr}"/>',
		    buyer_postcode : '123-456',
		    
		    
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        location.href ='/jsp_leopard/index.jsp';
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	
	
  });
	
	
</script>

</head>
<body>
<%@ include file="../include/header.jsp" %>

    <div class="container">
        <div class="all">
			<h1>결제 목록</h1>

			<div class="tab_con_wrap wrapper">
				<div class="tab_con">
					<table class="cart_table" id="mytable">
					<thead>
						<tr class="cart_top">
							<th class="top1">상품명</th>
							<th class="top2">상품 컬러</th>
							<th class="top3">상품 사이즈</th>
							<th class="top4">수량</th>
							<th class="top5">금액</th>		
						</tr>
					</thead>
					<tbody>
					
					</tbody>
						</table>
						<p id="price">[기본배송] 상품구매금액 <label id="itemprice"></label> + 배송비<strong>2500</strong> = 합계 : <label id="totalprice"></label>원</p>
						<div class="cart_buy_btn">
							<input type="button"  value="결제하기" class="btn_order buy_btn"/>
							 <input type="button" onclick="history.back()" value="결제 취소" class="btn_shop buy_btn"/>
						</div>
				</div>
			</div>
	    </div>      
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>