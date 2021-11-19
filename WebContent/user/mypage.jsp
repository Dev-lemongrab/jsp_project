<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/mypage.css">
	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/reset.css">
<script >
	function pwCheckFunc() {
		var userPW = prompt("비밀번호를 입력해주세요");
		if (userPW=="<c:out value = '${login.uPw}'/>"){
			location.href="/jsp_leopard/user/modify.jsp";
		}else{
			alert("비밀번호가 틀립니다!!")
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <div class="container">
        <div class="all">
            <h1>MYPAGE</h1>
        <div class="top">
            <p class="top_text">나의 주문처리 현황(최근 3개월 기준)</p>
            <div class="shipping">
                <div class="count1">
                   	 입금전<br><br>
                    <label>0</label>
                </div>
                <img src="../images/Arrow.png">

                <div class="count1">
                    	배송준비중<br><br>
                    <label>0</label>
                </div>
                <img src="../images/Arrow.png">

                <div class="count1">
                    	배송중<br><br>
                    <label>0</label>
                </div>
                <img src="../images/Arrow.png">

                <div class="count1">
                    	배송완료<br><br>
                    <label>0</label>
                </div>

                <div class="count1">
                    <p>취소: 0<br>
			           교환: 0<br>
			           반품: 0</p>
                </div>
            </div>
        </div>
        <div class="middle">
            <div class="box_content">
                <div class="title">
                    <img src="../images/i1.png"><label> ORDER</label><br>
                    주문내역 조회
                </div>
                <p>고객님께서 주문하신 상품의 <br>주문내역을 확인 하실 수 있습니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i2.png"><label> WISHLIST</label><br>
                    관심 상품
                </div>
                <p>관심상품으로 등록하신  <br>상품의 목록을 보여드립니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i3.png"><label> COUPON</label><br>
                    쿠폰
                </div>
                <p>고객님이 보유하고 계신 <br>쿠폰 내역을 보여드립니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i4.png"><label> MILEAGE</label><br>
                    적립금 조회
                </div>
                <p>적립금은 상품 구매시<br> 사용하실 수 있습니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i5.png"><label> DEPOSIT</label><br>
                    예치금
                </div>
                <p>예치금은 현금과 동일하게  <br>상품 구매시 사용하실 수 있습니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i6.png"><label> BOARD</label><br>
                    내가 쓴 글 보기
                </div>
                <p>고객님이 작성하신 글을<br> 한눈에 관리하실 수 있습니다.</p>
            </div>

            <div class="box_content">
                <div class="title">
                    <img src="../images/i7.png"><label> ADDRESS</label><br>
                    배송 주소록 관리
                </div>
                <p>자주 사용하는 배송지를 <br>등록하고 관리하실 수 있습니다.</p>
            </div>

            <div class="box_content" onclick="pwCheckFunc()">
                <div class="title">
                    <img src="../images/i8.png"><label> PROFILE</label><br>
                    회원 정보 수정
                </div>
                <p>고객님의 개인정보를 <br>관리할 수 있는 공간입니다.</p>
            </div>


        </div>
    </div>
    </div>
  	<%@ include file="../include/footer.jsp" %>
</body>
</html>