<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
 
<html>
<head>

<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<!-- 게시판css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
		<html lang="en" xmlns:th="http://www.thymeleaf.org">
	<th:block th:fragment="setLogin(login)">

	
     <div class="member_login">
   <jsp:include page="header.jsp"></jsp:include>   
  
   <form th:daction="@{/auth/login.do}" th:method="post" class="loginForm">
  
		<b><h2>Login</h2></b>
      
      <div class="idForm">아이디
      	<input name="mem_id"  type="text"   placeholder="ID">
      </div>
      
      <div class="passForm">비밀번호
      <input name="mem_pw" type="password" placeholder="PW">
      </div>
      <input type="submit" class="btn btn-secondary" value="L O G I N"/>
      <div class="bottomText">
      	회원이 아니신가요? <a href="join.do">회원가입</a>
      </div>
    
    </form>
    </div>
	
	</th:block>
	<ul class="nav">
 <li>
  <a data-toggle="modal" href="#loginModal">LOGIN</a>
  <div class="modal fade" id="loginModal" role="dialog">
   <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">×</button>
      <h1 class="modal-title" align="center">로그인</h1>
     </div>
     <div class="modal-body">
      <th:block th:replace="~{/member/login:: setLogin(~{this::login} )}"></th:block>
     </div>
    </div>
   </div>
  </div>
 </li>
</ul>
</body>
</html>