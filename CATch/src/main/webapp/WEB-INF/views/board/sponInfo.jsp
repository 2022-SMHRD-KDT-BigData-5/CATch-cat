<%@page import="com.smhrd.domain.Member"%>
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
	Member member = (Member)session.getAttribute("member");
	List<SponComment> sponCommentList = (List<SponComment>)request.getAttribute("sponCommentList");
	int spon_seq = (Integer)request.getAttribute("spon_seq");
	
%>
<h1>후원게시글 상세</h1>
<table>
<tr><td>글제목</td> <td><%=sponBoardInfo.getSpon_title() %></td></tr>
<tr><td>작성자</td> <td><%=sponBoardInfo.getSpon_id() %></td></tr>
<tr><td>작성일</td> <td><%=sponBoardInfo.getSpon_date()%></td></tr>
<tr><td>조회수</td> <td><%=sponBoardInfo.getSpon_cnt()%></td></tr>
<tr><td>작성내용</td> <td><%=sponBoardInfo.getSpon_content() %></td></tr>
<tr><td>이미지</td> <td><img src="upload/<%=sponBoardInfo.getSpon_sname()%>"></td></tr>

	<tr>
		<td colspan="2" align="center">
		<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 -->
		<%if(member.getMem_id().equals(sponBoardInfo.getSpon_id())){ %>
		<button onClick="location.href='sponUpdateForm.do?spon_seq=${spon_seq}'">수정</button>
		<button onClick="location.href='sponBoardDelete.do?spon_seq=${spon_seq}'">삭제</button>
		<%} %>
		<button onclick="location.href='spon.do'">목록</button>
		</td>
	</tr>
</table>

<h1>댓글작성란</h1>
<c:if test="${empty member }">
<p>로그인 후 댓글 작성이 가능합니다</p>
</c:if>
<c:if test="${! empty member }">
<form action="sponCommentInsert.do" method="post">
	<p>ID ${member.mem_id }</p>
	<input type="hidden" name="spon_seq" value="${spon_seq}">
	<input type="hidden" value="${member.mem_id }" name="cmt_id">
	<input type="text" name="cmt_content">
	<input type="submit" value="등록">
</form>
</c:if>
<h1>댓글출력란</h1>
<%for (SponComment sponComment : sponCommentList){ %>
<table border="1px solid black" >
<tr><td>댓글작성자</td> <td><%=sponComment.getCmt_id() %></td></tr>
<tr><td>댓글작성일</td> <td><%=sponComment.getCmt_date() %></td></tr>
<tr><td>댓글 내용</td> <td><%=sponComment.getCmt_content() %></td></tr>
		<%if(member.getMem_id().equals(sponComment.getCmt_id())){ %>
<tr>
		<td colspan="2" align="center">
		<button onClick="location.href='sponBoardCmtDelete.do?cmt_seq=<%=sponComment.getCmt_seq()%>&&spon_seq=<%=sponComment.getSpon_seq()%>'">삭제</button>
		</td>
	</tr>
		<%} %>
</table>
<%} %>
</body>
</html>