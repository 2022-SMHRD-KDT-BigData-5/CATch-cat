<%@page import="com.smhrd.domain.PetcareAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체용 관리 페이지</title>
</head>

<!-- 게시판css -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/boardtest.css">
<body>

	<%
		Member member = (Member)session.getAttribute("member");
		List<PetcareAdmin> petcareAdmin = (List<PetcareAdmin>)session.getAttribute("petcareAdmin");

	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="admin_head">
		<h1 class="a_title">관리자 페이지</h1>
		<p>내가 등록한 캣카드 조회하는 페이지 입니다.</p>
	</div>

	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>캣카드번호</th>
					<th>상호명</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			<tbody>
			<tr>
				<td>10238</td>
				<td>코코호텔</td>
				<td>이발함</td>
				<td>1886년 12월24일</td>
				</tr>
			<c:forEach items="${petcareAdmin}" var="pa">
				<tr>
				<td>${pa.getAdmin_catcard()}</td>
				<td>${pa.getAdmin_name()}</td>
				<td>${pa.getAdmin_content()}</td>
				<td>${pa.getAdmin_date()}</td>
				</tr>
			</c:forEach>
			

			</tbody>
		</table>
		<button onclick="location.href"></button>
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
</body>
</html>