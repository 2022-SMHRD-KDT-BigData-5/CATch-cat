<%@page import="com.smhrd.domain.CommBoard"%>
<%@page import="java.util.List"%>
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
                                <a href="#">
                                    <span>login</span>
                                </a>
                                <a href="#">
                                    <span>join</span>
                                </a>
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
                                <a href="main.jsp">
                                    <h2>CATch</h2>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a  href="main.jsp">home</a></li>
                                        <li><a href="#">캣카드 <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                                <li><a href="blog.html">생성</a></li>
                                                <li><a href="single-blog.html">조회</a></li>
                                            </ul>
                                            </li>
                                                                             
                                        <li><a href="#">게시판 <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                                <li><a href="comm.do">소통게시판</a></li>
                                                <li><a href="single-blog.html">입양게시판</a></li>
                                                <li><a href="single-blog.html">후원게시판</a></li>
                                            </ul>
                                            </li>
                                        <li><a href="contact.html">고양터</a></li>
                                        <li><a href="#">마이페이지 <i class="ti-angle-down"></i></a>
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

	<!--------------------------  게시판 시작 ---------------------------------->


  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 

  <div class="table-responsive">  
  <% List<CommBoard> commList = (List<CommBoard>)request.getAttribute("commList"); %>        
  <table class="table">
    <thead>
      <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>글제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
     
      <% for(CommBoard commBoard : commList){ %>
      <tr>
        <td><%=commList.indexOf(commBoard)+1 %></td>
        <td><%=commBoard.getArticle_id() %></td>
        <td><%=commBoard.getArticle_title() %></td>
        <td><%=commBoard.getArticle_date() %></td>
        <td><%=commBoard.getArticle_cnt() %></td>
      </tr>
      <%} %>
    
    </tbody>
    
  </table>
  </div>
</div>




    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>페이징 위치</p>
</footer>
<!--------------------------  게시판 끝 ---------------------------------->

</body>
</html>