<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="commBoardInsert.do" method="post">
		<h2>집사님들~ 소통해요</h2>
		<div>
			제목<input type="text" id="title" name="article_title">
		</div>
		<div>
			<input type="hidden" id="writer" value="${member.mem_id }" name="article_id">
		</div>
		<div>
			내용
			<textarea name="article_content" id="content"></textarea>
		</div>
		<button type="submit">등록</button>

	</form>
</body>
</html>