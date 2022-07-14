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
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
	
<jsp:include page="header.jsp"></jsp:include>	
	
	<!-- 회원가입 -->
	
	<form action="join.do" method="post">
		
		<h2>회원가입</h2>
		
		<div>아이디</div>
		<input name="mem_id" type="text" placeholder="ID를 입력">
		
		<div>비밀번호</div>
		<input name="mem_pw" type="password" placeholder="비밀번호 입력">
		
		<div>비밀번호확인</div>
		<input name="checkpw" type="password" placeholder="비밀번호와 동일하게 입력">
		
		<div>이름</div>
		<input name="mem_name" type="text" placeholder="이름을 입력">
		
		<div>전화번호</div>
		<input name="mem_phone" type="text" placeholder="전화번호를 입력">
		
		<div>병원관계자유무</div>
		<input name="mem_hospital" type="text" placeholder="병원관계자(N) / 보호자(T)">
		
		<input type="submit" class="btn" value="J O I N" />
		
		
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>