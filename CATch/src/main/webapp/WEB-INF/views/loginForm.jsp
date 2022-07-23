<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>

<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	<jsp:include page="header.jsp"></jsp:include>
	

   <form action="login.do" method="post" class="loginForm">
   
		<b><h2>Login</h2></b>
      
      <div class="idForm">아이디
      	<input name="mem_id"  type="text"   placeholder="ID">
      </div>
      
      <div class="passForm">비밀번호
      <input name="mem_pw" type="password" placeholder="PW">
    
      </div>
      <input type="submit"  value="L O G I N"/>
      <div class="bottomText">
      	회원이 아니신가요? <a href="join.do">회원가입</a>
      </div>
    
    </form>
   

	
</body>
</html>