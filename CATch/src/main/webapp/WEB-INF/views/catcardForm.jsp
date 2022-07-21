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
    <link rel="stylesheet" href="css/myCat.css">
    <link rel="stylesheet" href="css/jointest.css">
    <style>
    	.id_ok{color:rgb(7, 104, 7); display:none;}
    	.id_already{color:rgb(219, 20, 63); display:none;}
    	   * {
        font-size: 16px;
        font-family: Consolas, sans-serif;
      }
    </style>
</head>
<body>
	
	<!-- 캣카드 등록 -->
	
	<h1 class = "h_title"><img src="img/catch-removebg.png" ></h1>
  
        <div class="catcardform">

            <form action="catcardForm.do" method="post" name="catcardform" onsubmit="return checkJoin()">
                
                <h2>캣카드 등록</h2>
                
                <h5>고양이 이름</h5>
            <input name="cat_name" type="text"  placeholder="고양이 이름 입력">
           		
           		<h5>고양이 생년월일</h5>
           	
            <p><input name="cat_birthdate" type="date" placeholder="고양이 생년월일"></p>
      		
            	<h5>고양이 성별</h5>
            <label><input type="radio" name="gender" checked>수컷</label>
  			<label><input type="radio" name="gender" checked>암컷</label>
  			
  				<h5>중성화 여부</h5>
          	<label><input class="joincheck" type="checkbox" name="cat_neutral" value="">중성화</label>
			
             	<h5>카드 등록일</h5>
             <p><input type="date"></p>
                
           
            
            	<h5>보호자 아이디</h5>
            <input name="mem_id" type="text" id="userid" placeholder="ID를 입력">
            
            	<h5>비문 사진</h5>
            <input name="cat_nose" type="file" placeholder="">
            	
            
            	<h5>고양이 특이사항</h5>
            
           	 <td colspan="2"><textarea cols="20" rows="5"></textarea></td>
            <tr align="center" bgcolor="whitesmoke">
                <td colspan="2"> 
                    <br><input type="submit" value="등록하기">
                </td>
            </tr>
           	
            	
            
        </form>
    </div>
</body>
</html>