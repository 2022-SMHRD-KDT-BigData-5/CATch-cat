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
<link rel="stylesheet" href="css/catSearch.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
body {
	justify-content: center;
	align-items: center;
}

.swiper {
	width: 240px;
	height: 320px;
}

.swiper-slide {
	box-shadow: 5px 5px 5px gray;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
	font-size: 22px;
	font-weight: bold;
	background-color: #006400;
}

.h_title {
	margin-bottom: 50px;
}
</style>



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
						<img src="img/side_logo.png">
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
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${catcardList}" var="cc" varStatus="status">
						<div class="swiper-slide">
							<a href="seqSearch.do?cat_seq=${cc.getCat_seq()}">
							<div class='mycatCard_header'>
								<p>${cc.getCat_seq()}</p>
							</div>
							<div class='mycatCard_side'>
								<img src="img/side_logo.png">
							</div>
							<div class='mycatCard_img'>
						
									<img src="${cc.getCat_url()}" onerror="this.src='upload/cat_blank.png'">
							
							</div>
							<div class="mycatCard_name">
								<p>${cc.getCat_name()}</p>
							</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>


		</c:otherwise>
	</c:choose>



	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
      var swiper = new Swiper(".mySwiper", {
        effect: "cards",
        grabCursor: true,
      });
    </script>


</body>
</html>