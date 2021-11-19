<%@page import="com.leopard.product.model.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		 productVO vo = (productVO)session.getAttribute("product");
   		 String pro_img = vo.getPro_img();
    	 // /jsp_leopard/images/no.1_gif.gif
    	 String[] sel_img = pro_img.split("/");
    	 String[] img_num = sel_img[3].split("_");
    	 String[] fin_img = new String[5];
    	 for(int i = 0 ; i < 5 ;i++){
    	 	fin_img[i] = "/jsp_leopard/images/product/"+img_num[0]+"/"+img_num[0]+"_"+(i+1)+".jpg";
    	 	out.println(fin_img[i]);
    	 }
    	 
    	 // /jsp_leopard/images/no.1/no.1_1.jpg
    
    %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/jsp_leopard/css/detail.css">
<meta charset="UTF-8">
<title>제품 상세페이지</title>
 <%@ include file="../include/header.jsp" %>
    <script src='http://code.jquery.com/jquery-1.8.2.min.js'></script>
    
</head>
<body>
    <div class="container">
        <div class="all">
            <div class="product">
                <div class="main_product">
                    <img src="<%=fin_img[0] %>" class="big_img" width="550px"> 
                    <ul class="sub_img">
                    <!-- 1번이 체크된 상황이기 때문에 1번부터 3번까지만 가져와주세요 -->
                        <li class="active"><img src="<%=fin_img[0] %>" width="110px"></li>
                        <li><img src="<%=fin_img[1] %>" width="110px"></li>
                        <li><img src="<%=fin_img[2] %>" width="110px"></li>
                    </ul>
                </div>
                <div class="sub_product">
                    <h2>- detail -</h2>
                    <img src="<%=fin_img[0] %>">
                    <img src="<%=fin_img[1] %>" >
                    <img src="<%=fin_img[2] %>" >
                    <img src="<%=fin_img[3] %>" >
                    <img src="<%=fin_img[4] %>" >
                </div>
            </div>

            <div class="product_specs">
                <div class="product_option">
                    <h2><label id="name">${product.pro_name}</label> </h2>
                    <h3><label id="price">${product.pro_price }</label>원</h3>
                    <p>적립금 ⓟ (1%)</p>
                    <hr/>

                        <div class="color">
                            <h4>COLOR</h4>
                            <select id="option_1" class="more_option" name="option_1">
                                <option value="">-[필수] COLOR 선택-</option>
                                <option value="null">------------------------------</option>
                                <option value="blue">blue</option>
                                <option value="black">black</option>
                                <option value="pink">pink</option>
                            </select>
                        </div>
                        <div class="option_row">
                            <div class="size">
                                <h4>SIZE</h4>
                                    <input type="radio" id="s_size" name="size" value="s">
                                    <label for="s_size">S</label>
                                    <input type="radio" id="m_size" name="size" value="m"  >
                                    <label for="m_size">M</label>
                                    <input type="radio" id="l_size" name="size" value="l">
                                    <label for="l_size">L</label>
                                    <input type="radio" id="xl_size" name="size" value="xl">
                                    <label for="xl_size">XL</label>
                            </div>
                            <!-- 여기 data-unitprice에도 가격 들어와야함 -->
                            <div class="quantity" data-unitprice="${product.pro_price }" >
                                <h4>수량 선택</h4>
                                    <span class="plus">+</span>
                                    <input type="text" readonly value="1">
                                    <span class="minus">-</span>
                            </div>
                            <div class="order_click">
                                <span class="click">v</span>
                            </div>
                        </div>
                        <hr/>
                        <div class="select_product">
                            <div class="show_data">
                            </div>
                        </div>
                        <hr/>
                        <div class="order_summary">
                            <div class="total_price">
                                <h4>가격</h4>
                                <span class="price"> 원</span>
                                <button type="button" class="favorite" ><img src="/jsp_leopard/images/favorite1.png"></button>
                            </div>
                            <div class="order_now">
                                <button type="button" class="cartBtn basket hover1"><img src="/jsp_leopard/images/basket1.png"><br> 장바구니 담기</button>
                                <button type="button" class="orderBtn hover1"><img src="/jsp_leopard/images/order1.png"><br> 바로 주문하기</button>
                                <!-- onclick ="location.href='/jsp_leopard/product/payment.jsp'" -->
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="../js/detail.js?ver=1"></script>
    <%@ include file="../include/header.jsp" %>
  </body>

  
</html>