<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.CommBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<!-- 게시판css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/boardtest.css">
    <!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    
</head>
<body>
<% Member member = (Member)session.getAttribute("member");%>
<jsp:include page="../header.jsp"></jsp:include>

	<!--------------------------  게시판 시작 ---------------------------------->


	<div class="board_head">
	<h1 class = 'h_title'>소통게시판</h1>
	<p>집사들간의 정보공유와 소통을 하는 게시판입니다~</p>
	</div>

<!-- <section class="notice">
   <div class="page-title">
      <div class="container">
         <h3 class="heading-primary elementor-heading-title">
            <b>캣치</b>
            에서
            <b>게시판에</b>
            글을 남겨보자
         </h3>
      </div>
      <div class="heading-description-wrap">
         <div class="heading-description">
            소통게시판
            <br>
            오직..
            <b>캣치에서만</b>
            <div class="col-sm-2 sidenav"></div>
         </div>
      </div>
   </div>
</section> -->

<!-- 검색 -->
	<%-- <div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="#" method="get">
					<fieldset>
						<legend class="hidden">소통게시판 검색필드</legend>
						<label class="hidden">검색분류</label>
						<select name="field">
							<option ${(param.field =="adt_title")?"selected":""} value="adt_title">제목</option>
							<option ${(param.field =="adt_content")?"selected":""} value="adt_content">내용</option>
							<option ${(param.field =="adt_id")?"selected":""} value="adt_id">작성자</option>
						</select>
						<label class="hidden">검색어</label>
						<input type="text" name="query" value="${param.query }"/>
						<input type="submit" value="조회">
					</fieldset>
				</form>


			</div>
		</div>
	</div> --%>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <p>
				<a href="comm.do"><img src="upload/green_cat.png"> 소통게시판   </a> 
				<a href="adopt.do"><img src="upload/green_cat.png"> 입양게시판   </a> 
				<a href="petcare.do"><img src="upload/green_cat.png"> 펫케어   </a>
			</p>
			<div class="col-sm-2 sidenav"></div>
    <div class="col-sm-8 text-left"> 

 
  <div class="table-responsive">  
  <% List<CommBoard> commList = (List<CommBoard>)request.getAttribute("commList"); %>        
  <table class="table">
    <thead>
      <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>글제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      
      <% for(CommBoard commBoard : commList){ %>
       <tr>
        <td><%=commList.indexOf(commBoard)+1 %></td>
        <td><%=commBoard.getArticle_id() %></td>
        <td><a href="comminfo.do?article_seq=<%=commBoard.getArticle_seq()%>"><%=commBoard.getArticle_title() %></a></td>
        <td><%=commBoard.getArticle_date().getYear()-100%>년 <%=commBoard.getArticle_date().getMonth()+1%>월 <%=commBoard.getArticle_date().getDate()%>일</td>
        <td><%=commBoard.getArticle_cnt() %></td>
        <%if(member!=null){
        	if(member.getMem_id().equals(commBoard.getArticle_id())){ %>
        	<td><a href="commBoardDelete.do?article_seq=<%=commBoard.getArticle_seq()%>">삭제</a><td>
			<%}else{ %>
        	<td><td>
       	<%}} //if문 두개 끝%>
      </tr>
      <%} //for문 끝 %>
    </tbody>
    
  </table>
  <button onclick="location.href='commBoardInsert.do'" class="btn btn-sm btn-success">글쓰기</button>
  </div>
</div>




    <div class="col-sm-2 sidenav">
      <img src="upload/cat_icon2.png">
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
		<div>
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
			</ul>
		</div>
	</footer>
<!--------------------------  게시판 끝 ---------------------------------->

</body>
</html>