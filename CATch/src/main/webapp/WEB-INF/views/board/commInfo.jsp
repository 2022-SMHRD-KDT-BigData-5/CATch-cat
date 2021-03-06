<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.CommComment"%>
<%@page import="com.smhrd.domain.CommBoard"%>
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
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<%
      CommBoard commBoardInfo = (CommBoard) request.getAttribute("commInfo");
   Member member = (Member) session.getAttribute("member");
   List<CommComment> commCommentList = (List<CommComment>) request.getAttribute("commCommentList");
   int article_seq = (Integer) request.getAttribute("article_seq");
   %>


	<!-- 상세페이지 시작 -->

	<div class="container">
		<h2>소통게시글 상세</h2>
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
					<th scope="row">글 번호</th>
					<td><%=commBoardInfo.getArticle_seq()%></td>
					<th scope="row">조회수</th>
					<td><%=commBoardInfo.getArticle_cnt()%></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><%=commBoardInfo.getArticle_id()%></td>
					<th scope="row">작성일</th>
					<td><%=commBoardInfo.getArticle_date()%></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><%=commBoardInfo.getArticle_title() %></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><%=commBoardInfo.getArticle_content()%>
					</td>
				</tr>

				<tr>
					<td>이미지</td>
					<td><img src="upload/<%=commBoardInfo.getArticle_sname()%>"></td>
				</tr>


				<tr>
					<td colspan="4" class="view_text"><textarea title="내용"
							id="content" name="content"
							th:text=<%=commBoardInfo.getArticle_content()%>>
               </textarea></td>
				</tr>

				<tr>



					<td colspan="2" align="center">
						<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 --> 
						<% if (member.getMem_id().equals(commBoardInfo.getArticle_id())) { %>
						<button
							onClick="location.href='commUpdateForm.do?article_seq=${article_seq}'">수정</button>
						<button
							onClick="location.href='commBoardDelete.do?article_seq=${article_seq}'">삭제</button>
						<% } %>
						<button onclick="location.href='comm.do'">목록</button>
					</td>
				</tr>
		</table>
		<br> <br>

		<c:if test="${empty member }">
			<p>로그인 후 댓글 작성이 가능합니다</p>
		</c:if>
		<div class="container">
			<label for="content">comment</label>
			<c:if test="${! empty member }">
				<form action="commCommentInsert.do" method="post">
					<div class="input-group">
						
						<input type="hidden" name="cmt_id" value="${article_id}">>
						<input type="text" class="form-control" id="content" name="cmt_content" placeholder="내용을 입력해주세요."> 
						<input type="hidden" name="article_seq" value="${article_seq}">>
							<span class="input-group-btn"> <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button> </span>
					</div>
				</form>
			</c:if>
		</div>




		<br> <br>

		<h2>댓글 목록</h2>
		<div class="container">
			<div class="row">
				<%
               for (CommComment commComment : commCommentList) {
               %>
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeeee; text-align: left;">ㅇㅇ</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">작성자</td>
							<td><%=commComment.getCmt_id()%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td><%=commComment.getCmt_date()%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td style="min-height: 200px; text-align: left;"><%=commComment.getCmt_content()%></td>
						</tr>
					</tbody>
				</table>



				<table border="1px solid black">

					<%  if (member.getMem_id().equals(commComment.getCmt_id())) {  %>
					<tr>
						<td colspan="2" align="center">
							<button onClick="location.href='commBoardCmtDelete.do?cmt_seq=<%=commComment.getCmt_seq()%>&&article_seq=<%=commComment.getArticle_seq()%>'">삭제</button>
						</td>
					</tr>
					<%} %>
					</tbody>
				</table>
				<%} %>
			</div>
		</div>
	</div>
</body>
</html>