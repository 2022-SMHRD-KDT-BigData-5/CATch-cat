<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.SponBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<SponBoard> sponList = (List<SponBoard>) request.getAttribute("sponList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">




<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/boardtest.css">
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
<div class="board_head">
	<h1 class = 'h_title'>후원게시판</h1>
	<p>고양이들을 후원해주세요~</p>
	</div>
<!-- 	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3 class="heading-primary elementor-heading-title">
					<b>캣치</b> 에서<b>게시판에</b> 글을 남겨보자
				</h3>
			</div>
			<div class="heading-description-wrap">
				<div class="heading-description">
					 <br> 오직..<b>캣치에서만</b>

					<div class="col-sm-2 sidenav"></div>
				</div>
			</div>
		</div>
	</section>
 -->


	<div class="container-fluid text-center">
		<div class="row content">
			<p>
				<a href="comm.do"><img src="upload/green_cat.png"> 소통게시판   </a> 
				<a href="adopt.do"><img src="upload/green_cat.png"> 입양게시판   </a> 
				<a href="spon.do"><img src="upload/green_cat.png"> 후원게시판   </a>
			</p>
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">


				<div class="table-responsive">



					<table class="table" class="table table-hover"
						class="table-responsive">
						<thead class="table-light">
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">작성자</th>
								<th scope="col">글제목</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (SponBoard sponBoard : sponList) {
							%>
							<tr>
								<td><%=sponList.indexOf(sponBoard) + 1%></td>
								<td><%=sponBoard.getSpon_id()%></td>
								<td><a
									href="sponinfo.do?spon_seq=<%=sponBoard.getSpon_seq()%>"><%=sponBoard.getSpon_title()%></a></td>
								<td><%=sponBoard.getSpon_date()%></td>
								<td><%=sponBoard.getSpon_cnt()%></td>
								<%
									if (member != null) {
									if (member.getMem_id().equals(sponBoard.getSpon_id())) {
								%>
								<td><a
									href="sponBoardDelete.do?spon_seq=<%=sponBoard.getSpon_seq()%>">삭제</a></td>
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


					<button onclick="location.href='sponBoardInsert.do'"
						class="btn btn-sm btn-success">글쓰기</button>
				</div>
			</div>


			<div class="col-sm-2 sidenav">
				<img src="upload/cat_icon2.png">
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<div>
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
			</ul>
		</div>
	</footer>
	<!--------------------------  게시판 끝 ---------------------------------->

</body>
</html>