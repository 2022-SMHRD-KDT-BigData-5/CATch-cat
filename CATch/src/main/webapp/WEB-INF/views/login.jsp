<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
<th:block th:fragment="setLogin(login)">

<body>
   
   <jsp:include page="header.jsp"></jsp:include>   
	<div class="member_login">
		<form th:action="@{/auth/loginProc}" th:method="POST">
			<div class="member_login_input">
				<input type="text" name="username" placeholder="아이디">
			</div>
			
			<div class="member_login_input">
				<input type="password" name="password" placeholder="비밀번호">
			</div>
			
			<div class="member_login_btn">
				<input type="submit" class="btn btn-secondary" id="btn-login" value="로그인">
				
				<input type="button" class="btn btn-secondary" value="회원가입">
				
			</div>
			
			<div class="find_password">
				<a href="/forgot-password">아이디 또는 비밀번호를 잊으셨나요?</a>
			</div>
			
			<div class="login_api">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=d860d38c992ca8bf5f07dcc3fd5122b9&redirect_uri=http://localhost:9090/member/auth/kakao/callback&response_type=code"><img src="/image/kakao_login_medium_narrow.png"></a>
			</div>
			
			<div class="login_api">
				<a href="/oauth2/authorization/google"><img src="/image/btn_google_signin_dark_pressed_web.png"></a>
			</div>
		</form>
	</div>
</body>
</th:block>
</html>