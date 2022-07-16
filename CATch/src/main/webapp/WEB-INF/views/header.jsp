<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
        <div class="header-area ">
            <div class="header-top_area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-8">
                            <div class="short_contact_list">
                                <ul>
                                    <li><a href="#">+82-10-9927-8280</a></li>
                                    <li><a href="#">Mon - Sat 8:00 - 22:00</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 ">
                            <div class="social_media_links">
                            	<c:if test="${empty member }">
                                <a href="login.do">
                                    		<span>login</span>
                                </a>
                                <a href="join.do">
                                    		<span>join</span>
                                </a>
                                </c:if>
                                <c:if test="${! empty member }">
                                <p>${member.mem_id }님</p>
                                <a href="logout.do">
                                <span>logout</span>
                                </a>
                                </c:if>
                                
                            
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo">
                                <a href="main.do">
                                    <img src="img/catch-removebg.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a  href="main.do">home</a></li>
                                        <li><a href="#">캣카드 <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                                <li><a href="catcard.do">생성</a></li>
                                                <li><a href="catcard.do">조회</a></li>
                                            </ul>
                                            </li>
                                                                             
                                        <li><a href="#">게시판 <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                                <li><a href="comm.do">소통게시판</a></li>
                                                <li><a href="adopt.do">입양게시판</a></li>
                                                <li><a href="spon.do">후원게시판</a></li>
                                            </ul>
                                            </li>
                                        <li><a href="contact.html">고양터</a></li>
                                        <li><a href="mypage.do">마이페이지 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">캣카드 조회</a></li>
                                                <li><a href="single-blog.html">회원정보 수정</a></li>
                                            </ul>
                                        </li>
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
</html>