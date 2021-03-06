<%@page import="com.smhrd.domain.Member"%>
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
    </style>
    
</head>
<body>
	<% Member member = (Member)session.getAttribute("member"); %>

	
	<!-- 회원정보 수정 -->
	
	<h1 class = "h_title"><img src="img/catch-removebg.png" ></h1>
  
        <div class="joinform">

            <form action="myInfoUpdate.do" method="post" onsubmit="return checkJoin()">
                
                <h2>회원정보 수정</h2>
                
                <h5>아이디</h5>
            <input name="mem_id" type="text" id="userid" value=<%=member.getMem_id()%> readonly>

            
            <h5>비밀번호</h5>
            <input type="text" name="mem_pw" value=<%=member.getMem_pw() %>>

            <h5>비밀번호확인</h5>
            <input name="checkpw" type="password" placeholder="비밀번호와 동일하게 입력">
            
            <h5>이름</h5>
            <input name="mem_name" type="text" value=<%=member.getMem_name() %>>
            
            <h5>전화번호</h5>
            <input name="mem_phone" type="text" value=<%=member.getMem_phone() %>>
            
            <h5>  </h5>
            <h5>  </h5>
            
            <input type="submit" class="btn" value="변경 완료" />
            
            
        </form>
    </div>
        
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript"></script>
   
    
	
	
	<script type="text/javascript">
	
	var inputbotton = 0
	   
  
	
	//동작안됨

		function checkJoin() {

			var fr = document.joinform;

			if (!fr.mem_id.value) {
				alert("아이디를 입력해주세요");
				fr.mem_id.focus();
				return false;
			}
			else if (!fr.mem_pw.value) {
				alert("비번을 입력해주세요");
				fr.mem_pw.focus();
				return false;
			}
			else if (fr.mem_pw.value != fr.checkpw.value) {
	            alert("Password가 서로 다릅니다")
	            fr.mem_pw.focus();
	            return false;
	         }
			else if (!fr.mem_name.value) {
				alert("이름을 입력해주세요");
				fr.mem_name.focus();
				return false;
			}
			else if (!fr.mem_phone.value) {
				alert("전화번호를 입력해주세요");
				fr.mem_phone.focus();
				return false;
			}
			else 
				return true;
		}
		
		
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>