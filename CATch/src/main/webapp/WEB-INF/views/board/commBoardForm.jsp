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
<style>
        table.table2 {
	                border-collapse:  separate;
	                border-spacing:  1px;
	                text-align:  left;
	                line-height:  1.5;
	                border-top:  1px solid  #ccc;
	                margin :  20px 10px;
	        
}

        table.table2 tr  {
	                 width:  50px;
	                 padding:  10px;
	                font-weight:  bold;
	                vertical-align:  top;
	                border-bottom:  1px solid  #ccc;
	        
}

        table.table2 td  {
	                 width:  100px;
	                 padding:  10px;
	                 vertical-align:  top;
	                 border-bottom:  1px solid  #ccc;
	        
}
 
</style>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
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
				for="file"></label> <input type="file" id='file'>
		</div>
		<button type="submit">등록하기</button>

		<table style="padding-top: 50px"
			 align = center width=700 border=0 cellpadding=2 >
			                
			<tr>
				                
				<td  height=20 align= center bgcolor=#ccc><font  color=white> 소통게시글 작성</font></td>                
			</tr>
			                
			<tr>
				                
				<td  bgcolor=white>                
					<table  class = "table2">
						                
						<tr>
							                        
							<td>제목</td>                        
							<td><input type = "text" id="title" name ="article_title" size=60></td>                        
						</tr>
						 <input type="hidden" id="writer" value="${member.mem_id }" name="article_id">
						<tr>
							                        
							<td>내용</td>                        
							<td><textarea "article_content" id="content" cols=85 rows=15></textarea></td>                        
						</tr>
						                  
					</table>                         
					<center>
					<input  type =  "submit" value="작성하기">                        
					</center>                
				</td>                
			</tr>
			        
		</table>


	</form>
</body>
</html>