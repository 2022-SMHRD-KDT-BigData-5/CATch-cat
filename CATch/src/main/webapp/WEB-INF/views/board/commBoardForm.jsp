<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- 게시판css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    
    <!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<br><br><div style="text-align: center;" >
	<form action="commBoardInsert.do" method="post">
		<h3>소통게시글 작성</h3><br>
		<div>
			<input type="text" required placeholder="   제목" style="border:0 solid black;width: 704px;height: 28px;" id="title" name="article_title">
		</div>
		<div>
			<input type="hidden" id="writer" value="${member.mem_id }" name="article_id">
		</div><br>
		<div>
			
			<textarea name="article_content"placeholder="   내용"style="border: 0px solid black;width: 704px;height: 400px;" required id="content"></textarea>
		</div><br>
		<div class="filebox" >
			<input type="file" style=" border:0 solid black;width: 704px;height: 28px;"id='file'style="text-align: center;">
		</div>
		<button type="submit" class="btn btn-sm btn-success">등록하기</button>
		<button onclick="location.href='comm.do'" class="btn btn-sm btn-info">목록으로</button>

	</form>
	</div>
</body>
</html>