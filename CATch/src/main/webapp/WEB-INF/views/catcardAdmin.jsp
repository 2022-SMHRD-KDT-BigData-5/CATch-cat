<%@page import="com.smhrd.domain.PetcareAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체용 관리 페이지</title>
</head>

<!-- 게시판css -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/boardtest.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
   rel="stylesheet">

<body>

   <%
    Member member = (Member) session.getAttribute("member");
   	List<PetcareAdmin> petcareAdmin = (List<PetcareAdmin>)session.getAttribute("petcareAdmin");

   %>
   <jsp:include page="header.jsp"></jsp:include>

   <div class="board_head">
      <h1 class="h_title">${petcareAdmin.get(0).getAdmin_name()} 고객관리</h1>
      <p>우리 업체에 등록한 고양이의 캣카드를 조회하는 곳입니다.</p>
   </div>
   <div class="container-fluid text-center">
      <div class="row content">

         <div class="col-sm-2 sidenav"></div>
         <div class="col-sm-8 text-left">



            <div class="table-responsive">
               <table class="table" class="table table-hover"
                  class="table-responsive">
                  <thead class="table-light">
                     <tr>
                        
						<th scope="col">등록일</th>
						<th scope="col">캣카드번호</th>
                        <th scope="col">내용</th>
                        
                        
                     </tr>
                  <tbody>


                     <c:forEach items="${petcareAdmin}" var="pa" varStatus="status">
                     	<tr>
                        
                        <td>${fn:split(pa.getAdmin_date(), " ")[0]}</td>
                        <td>${pa.getAdmin_catcard()}</td>
                        <td>${pa.getAdmin_content()}</td>
                        
                     </tr>
                     </c:forEach>
                     
                  </tbody>
               </table>
            </div>

         </div>
      </div>
   </div>

   <footer class="container-fluid text-center">
      <div>
         <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li>
         </ul>
      </div>
   </footer>
</body>
</html>