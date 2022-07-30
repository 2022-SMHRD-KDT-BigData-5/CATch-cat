<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<!-- modal 라이브러리 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<!-- 게시판css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->
        <link href="css/login.css" rel="stylesheet" type="text/css" />
<<<<<<< HEAD
 
=======
   		
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-5/CATch-cat.git
    
 
</head>
<th:block th:fragment="setLogin(login)">
<body>

	
   
	<div class="member_login">
	<div class= "body">
 	<form action="login.do" method="POST" class="loginForm" >
   	<b><h2>Login</h2></b>
		
      
      <div class="idForm">
      	<input  type="text" name="mem_id"  placeholder="아이디">

 	  </div>
 
      <div class="passForm">
      <input type="password" name="mem_pw"  placeholder="비밀번호">
      </div>
      
      <input type="submit"  class="btn btn-secondary" id="btn-login" value="로그인"/>
      <div class="bottomText">
      	회원이 아니신가요? <a href="join.do">회원가입</a>
      </div>
     
    </form>
	</div>
	</div>

</body>
</th:block>
</html>