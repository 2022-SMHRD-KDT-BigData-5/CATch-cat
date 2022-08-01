<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>캣카드 등록 조회🔍</title>

<meta name="description" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/myCat.css">
<link rel="stylesheet" href="css/catSearch.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

</head>
<body>
<div class="loading"></div>


<jsp:include page="header.jsp"></jsp:include>
<div class="search-head">

<h1 class = 'h_title'>캣카드 등록</h1>

    <p class="title_p">코주름이 뚜렷한 사진을 촬영하거나 첨부해주세요</p>

	<div id='search_body'>
		<img src="img/Canon.png" id="preview" style="width: 250px; height: 250px">
	</div>


	<form action="http://localhost:5000/fileUploader" method="post" enctype="multipart/form-data">
		<div class="filebox">
			<div>사진 첨부 하기</div>
			<input class='img_search' value="첨부파일" name="cat_nose"> 
			<label for="file">업로드 
			<input type="file" name="file" id='file'> </label>
			<input class='sinput' type="submit" value="등록">
		</div>
	</form>
</div>

	<script>
	
	$("#file").on("change", function(event) {

	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	
	$("#file").on('change',function(){
	var fileName = $("#file").val();
	$(".img_search").val(fileName);
	});
</script>

</body>
</html>