<%@page import="com.smhrd.domain.CommComment"%>
<%@page import="com.smhrd.domain.CommBoard"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% 
	CommBoard commBoardInfo = (CommBoard)request.getAttribute("commInfo");

	List<CommComment> commCommentList = (List<CommComment>)request.getAttribute("commCommentList");
	int article_seq = (Integer)request.getAttribute("article_seq");
	
%>
<h1>소통게시글 상세</h1>
<table>
<tr><td>글제목</td> <td><%=commBoardInfo.getArticle_title() %></td></tr>
<tr><td>작성자</td> <td><%=commBoardInfo.getArticle_id() %></td></tr>
<tr><td>작성일</td> <td><%=commBoardInfo.getArticle_date()%></td></tr>
<tr><td>작성내용</td> <td><%=commBoardInfo.getArticle_content() %></td></tr>

	<tr>
		<td colspan="2" align="center">
		<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 -->
		<button onClick="location.href='commUpdateForm.do?article_seq=${article_seq}'">수정</button>
		<button onClick="location.href='commBoardDelete.do?article_seq=${article_seq}'">삭제</button>
		<button onclick="location.href='comm.do'">목록</button>
		</td>
	</tr>
</table>

<h1>댓글작성란</h1>
<c:if test="${empty member }">
<p>로그인 후 댓글 작성이 가능합니다</p>
</c:if>
<c:if test="${! empty member }">
<form action="commCommentInsert.do"  method="post">
	<p>ID ${member.mem_id }</p>
	<input type="hidden" name="article_seq" value="${article_seq}">
	<input type="hidden" value="${member.mem_id }" name="cmt_id">
	<input type="text" name="cmt_content">
	<input type="submit" value="등록">
</form>
</c:if>
<h1>댓글출력란</h1>
<%for (CommComment commComment : commCommentList){ %>
<table border="1px solid black" >
<tr><td>댓글작성자</td> <td><%=commComment.getCmt_id() %></td></tr>
<tr><td>댓글작성일</td> <td><%=commComment.getCmt_date() %></td></tr>
<tr><td>댓글 내용</td> <td><%=commComment.getCmt_content() %></td></tr>
</table>
<%} %>
</body>
</html>