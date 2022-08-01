<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.AdoptComment"%>
<%@page import="com.smhrd.domain.AdoptBoard"%>
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
<title>입양 게시판 댓글😊</title>

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

pre {
    background-color: #ffffff !important;
    border: 1px solid #ffffff !important;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<%
	AdoptBoard adoptBoardInfo = (AdoptBoard) request.getAttribute("adoptInfo");
	Member member = (Member) session.getAttribute("member");
	List<AdoptComment> adoptCommentList = (List<AdoptComment>) request.getAttribute("adoptCommentList");
	int adt_seq = (Integer) request.getAttribute("adt_seq");
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
					<td>입양게시판</td>
					<th scope="row">조회수</th>
					<td><%=adoptBoardInfo.getAdt_cnt()%></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><%=adoptBoardInfo.getAdt_id()%></td>
					<th scope="row">작성일</th>
					<td><%=adoptBoardInfo.getAdt_date().getYear()-100%>년 <%=adoptBoardInfo.getAdt_date().getMonth()+1%>월 <%=adoptBoardInfo.getAdt_date().getDate()%>일</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><%=adoptBoardInfo.getAdt_title()%></td>
				</tr>
				<%
					if (adoptBoardInfo.getAdt_sname() != null) {
				%>
				<td colspan="4" class="view_text"><img
					src="upload/<%=adoptBoardInfo.getAdt_sname()%>"></td>
				<%
					}
				%>
				<tr style="height: 200px;">
					<td colspan="4"><pre><%=adoptBoardInfo.getAdt_content()%></pre></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 --> <%
 	if (member.getMem_id().equals(adoptBoardInfo.getAdt_id())) {
 %>
						<button class="updatebtn"
							onClick="location.href='adoptUpdateForm.do?adt_seq=${adt_seq}'">수정</button>
						<button class="deletebtn"
							onClick="location.href='adoptBoardDelete.do?adt_seq=${adt_seq}'">삭제</button>
						<%
							}
						%>
						<button class="listbtn" onclick="location.href='adopt.do'">목록</button>
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
				<form action="adoptCommentInsert.do"
					style="width: 90%; margin: auto;" method="post">
					<input type="hidden" value="${member.mem_id }" name="cmt_id">
					<input type="hidden" name="adt_seq" value="${adt_seq}">

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
					for (AdoptComment adoptComment : adoptCommentList) {
				%>
				<table class="table table-striped"
					style="text-align: left; border: 1px solid #dddddd">

					<tr>
						<td style="height: 20px;">ID : <%=adoptComment.getCmt_id()%></td>
						<td style="height: 20px;"><%=adoptComment.getCmt_date()%></td>
						<%
							if (member.getMem_id().equals(adoptComment.getCmt_id())) {
						%>
						<td align="center" style="height: 20px;">
							<button
								style="background-color: #7D7F82; border: 4px solid #7D7F82; color: #fff;"
								onClick="location.href='adoptBoardCmtDelete.do?cmt_seq=<%=adoptComment.getCmt_seq()%>&&adt_seq=<%=adoptComment.getAdt_seq()%>'">삭제</button>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td colspan='3' style="height: 80px; text-align: left;"><pre><%=adoptComment.getCmt_content()%></pre></td>
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