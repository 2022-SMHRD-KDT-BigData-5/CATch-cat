<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
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
<style>
		.form-horizontal .form-group {
    margin-right: 20.5%;
    margin-left: 18%;
}
.filebox{
	margin-left : 19.5%;
}
	</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include><br><br>
<section class="notice" style="
    padding-top: 50px;
    padding-bottom: 10px;">
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
            후원게시판
            <br>
            오직..
            <b>캣치에서만</b>
         </div>
      </div>
   </div>
</section>

	<div class="container"style="text-align: center">
  <form class="form-horizontal" action="adoptBoardInsert.do" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <div class="col-sm-10">
        <input type="text" class="form-control" style="width: 704px;height: 28px;" required placeholder=" 제 목" name="adt_title">
        <input type="hidden" id="writer" value="${member.mem_id }" name="adt_id">
      </div>
    </div>
    <div class="form-group">
 <div class="col-sm-10">
  <textarea class="form-control"placeholder=" 내 용"style="width: 704px;height: 400px;" rows="5" required name="adt_content"></textarea>
</div>
</div>
<div class="filebox" >
			<input type="file" style=" border:0 solid black;width: 704px;height: 28px;" name="adt_file", id="file" >
		</div>
    <div class="form-group">        
      <div>
      <button type="submit" class="btn btn-sm btn-success">등록하기</button>
		<button onclick="location.href='adopt.do'" class="btn btn-sm btn-info">목록으로</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>