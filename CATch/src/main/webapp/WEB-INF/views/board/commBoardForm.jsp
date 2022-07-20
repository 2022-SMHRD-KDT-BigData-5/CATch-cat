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
		<h2>소통게시글 작성</h2>
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
		<div class="filebox">
			파일 첨부 <input class='img_search' value="첨부파일" name=""> <label
				for="file"></label> <input type="file" id='file'> <input
				class='sinput' type="submit" value="등록">
		</div>
		<button type="submit">등록</button>

	</form>
</body>
</html>