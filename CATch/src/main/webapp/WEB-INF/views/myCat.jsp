<%@page import="com.smhrd.domain.CatCard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Animal</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

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
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

</head>
<body>
	<% List<CatCard> catcardList = (List<CatCard>) session.getAttribute("catcardList"); %>
	<jsp:include page="header.jsp"></jsp:include>

	<h1 class='h_title'>MY CAT</h1>

	<c:choose>
		<c:when test="${empty catcardList}">
			<div id='myCat_body'>
				<div class="myCatCard">
					<div class='mycatCard_header'>
						<p>No. 12345</p>
					</div>
					<div class='mycatCard_side'>
						<img src="img/side_catch.png">
					</div>
					<div class='mycatCard_img'>
						<img src="img/cat121212.png">
					</div>
					<div class="mycatCard_name">
						<p>등록한 고양이가 없다냥</p>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<c:forEach items="${catcardList}" var="cc" varStatus="status">
				<div id='myCat_body'>
					<div class="myCatCard">
						<div class='mycatCard_header'>
							<p>${cc.getCat_seq()}</p>
						</div>
						<div class='mycatCard_side'>
							<img src="img/side_catch.png">
						</div>
						<div class='mycatCard_img'>
							<img src="img/cat121212.png">
						</div>
						<div class="mycatCard_name">
							<p>${cc.getCat_name()}</p>
						</div>
					</div>
				</div>
			</c:forEach>


		</c:otherwise>
	</c:choose>



</body>
</html>