<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>



<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>

<!-- modal 라이브러리 -->
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>

<!-- 게시판css -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->
<link href="css/login.css" rel="stylesheet" type="text/css" />
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


   	<b><h2>Login</h2></b>

	<div class="member_login">

		<button type="button" class="btn btn-info btn-round"
			data-toggle="modal" data-target="#loginModal">로그인</button>


		<form th:action="/loginheard.do" th:method="POST">
				
			
			
			<div class="idForm">
				<input type="text" name="mem_id" placeholder="아이디">
			</div>
			
			<div class="passForm">
      			<input name="mem_pw" type="password" placeholder="비밀번호">
     		 </div>
			
		

      		<input type="submit"  class="btn btn-secondary" id="btn-login" value="로그인"/>
      		<div class="bottomText">
      			회원이 아니신가요? <a href="join.do">회원가입</a>
     		</div>
			
		
			
		</form>

	</div>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>로그인</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form>
							<div class="form-group">
								<input type="email" class="form-control" id="email1"
									placeholder="아이디">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password1"
									placeholder="비밀번호">
							</div>
							<button type="button" class="btn btn-info btn-block btn-round">Login</button>
						</form>

						<div class="text-center text-muted delimiter">또는</div>

						<div class="login_api">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=d860d38c992ca8bf5f07dcc3fd5122b9&redirect_uri=http://localhost:9090/member/auth/kakao/callback&response_type=code"><img
								src="/image/kakao_login_medium_narrow.png"></a>
						</div>

						<div class="login_api">
							<a href="/oauth2/authorization/google"><img
								src="/image/btn_google_signin_dark_pressed_web.png"></a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer d-flex justify-content-center">
				<div class="signup-section">
					아직 회원이 아닌가요? <a href="join.do" class="text-info">회원가입</a>.
				</div>
			</div>
		</div>

	</div>

	<script>
		$(document).ready(function() {             $('#loginModal').modal('show');
		  $(function () {
		    $('[data-toggle="tooltip"]').tooltip()
		  })
		});
		</script>
</body>
</html>