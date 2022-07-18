<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.AdoptComment"%>
<%@page import="com.smhrd.domain.AdoptBoard"%>
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
	AdoptBoard adoptBoardInfo = (AdoptBoard)request.getAttribute("adoptInfo");
	int adt_seq = (Integer)request.getAttribute("adt_seq");
	Member member = (Member)session.getAttribute("member");
	List<AdoptComment> adoptCommentList = (List<AdoptComment>)request.getAttribute("adoptCommentList");
	int cmt_seq = (Integer)request.getAttribute("cmt_seq");
	
%>
<h1>입양 게시글 상세</h1>
<table>
<tr><td>글제목</td> <td><%=adoptBoardInfo.getAdt_title() %></td></tr>
<tr><td>작성자</td> <td><%=adoptBoardInfo.getAdt_id() %></td></tr>
<tr><td>작성일</td> <td><%=adoptBoardInfo.getAdt_date()%></td></tr>
<tr><td>작성내용</td> <td><%=adoptBoardInfo.getAdt_content() %></td></tr>

	<tr>
		<td colspan="2" align="center">
		<!-- 자신이 작성한 글에만 수정/삭제버튼 출력 -->
		<%if(member.getMem_id().equals(adoptBoardInfo.getAdt_id())){ %>
		<button onClick="location.href='adoptUpdateForm.do?adt_seq=${adt_seq}'">수정</button>
		<button onClick="location.href='adoptBoardDelete.do?adt_seq=${adt_seq}'">삭제</button>
		<%} %>
		<button onclick="location.href='adopt.do'">목록</button>
		</td>
	</tr>
</table>

<h1>댓글작성란</h1>
<c:if test="${empty member }">
<p>로그인 후 댓글 작성이 가능합니다</p>
</c:if>
<c:if test="${! empty member }">
<form action="adoptCommentInsert.do"  method="post">
	<p>ID ${member.mem_id }</p>
	<input type="hidden" name="adt_seq" value="${adt_seq}">
	<input type="hidden" value="${member.mem_id }" name="cmt_id">
	<input type="text" name="cmt_content">
	<input type="submit" value="등록">
</form>
</c:if>
<h1>댓글출력란</h1>
<%for (AdoptComment adoptComment : adoptCommentList){ %>
<table border="1px solid black" >
<tr><td>댓글작성자</td> <td><%=adoptComment.getCmt_id() %></td></tr>
<tr><td>댓글작성일</td> <td><%=adoptComment.getCmt_date() %></td></tr>
<tr><td>댓글 내용</td> <td><%=adoptComment.getCmt_content() %></td></tr>
		<%if(member.getMem_id().equals(adoptComment.getCmt_id())){ %>
<tr>
		<td colspan="2" align="center">
		<button onClick="location.href='adoptBoardCmtDelete.do?cmt_seq=<%=adoptComment.getCmt_seq()%>&&adt_seq=<%=adoptComment.getAdt_seq()%>'">삭제</button>
		</td>
	</tr>
		<%} %>
</table>
<%} %>
</body>
</html>