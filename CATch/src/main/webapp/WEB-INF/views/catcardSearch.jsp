<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="seqSearch.do" method="post">
		캣카드 번호로 찾기 <input type="text" name="cat_seq" placeholder="캣카드 고유번호를 입력해주세요" >
		<input type="submit" value="검색">
	</form>
	<form action="imgSearch.do" method="post">
		등록 비문으로 찾기 <input type="file" name="cat_nose">
		<input type="submit" value="검색">
	</form>
</body>
</html>