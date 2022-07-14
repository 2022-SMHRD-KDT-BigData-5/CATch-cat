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
	int adt_seq = (Integer)request.getAttribute("adt_seq");
%>
<h1>글제목 : <%=adoptBoardInfo.getAdt_title() %></h1>
<h5>작성자 : <%=adoptBoardInfo.getAdt_id() %></h5>
<h5>작성일 : <%=adoptBoardInfo.getAdt_date()%></h5>
<h3>작성내용 : <%=adoptBoardInfo.getAdt_content() %></h3>



<h1>댓글출력+작성란</h1>

</body>
</html>