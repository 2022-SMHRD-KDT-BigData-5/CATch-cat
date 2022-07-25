<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
	%>
	<header>
		<div class="header-area ">

			<div id="sticky-header" class="main-header-area">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-xl-3 col-lg-3">
							<div class="logo">
								<a href="main.do"> <img src="img/005.png" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-9 col-lg-9">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="main.do">home</a></li>
										<li><a href="#">캣카드 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="catcardForm.do">생성</a></li>
												<li><a href="catcardSearch.do">조회</a></li>
											</ul></li>

										<li><a href="#">게시판 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="comm.do">소통게시판</a></li>
												<li><a href="adopt.do">입양게시판</a></li>
												<li><a href="spon.do">후원게시판</a></li>
											</ul></li>
										<li><a href="carezone.do">고양터</a></li>
										<c:choose>
											<c:when test="${empty member}">
												<li></li>
											</c:when>
											<c:otherwise>
												<li><a href="mypage.do?mem_id=<%=member.getMem_id()%>">마이페이지
														<i class="ti-angle-down"></i>
												</a>
													<ul class="submenu">
														<li><a
															href="mypage.do?mem_id=<%=member.getMem_id()%>">캣카드
																조회</a></li>
														<li><a href="myInfoCheck.do">회원정보 수정</a></li>
													</ul></li>
											</c:otherwise>
										</c:choose>

										
										<c:choose>
											<c:when test="${empty member}">
												<li>
												 <a data-toggle="modal" href="login.do" data-target="#loginModal">LOGIN</a>
												</li>
												<li>
												<a href="join.do">join</a>
												</li>
											</c:when>
											<c:otherwise>
												<li>
												<a href="logout.do"><span>logout</span></a>
												</li>
											</c:otherwise>
										</c:choose>
										
										
										
										
										

									</ul>
								</nav>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		

	
		
		
	</header>



</body>
<ul class="nav">
 <li>
 
  <div class="modal fade" id="loginModal" role="dialog">
   <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">×</button>
      <h1 class="modal-title" >로그인</h1>
     </div>
     <div class="modal-body">
      <th:block th:replace="~{/login.do :: setLogin}"></th:block>
     </div>
    </div>
   </div>
  </div>
 </li>
</ul>

</html>