<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" >
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Insert title here</title>

	<link rel="stylesheet" href="css/catcardloding.css">
	
    <link rel="stylesheet" href="css/myCat.css">
    
    <style>
    	.h_title{
    		 position: absolute;
    		 margin-left : 150px;
    		 
    	}
    	body{
    	text-align : center;
    	margin : 0px;
    	}
    </style>
    
</head>
<body>

	 

	<h1 class = 'h_title'>비문이 일치하는 고양이를 조회중입니다...</h1>
	<div id="load">
<<<<<<< HEAD
		<img src="img/catkk.gif" alt="">

=======
		<img src="img/catkk.gif">
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-5/CATch-cat.git
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(window).load(function() {
    $('#load').hide();
	}); 
	

	</script>
	<script>
    setTimeout('move_page()', 9000); //2초후에 move_page함수실행
    
    function move_page(){
    location.href="searchCom.do"  // 페이지 이동
    }
	</script>

</body>
</html>