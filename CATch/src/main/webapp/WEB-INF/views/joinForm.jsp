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
    
</head>
<body>
	
<jsp:include page="header.jsp"></jsp:include>	
	
	<!-- 회원가입 -->
	
	<form action="join.do" method="post" name="joinform" onsubmit="return checkJoin()">
		
		<h2>회원가입</h2>
		
		<h5>아이디</h5>
		<input name="mem_id" type="text" id="userid" placeholder="ID를 입력">
		
		<button class="btn" onclick="idCheck()" type="button">중복체크</button>
		
		<h5>비밀번호</h5>
		<input name="mem_pw" type="password" placeholder="비밀번호 입력">
		
		<h5>비밀번호확인</h5>
		<input name="checkpw" type="password" placeholder="비밀번호와 동일하게 입력">
		
		<h5>이름</h5>
		<input name="mem_name" type="text" placeholder="이름을 입력">
		
		<h5>전화번호</h5>
		<input name="mem_phone" type="text" placeholder="전화번호를 입력">
		
		<h5>병원관계자유무</h5>
		<label><input type="radio" name="mem_hospital" value="N" checked>보호자</label>
		<label><input type="radio" name="mem_hospital" value="T">병원관계자</label>
		
		<input type="submit" class="btn" value="J O I N" />
		
		
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	var inputbotton = 0
	   
    function idCheck(){
      let userid = $("#userid").val()

      $.ajax({
         data : {
            'userid' : userid
         },
         url : 'idCheck.do',
         type : 'get',
         contentType : 'application/json; charset=UTF-8',
         dataType : 'text',
         success : function(data) {
            if (data == 1) {
               inputbotton = 1
               alert("사용할 수 있는 아이디입니다.")
               $("#userid").val(userid)
               
            } else {
               alert("사용할 수 없는 아이디입니다.")
               $("#userid").val("")
            }
         },
         error : function(data) { 
            alert("통신실패!")
         }
      })

   }
	
	
	

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