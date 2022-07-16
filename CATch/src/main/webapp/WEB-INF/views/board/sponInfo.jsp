<%@page import="com.smhrd.domain.SponComment"%>
<%@page import="com.smhrd.domain.SponBoard"%>
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
	SponBoard sponBoardInfo = (SponBoard)request.getAttribute("sponInfo");

	List<SponComment> sponCommentList = (List<SponComment>)request.getAttribute("sponCommentList");
	int spon_seq = (Integer)request.getAttribute("spon_seq");
	
%>
<h1>게시글 출력란</h1>
<table>
<tr><td>글제목</td> <td><%=sponBoardInfo.getSpon_title() %></td></tr>
<tr><td>작성자</td> <td><%=sponBoardInfo.getSpon_id() %></td></tr>
<tr><td>작성일</td> <td><%=sponBoardInfo.getSpon_date()%></td></tr>
<tr><td>작성내용</td> <td><%=sponBoardInfo.getSpon_content() %></td></tr>

	<tr>
		<td colspan="2" align="center">
		<button>수정</button>
		<!-- 자신이 작성한 글에만 삭제버튼 출력 -->
		<button>삭제</button>
		<button>목록</button>
		</td>
	</tr>
</table>

<h1>댓글작성란</h1>
<c:if test="${empty member }">
<p>로그인 후 댓글 작성이 가능합니다</p>
</c:if>
<c:if test="${! empty member }">
<form action="commentInsert.do">
	<p>ID ${member.mem_id }</p>
	<input type="text" name="comment">
	<input type="submit" value="등록">
</form>
</c:if>
<h1>댓글출력란</h1>
<%for (SponComment sponComment : sponCommentList){ %>
<table border="1px solid black" >
<tr><td>댓글작성자</td> <td><%=sponComment.getCmt_id() %></td></tr>
<tr><td>댓글작성일</td> <td><%=sponComment.getCmt_date() %></td></tr>
<tr><td>댓글 내용</td> <td><%=sponComment.getCmt_content() %></td></tr>
</table>
<%} %>

</body>
</html>