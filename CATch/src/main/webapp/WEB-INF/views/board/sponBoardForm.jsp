<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sponBoardInsert.do" method="post">
		<h2>후원글 작성</h2>
		<div>
			제목<input type="text" id="title" name="spon_title">
		</div>
		<div>
			<input type="hidden" id="writer" value="${member.mem_id }" name="spon_id">
		</div>
		<div>
			내용
			<textarea name="spon_content" id="content"></textarea>
		</div>
		<button type="submit">등록</button>

	</form>
</body>
</html>