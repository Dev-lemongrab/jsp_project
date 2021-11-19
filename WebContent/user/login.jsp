<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>  
	<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/login.css">
    <%    request.setCharacterEncoding("euc-kr");   %>
    
    <title>로그인 화면</title>

    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    
     
        function JoinForm() {
            location.href="./join.jsp";
        }    
    </script>
 
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <div class="container">
        <div class="login__div">
            <h1>LOGIN</h1>
            <form name="loginInfo" method="post" action="login.user"  autocomplete="on"
            onsubmit="return checkValue()">
            <div class="login__input">
                <table class="login__teble">
                    <tr>
                        <td><strong>ID :</strong></td>
                        <td><input type="text" name="id" placeholder=" 아이디 입력" maxlength="15"></td>
                    </tr>
                    <tr>
                        <td><strong>PW :</strong></td>
                        <td><input type="password" name="password" autocapitalize="off" placeholder=" 비밀번호 입력" maxlength="30"></td>
                    </tr>
                    <tr><td colspan="2"><a href="#" id="loginsearch">아이디 찾기</a>&nbsp;<a href="#" id="loginsearch">비밀번호 찾기</a></td></tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="로그인" id="login__submit" onclick="checkValue() "></td>
                    </tr>
                </table>
               </div>
            </form>
            </div>
            <div class="login__bottom">
                <div class="bottom__text"><p>회원가입을 하시면 다양하고 </p>특별한 혜택이 준비되어 있습니다.</div>
                <div class="bottom__button"><input type="button" id="login__button" value="회원가입"  onclick="location.href='./join.jsp'"></div>
            </div>
   
        </div>
                    <% 
            
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>  
        
    	<%@ include file="../include/footer.jsp" %>     
</body>
</html>