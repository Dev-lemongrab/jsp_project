<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="../js/jquery-3.3.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/faq.css">
<title>Insert title here</title>
<script>
	$(function(){ 
		var soo=[1,2,3,4,5,6,7,8,9,10]; 
		
		$.each(soo,function(index,value){
			$("#title"+value).click(function(){
				if($('#stitle'+value).is(':hidden')) 
						$('#stitle'+value).show(); 
				else
					$('#stitle'+value).hide();				
			}); 
			
		}); 
	}); 
</script>

</head>
<body>
	<%@ include file="../include/header.jsp" %>
  <div class="container" >
    <div class="faq__div">
      <h1>FAQ</h1>
      <div class="faq__list">
        <div id="title1" class="title">
          <div class="icon"><img src="../images/q.png"></div>
          <div class="category">배송</div>
          <div class="text">배송기간이 얼마나 소요되나요?</div>
      </div>
      <div id="stitle1"  class="stitle" style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>저희 레오파드는 공휴일 포함하여 보통 3~4일정도 물품을 준비하고</p>
            <p>총 배송일 6~8일정도 소요되오니 여유롭게 주문해주시기 바랍니다.</p>
          </li>
        </ul>
      </div>

      <div id="title2" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">배송</div>
        <div class="text">배송비 기준은 어떻게 되나요?</div>
      </div>
      <div id="stitle2"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>기본 배송비는 2,500원이며, 3만원 이상 구매 시 무료 배송입니다.</p>
          </li>
        </ul>
      </div>

      <div id="title3" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">배송</div>
        <div class="text">배송비가 추가되기도 하나요?</div>
      </div>
      <div id="stitle3"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>대부분의 경우 추가 배송비는 부가되지 않습니다만, </p>
            <p>일부 도서/산간 지역, 제주도, 설치 상품의 경우 지역에 따라 추가비용이 발생할 수 있습니다.</p>
          </li>
        </ul>
     </div>

      <div id="title4" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category category1">교환/환불</div>
        <div class="text">파손된 상품을 받았습니다. 어떻게 해야하나요?</div>
      </div>
      <div id="stitle4"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>파손의 경우 포장 또는 운송도중 발생이 대부분이며,</p>
            <p>고객센터(1234-4567)에 전화 주시거나 1:1 게시판에 문의해주시면 빠른 처리 도와드리도록 하겠습니다.</p>
          </li>
        </ul>
      </div>

      <div id="title5" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category category1">교환/환불</div>
        <div class="text">주문취소 시, 카드결제 취소와 환불은 언제 이루어지나요?</div>
      </div>
      <div id="stitle5"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>취소완료가 되면 카드는 바로 결제취소가 이뤄지며, 카드사 홈페이지에서는 일반적으로 2~5일 이 후 반영됩니다. </p>
            <p>실시간 계좌이체의 경우는 환불계좌가 확인되는 때로부터 평일 기준 3~7일 이내 환불됩니다.</p>
          </li>
        </ul>
      </div>

      <div id="title6" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">상품/주문</div>
        <div class="text">품절된 상품은 재구매가 불가능한가요?</div>
      </div>
      <div id="stitle6"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>현재 물류 실재고로 운영되고 있으므로, 더 이상 재 입고가 불가능하여, 주문하실 수 없습니다..</p>
          </li>
        </ul>
      </div>

      <div id="title7" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">상품/주문</div>
        <div class="text">상품에 대한 문의는 어떻게 하나요?</div>
      </div>
      <div id="stitle7"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>상품에 대한 문의는 고객센터(1234-4567) 또는  1:1 게시판에 문의해주시면 빠른 처리 도와드리도록 하겠습니다.</p>
          </li>
        </ul>
      </div>

      <div id="title8" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">상품/주문</div>
        <div class="text">주문 후 다른 결제 방법으로 변경이 가능한가요?</div>
      </div>
      <div id="stitle8"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>아니요. 고객센터를 통한 결제가 불가하므로 기존 주문 취소 후 다시 주문하셔야 합니다.</p>
          </li>
        </ul>
      </div>

      <div id="title9" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">계정</div>
        <div class="text">회원가입 시 나이제한이 있나요?</div>
      </div>
      <div id="stitle9"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>만 14세 이상인 고객님만 가입 가능합니다.</p>
          </li>
        </ul>
      </div>

      <div id="title10" class="title">
        <div class="icon"><img src="../images/q.png"></div>
        <div class="category">계정</div>
        <div class="text">회원 정보수정은 어떻게 하나요?</div>
      </div>
      <div id="stitle10"  class="stitle"  style="display: none">
        <ul>
          <li>
            <img src="../images/a.png">
            <p>[마이페이지 → 개인정보수정] 회원 정보 수정 시 본인인증 및 비밀번호 입력 후 수정이 가능합니다.</p>
          </li>
        </ul>
      </div>
      
      </div>
    </div>
  </div>
  	<%@ include file="../include/footer.jsp" %>
</body>

</html>
