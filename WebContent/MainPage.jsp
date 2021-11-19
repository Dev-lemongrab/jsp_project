<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> LEOPARD | Home </title>
 	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/reset.css">
 	<link rel="stylesheet" href="/jsp_leopard/js/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/jsp_leopard/js/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/jsp_leopard/js/OwlCarousel2-2.3.4/dist/owl.carousel.js"></script> 
    <script>
    $(function(){
        $("#visual .owl-carousel").owlCarousel({
            items : 1, //이미지 썸네일 갯수
            loop : true, //반복
            autoplay : false, //자동 
            autoplayTimeout :5000, //슬라이드 시간
            autoplayHoverPause : true, //호버시 일시정지
            nav : true,
            onInitialized : load,
            onTranslate : before,
            onTranslated : after
        });
        function load(){
            $('.slider1 .vtit').animate({
                top : 0,
                opacity : 1
            })
        }
        function before(){
            $('.vtit').css({
                top : 50,
                opacity : 0
            })
        }
        function after(event){                
            var page = event.page.index;            
            if(page == 0){
                $('.slider1 .vtit').animate({top:0,opacity:1})
            }else if(page == 1){
                $('.slider2 .vtit').animate({top:0,opacity:1})
            }else if(page == 2){
                $('.slider3 .vtit').animate({top:0,opacity:1})
            }
        }      
    
        $("#con2 .owl-carousel").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            autoplayTimeout: 4000,
            autoplayHoverPause: true,
            smartSpeed: 500,
            nav: true,
        })
    })
        </script> 

</head>
<body>  

	<%@ include file="include/header.jsp" %>
    <section id="visual">
            <ul class="owl-carousel">
                <li class="slider1"></li>
                <li class="slider2"></li>
                <li class="slider3"></li>
            </ul>
        </section>

		<!--                                   -->
		<!-- 상품 디비에서 상품 각각vo로 감싼다음에 어레이리스트에 넣어서 세션에 등록했어요. -->
	<div id="wrap">
		<div class="product_sec1"  id="section">
	 		<h3>New Arrivals</h3>
	 		<table border="1">
	 		    <tr>
	 		    	<c:forEach var="p" items="${productList }">
	 		<c:choose>
	 			<c:when test="${p.pro_id <= 4}">
	 		        <td>
	 		            <a href="/jsp_leopard/detail.product?pro_img=${p.pro_img }"><img src="${p.pro_img }" alt=""></a>
	 		            <p class="product_name">${p.pro_name }</p>
	 					<p class="product_info">${p.pro_info }</p>
	 					<p class="price">${p.pro_price }원</p>
	 					<span class="product_icon icon_1">자체제작</span>
	 					<span class="product_icon icon_2">당일배송</span>
	 		        </td>
	 			</c:when>
	 		</c:choose>
	 		</c:forEach>
	 		</tr>
	 		<tr>
	 		<c:forEach var="p" items="${productList }">
	 		<c:choose>	
	 			<c:when test="${p.pro_id <= 8 && p.pro_id > 4}">
	 		        <td>
	 		            <a href="/jsp_leopard/detail.product?pro_img=${p.pro_img }"><img src="${p.pro_img }" alt=""></a>
	 		            <p class="product_name">${p.pro_name }</p>
	 					<p class="product_info">${p.pro_info }</p>
	 					<p class="price">${p.pro_price }원</p>
	 					<span class="product_icon icon_1">자체제작</span>
	 					<span class="product_icon icon_2">당일배송</span>
	 		        </td>
	 		   	</c:when>
	 		</c:choose>     
	 		</c:forEach>
	 		</tr>
	 		</table>
		</div> 
		
		
		
		
<!-- 			 -->
		
		<div id="section" class="event_sec">
        <h3>EVENT</h3>
		<section id="con2">
            <ul class="owl-carousel">
                <li><img src="/jsp_leopard/images/event1.png"></li>
                <li><img src="/jsp_leopard/images/event2.png"></li>
                <li><img src="/jsp_leopard/images/event3.png"></li>
            </ul>	
        </section>	
		</div> 


<!-- 			 -->
<!-- 		<div id="section">
	
			<iframe width="560" height="315" src="https://www.youtube.com/embed/MBN5HN3o7FE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div> -->
		
		
	</div>
	<%@ include file ="include/footer.jsp" %>
</body>
</html>