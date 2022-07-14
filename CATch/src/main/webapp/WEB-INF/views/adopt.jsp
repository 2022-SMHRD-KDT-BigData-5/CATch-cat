<%@page import="com.smhrd.domain.AdoptBoard"%>
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

<jsp:include page="header.jsp"></jsp:include>

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
  <% List<AdoptBoard> adoptList = (List<AdoptBoard>)request.getAttribute("adoptList"); %>        
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
      
      <% for(AdoptBoard adoptBoard : adoptList){ %>
       <tr>
        <td><%=adoptList.indexOf(adoptBoard)+1 %></td>
        <td><%=adoptBoard.getAdt_id() %></td>
        <td><a href="/web/boardinfo.do/<%=adoptBoard.getAdt_seq()%>"><%=adoptBoard.getAdt_title() %></a></td>
        <td><%=adoptBoard.getAdt_date() %></td>
        <td><%=adoptBoard.getAdt_cnt() %></td>
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