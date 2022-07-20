<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.AdoptBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<!-- 게시판css -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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


<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
	%>
	<jsp:include page="../header.jsp"></jsp:include>

	<!--------------------------  게시판 시작 ---------------------------------->
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3 class="heading-primary elementor-heading-title">
					<b>캣치</b> 에서 <b>게시판에</b> 글을 남겨보자
				</h3>
			</div>
			<div class="heading-description-wrap">
				<div class="heading-description">
					입양게시판 <br> 오직.. <b>캣치에서만</b>
				</div>
			</div>
		</div>
	</section>

	<!-- 검색 -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="#" method="get">
					<fieldset>
						<legend class="hidden">입양게시판 검색필드</legend>
						<label class="hidden">검색분류</label>
						<select name="field">
							<option ${(param.field =="adt_title")?"selected":""} value="adt_title">제목</option>
							<option ${(param.field =="adt_content")?"selected":""} value="adt_content">내용</option>
							<option ${(param.field =="adt_id")?"selected":""} value="adt_id">작성자</option>
						</select>
						<label class="hidden">검색어</label>
						<input type="text" name="query" value="${param.query }"/>
						<input type="submit" value="조회">
					</fieldset>
				</form>


			</div>
		</div>
	</div>


	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<p>
					<a href="comm.do">소통게시판</a>
				</p>
				<p>
					<a href="adopt.do">입양게시판</a>
				</p>
				<p>
					<a href="spon.do">후원게시판</a>
				</p>
			</div>
			<div class="col-sm-8 text-left">

				<div class="table-responsive">
					<%
						List<AdoptBoard> adoptList = (List<AdoptBoard>) request.getAttribute("adoptList");
					%>
					<table class="table">
						<thead>
							<tr>
								<th>글번호</th>
								<th>작성자</th>
								<th>글제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>

							<%
								for (AdoptBoard adoptBoard : adoptList) {
							%>
							<tr>
								<td><%=adoptList.indexOf(adoptBoard) + 1%></td>
								<td><%=adoptBoard.getAdt_id()%></td>
								<td><a
									href="adtinfo.do?adt_seq=<%=adoptBoard.getAdt_seq()%>"><%=adoptBoard.getAdt_title()%></a></td>
								<td><%=adoptBoard.getAdt_date()%></td>
								<td><%=adoptBoard.getAdt_cnt()%></td>
								<%
									if (member != null) {
									if (member.getMem_id().equals(adoptBoard.getAdt_id())) {
								%>
								<td><a
									href="adoptBoardDelete.do?adt_seq=<%=adoptBoard.getAdt_seq()%>">삭제</a>
								<td>
									<%
										} else {
									%>
								
								<td>
								<td>
									<%
										}
									} //if문 두개 끝
									%>
								
							</tr>
							<%
								} //for문 끝
							%>

						</tbody>

					</table>
					<button onclick="location.href='adoptBoardInsert.do'"
						class="btn btn-sm btn-success">글쓰기</button>
				</div>
			</div>




			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		  <div>
  <a href="#">&laquo;</a>
  <a href="#" >1</a>
  <a href="#" >2</a>
  <a href="#">3</a>
  <a href="#" >4</a>
  <a href="#" >5</a>
  <a href="#" >6</a>
  <a href="#" >7</a>
  <a href="#">8</a>
  <a href="#" >9</a>
  <a href="#">10</a>
  <a href="#">&raquo;</a>
</div>
	</footer>
	<!--------------------------  게시판 끝 ---------------------------------->

</body>
</html>