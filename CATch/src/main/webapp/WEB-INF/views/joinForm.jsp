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

    <link rel="stylesheet" href="css/myCat.css">
    <link rel="stylesheet" href="css/joinForm.css">

    
</head>
<body>
	

	<h1 class = "h_title"><img src="img/catch.png" ></h1>
	<!-- 회원가입 -->
	<div id="header">
		<div id="wrapper">
			<form action="join.do" method="post" name="joinform" onsubmit="return checkJoin()">
			<div id="content">
				<!-- ID -->
				<div>
					<h3>
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id">
						<input name="mem_id" type="text" id="userid" 
						class="int" placeholder="아이디 입력">
						
            			
						<button class="idcheck" onclick="idCheck()" type="button">중복체크</button>
						
					</span>
					<span class="id_ok">사용 가능한 아이디입니다.</span>
            		<span class="id_already">이미 사용중인 아이디입니다.</span><br>
					
            		<span class="error_next_box"></span>
				</div>
				
				<!-- pw -->
				<div>
					<h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
					<span class="box int_pass">
						<input name="mem_pw" type="password" placeholder="비밀번호 입력"
						id="pswd1" class="int">
						<span id="alertTxt">사용불가</span>												
					</span>
					<span class="error_next_box"></span>
				</div>
				
				<!-- pw2 -->
				<div>
					<h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
					<span class="box int_pass_check">
						<input name="checkpw" type="password" placeholder="비밀번호와 동일하게 입력"
						class="int">						
					</span>
					<span class="error_next_box"></span>
				</div>
				
				<!-- name -->
				<div>
					<h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                    	 <input name="mem_name" type="text" placeholder="이름을 입력"
                    	 class="int">
                    </span>
				    <span class="error_next_box"></span>
				</div>
				
				<!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input name="mem_phone" type="text" placeholder="전화번호를 입력"
                        id="mobile" class="int">              
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <!-- 병원관계 유무 -->
                <div>
                	<h3 class="join_title"><label for="check">병원관계자</label></h3>
                	<input class="joincheck" type="checkbox" name="mem_hospital" value="T">
                               
                </div>
                
                <!-- join btn -->
                <div class="btn_area">               	
                	<button type="submit" id="btnJoin" value="J O I N">회원가입</button>               	
                </div>				
			</div>	
			</form>		
		</div>
	
	
	</div>
	
  
       
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript"></script>
   
    
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	var inputbotton = 0
	   
    function idCheck(){
      var userid = $("#userid").val()

      $.ajax({
    	  url:'idCheck.do',
    	  type:'post',
    	  data:{'userid':userid},
    	  success:function(check){
    		  if(check == 0){
    			  $('.id_ok').css('display','inline-block');
    			  $('.id_already').css('display', 'none');
    		  }else{
    			  $('.id_already').css('display','inline-block');
    			  $('.id_ok').css('display', 'none');
    			  $('#userid').val('');
    		  }
    	  },
    	  error:function(){
    		  alert('에러입니다');
    	  }
    	  
      });

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