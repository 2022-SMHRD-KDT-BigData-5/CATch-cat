<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	  
    <link rel="stylesheet" href="css/catLoding.css">
</head>
<body>
 

<div id="load">
    <img src="img/catloding.gif" >

</div>



<script>
        setTimeout('move_page()', 9000); //2초후에 move_page함수실행
      
        function move_page(){
        location.href="completion.do"  // 페이지 이동
        }
</script>
 
</body>
</html>