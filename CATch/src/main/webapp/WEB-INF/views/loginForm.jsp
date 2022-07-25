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


    
 
</head>
<th:block th:fragment="setLogin(login)">
<body>

	
   
	<div class="member_login">

 	<form th:action="login.do" th:method="post" class="loginForm">
   	<b><h2>Login</h2></b>
		
      
      <div class="idForm">아이디
      	<input name="mem_id"  type="text"   placeholder="ID">
      </div>
      
      <div class="passForm">비밀번호
      <input name="mem_pw" type="password" placeholder="PW">
      </div>
      
      <input type="submit"  class="btn btn-secondary" id="btn-login" value="L O G I N"/>
      <div class="bottomText">
      	회원이 아니신가요? <a href="join.do">회원가입</a>
      </div>
    
    </form>

	</div>
</body>
</th:block>
</html>