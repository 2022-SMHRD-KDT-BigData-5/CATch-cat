<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="commBoardUpdate.do?article_seq=${CommBoard.article_seq }" method="post">
		<h2>소통게시글 수정</h2>
		<div>
			제목<input type="text" id="title" value="${CommBoard.article_title }" name="article_title">
		</div>
		<div>
			<input type="hidden" id="writer" value="${member.mem_id }" name="article_id">
		</div>
		<div>
			내용
			<textarea name="article_content" id="content">${CommBoard.article_content}</textarea>
		</div>
		<button type="submit">등록</button>

	</form>
</body>
</html>