<%@page import="com.smhrd.domain.AdoptComment"%>
<%@page import="com.smhrd.domain.AdoptBoard"%>
<%@page import="java.util.List"%>
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
	List<AdoptComment> adoptCommentList = (List<AdoptComment>)request.getAttribute("adoptCommentList");
	int adt_seq = (Integer)request.getAttribute("adt_seq");
	
%>
<table>
<tr><td>글제목</td> <td><%=adoptBoardInfo.getAdt_title() %></td></tr>
<tr><td>작성자</td> <td><%=adoptBoardInfo.getAdt_id() %></td></tr>
<tr><td>작성일</td> <td><%=adoptBoardInfo.getAdt_date()%></td></tr>
<tr><td>작성내용</td> <td><%=adoptBoardInfo.getAdt_content() %></td></tr>

	<tr>
		<td colspan="2" align="center">
		<button>수정</button>
		<button>삭제</button>
		<button>목록</button>
		</td>
	</tr>
</table>

<h1>댓글출력+작성란</h1>

<%for (AdoptComment adoptComment : adoptCommentList){ %>
<h3>댓글작성자 : <%=adoptComment.getCmt_id() %></h3>
<table>
<tr><td>댓글작성일</td> <td><%=adoptComment.getCmt_date() %></td></tr>
<tr><td>댓글 내용</td> <td><%=adoptComment.getCmt_content() %></td></tr>
</table>
<%} %>

</body>
</html>