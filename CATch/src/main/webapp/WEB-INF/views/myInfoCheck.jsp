<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link rel="stylesheet" href="css/myCat.css">
    <link rel="stylesheet" href="css/jointest.css">
    <style>
    	.id_ok{color:rgb(7, 104, 7); display:none;}
    	.id_already{color:rgb(219, 20, 63); display:none;}
    </style>
</head>
<body>
<% 
 	Member member = (Member)session.getAttribute("member");%>
 	<h1 class = "h_title"><img src="img/catch-removebg.png" ></h1>
<div class="joinform">
<br><br>
<h4>회원정보 확인을 위해 비밀번호를 입력해주세요</h4><br><br><br>
<form action="myInfo.do" method="post">
	<input type="hidden" name="mem_id" value=<%=member.getMem_id() %>>
	<input type="password" name="mem_pw">
	<h5>  </h5>
	<input type="submit" class="btn"value="입력">
</form>
 </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript"></script>
   
</body>
</html>
