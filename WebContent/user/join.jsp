<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/join.css">
<link rel="stylesheet" type="text/css" href="/jsp_leopard/css/reset.css">

<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
         
         function formCheck(){
        
           
           if (member.id.value==""){
             alert("아이디를 입력하세요!!")
             member.id.focus();
             return;
           }else if (member.passwd.value==""){
             alert("패스워드를 입력하세요!!")
             member.passwd.focus()
             return;
           }else if (member.name.value==""){
               alert("이름을 입력하세요!!")
               member.name.focus()
               return;
           }else if (member.birth.value==""){
               alert("생년월일 입력하세요!!")
               member.birth.focus()
               return;
           }else if (member.tel1.value=="" || member.tel2.value=="" || member.tel3.value==""){
             alert("전화번호를 입력하세요!!")
             member.tel2.focus()
             return;
           }else if (member.birth.value==""){
               alert("생년월일 입력하세요!!")
               member.birth.focus()
               return;
           }else if (member.adr.value==""){
             alert("주소를 입력하세요!!")
             member.adr.focus()
             return;
           }else {
	        	document.member.submit();   
           }
         }
         
         function passwordCheckFunc(){
           var p =document.getElementById("pw").value;
           var pck=document.getElementById('pwck').value;
     
           if(pck==""){
             document.getElementById("passwordCheckText").innerHTML="";
           }
           if(p!=pck){
             document.getElementById("passwordCheckText").innerHTML="  일치하지 않습니다.";
           }
           else{
             document.getElementById("passwordCheckText").innerHTML="  일치합니다.";
           }
         }
        
        
   		$(function() {
      	  $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#email_2').attr("disabled", false);
                $('#email_2').val("");
                $('#email_2').focus();
            } else {
                $('#email_2').val($('#select').val());
            }
        })
    });    
   </script>
  </head>
   <body>
   <%@ include file="../include/header.jsp" %>
   <form name="member" action="insert.user" method="post" >
     <div class="join">
       <table class="jointable">
       <tr class="table__top">
         <td colspan="2"><h1>JOIN</h1></td>
       </tr>
       <tr>
         <th class="join__th">아이디</th>
         <td class="join__td"><input type="text" class="inputbox" name="id" placeholder="아이디 입력" autofocus> (영문소문자/숫자, 4~16자)
         					  <input type="hidden" name = "point" value = "2000"> 
         </td>
       </tr>
   
       <tr>
         <th class="join__th">패스워드</th>
         <td class="join__td"><input type="password" class="inputbox" name="passwd" id="pw"placeholder="****"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
       </tr>
   
       <tr>
         <th class="join__th">패스워드 확인</th>
         <td class="join__td">	
           <input type="password" class="inputbox" name="passwdCheck" id="pwck" onkeyup="passwordCheckFunc()">
          <span id="passwordCheckText"></span> 
         </td>
       </tr>

       <tr>
        <th class="join__th">이름</th>
        <td class="join__td"><input type="text" class="inputbox" name="name"></td>
      </tr>

        <tr>
          <th class="join__th">생년월일</th>
          <td class="join__td"><input type="text" class="inputbox" name="birth"></td>
        </tr>

        <tr>
          <th class="join__th">성별</th>
          <td class="join__td"><input type="radio" name="Gender" value="men">남자
          <input type="radio" name="Gender" value="women">여자</td>
        </tr>

       <tr>
         <th class="join__th">전화번호</th>
         <td class="join__td"><select name="tel1">
           <option>010</option>
           <option>011</option>
           <option>016</option>
           <option>017</option>
           <option>019</option>
         </select> -
         <input type="text" name="tel2" maxlength="4" size="2" > -
         <input type="text" name="tel3" maxlength="4" size="2"> </td>
       </tr>

       <tr>
        <th class="join__th">sns 수신동의 </th>
        <td class="join__td"><input type="radio" name="snsagree" value="agree">동의함
        <input type="radio" name="snsagree" value="noagree">동의하지 않음</td>
      </tr>

       <tr>
         <th class="join__th">이메일</th>
         <td class="join__td">
         <input type="text" id="email_1" name="email_1"  maxlength="15" size="10" > @ 
         <input id="email_2" name="email_2"  placeholder="직접입력" maxlength="10" size="13"> 
         	<select id="select">
            <option value="" disabled selected>- 선택 -</option>
            <option value="naver.com" id="naver.com">naver.com</option>
            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
            <option value="gmail.com" id="gmail.com">gmail.com</option>
            <option value="nate.com" id="nate.com">nate.com</option>
            <option value="directly" id="textEmail">직접 입력하기</option>
        	</select>
        </td>
       </tr>
   
       <tr>
         <th class="join__th">주소</th>
         <td class="join__td"><input type="text" class="inputbox" name="adr"></td>
       </tr>
       
       <tr>
        <th class="join__th">이메일 수신동의 </th>
        <td class="join__td"><input type="radio" name="emailagree" value="agree">동의함
        <input type="radio" name="emailagree" value="noagree">동의하지 않음</td>
      </tr>

       <tr>
         <td colspan="2" class="table__bottom,join__td" align="right">
             <input type="button" value="회원가입" id="join__submit" onclick="formCheck()"> 
             <input type="reset" value="취소" id="join__reset">
         </td>
       </tr>
     </table>
     </div>
   </form>
  </body>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</html>