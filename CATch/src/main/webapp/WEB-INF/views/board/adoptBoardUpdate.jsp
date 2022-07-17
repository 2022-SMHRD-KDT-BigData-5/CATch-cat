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
	<form action="adoptBoardUpdate.do?adt_seq=${AdoptBoard.adt_seq }" method="post">
		<h2>입양게시글 수정</h2>
		<div>
			제목<input type="text" id="title" value="${AdoptBoard.adt_title }" name="adt_title">
		</div>
		<div>
			<input type="hidden" id="writer" value="${member.mem_id }" name="adt_id">
		</div>
		<div>
			내용
			<textarea name="adt_content" id="content">${AdoptBoard.adt_content}</textarea>
		</div>
		<button type="submit">등록</button>

	</form>
</body>
</html>