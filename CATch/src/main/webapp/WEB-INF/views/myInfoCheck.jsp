<%@page import="com.smhrd.domain.Member"%>
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
 	Member member = (Member)session.getAttribute("member");%>
<h1>회원정보 확인을 위해 회원님의 계좌와 계좌비밀번호를 입력해주세요</h1>
<form action="myInfo.do" method="post">
	<input type="hidden" name="mem_id" value=<%=member.getMem_id() %>>
	<input type="password" name="mem_pw">
	<input type="submit" value="입력">
</form>

</body>
</html>
