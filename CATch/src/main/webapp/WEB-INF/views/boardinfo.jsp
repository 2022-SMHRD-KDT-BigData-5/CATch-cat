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
	List<AdoptBoard> adoptList = (List<AdoptBoard>)request.getAttribute("adoptList");
	int adopt_seq = (Integer)request.getAttribute("adopt_seq");
%>
<h1><%=adopt_seq %>제목 출력</h1>
<h5>작성자</h5>
<h5>작성일</h5>
<h3>내용 출력</h3>



<h1>댓글출력+작성란</h1>

</body>
</html>