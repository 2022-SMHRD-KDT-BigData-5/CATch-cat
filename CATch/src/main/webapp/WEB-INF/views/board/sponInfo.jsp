<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.SponComment"%>
<%@page import="com.smhrd.domain.SponBoard"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="css/board.css">
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
<style>
.board_detail {
	width: 90%;
	border-top: 2px solid #0e5c24;
	border-bottom: 2px solid #fff;
	border-collapse: collapse;
	margin: auto;
}

.updatebtn {
	background-color: #6c757d;
	color: #fff;
	border: solid #6c757d;
}

.deletebtn {
	background-color: #006400;
	color: #fff;
	border: solid #006400;
}

.listbtn {
	background-color: #6c757d;
	color: #fff;
	border: solid #6c757d;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<%
	SponBoard sponBoardInfo = (SponBoard) request.getAttribute("sponInfo");
	Member member = (Member) session.getAttribute("member");
	List<SponComment> sponCommentList = (List<SponComment>) request.getAttribute("sponCommentList");
	int spon_seq = (Integer) request.getAttribute("spon_seq");
	%>


	<!-- 상세페이지 시작 -->

	<div class="container">
		<br> <br>
		<table class="board_detail">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세내용</caption>
			<tbody>
				<tr>
					<th scope="row">카테고리</th>
					<td>후원게시판</td>
					<th scope="row">조회수</th>
					<td><%=sponBoardInfo.getSpon_cnt()%></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><%=sponBoardInfo.getSpon_id()%></td>
					<th scope="row">작성일</th>
					<td><%=sponBoardInfo.getSpon_date()%></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><%=sponBoardInfo.getSpon_title()%></td>
				</tr>
				<%
					if (sponBoardInfo.getSpon_sname() != null) {
				%>
				<td colspan="4" class="view_text"><img
					src="upload/<%=sponBoardInfo.getSpon_sname()%>"></td>
				<%
					}
				%>
				<tr style="height: 200px;">
					<td colspan="4"><%=sponBoardInfo.getSpon_content()%></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 --> <%
 	if (member.getMem_id().equals(sponBoardInfo.getSpon_id())) {
 %>
						<button class="updatebtn"
							onClick="location.href='sponUpdateForm.do?spon_seq=${spon_seq}'">수정</button>
						<button class="deletebtn"
							onClick="location.href='sponBoardDelete.do?spon_seq=${spon_seq}'">삭제</button>
						<%
							}
						%>
						<button class="listbtn" onclick="location.href='spon.do'">목록</button>
					</td>
				</tr>
		</table>
		<br> <br>

		<c:if test="${empty member }">
			<p>로그인 후 댓글 작성이 가능합니다</p>
		</c:if>
		<div class="container">
			<label for="content" style="margin-left: 5%;">comment</label>
			<c:if test="${! empty member }">
				<form action="sponCommentInsert.do"
					style="width: 90%; margin: auto;" method="post">
					<input type="hidden" value="${member.mem_id }" name="cmt_id">
					<input type="hidden" name="spon_seq" value="${spon_seq}">

					<div style="display: inline-block">
						<input type="text" class="form-control" id="content"
							name="cmt_content" style="height: 100px; width: 880px;"
							placeholder="댓글을 입력해주세요.">
					</div>
					<div style="float: right;">
						<button class="btn btn-default" style="background-color: #006400;margin-top: 25px;"
							type="submit" name="commentInsertBtn">등록</button>
					</div>

				</form>
			</c:if>
		</div>
		<br> <br>
		<div class="container">
			<div class="row" style="width: 90%; margin: auto;">
				<%
					for (SponComment sponComment : sponCommentList) {
				%>
				<table class="table table-striped"
					style="text-align: left; border: 1px solid #dddddd">

					<tr>
						<td style="height: 20px;">ID : <%=sponComment.getCmt_id()%></td>
						<td style="height: 20px;"><%=sponComment.getCmt_date()%></td>
						<%
							if (member.getMem_id().equals(sponComment.getCmt_id())) {
						%>
						<td align="center" style="height: 20px;">
							<button
								style="background-color: #7D7F82; border: 4px solid #7D7F82; color: #fff;"
								onClick="location.href='sponBoardCmtDelete.do?cmt_seq=<%=sponComment.getCmt_seq()%>&&spon_seq=<%=sponComment.getSpon_seq()%>'">삭제</button>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td colspan='3' style="height: 80px; text-align: left;"><%=sponComment.getCmt_content()%></td>
					</tr>
				</table>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>