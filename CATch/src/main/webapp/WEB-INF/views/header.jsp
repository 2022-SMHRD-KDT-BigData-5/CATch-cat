<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
</head>
<body>
   <%
      Member member = (Member) session.getAttribute("member");
   String id_info="None";
   String mem_id = "";
   if(member != null){
      if(member.getMem_hospital() == 'P'){
         id_info= "P";
      }else if(member.getMem_hospital() == 'H'){
         id_info="P";
      }else{
         id_info="N";
      }
      mem_id = member.getMem_id();
         
   }
   %>
   <header>
      <div class="header-area ">

         <div id="sticky-header" class="main-header-area">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-xl-3 col-lg-3">
                     <div class="logo">
                        <a href="main.do"> <img src="img/catch.png" alt="">
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
                                    <li><a href="imgNoseForm.do">생성</a></li>
                                    <li><a href="catcardSearch.do">조회</a></li>
                                 </ul></li>

                              <li><a href="#">캣뮤니티<i class="ti-angle-down"></i></a>
                                 <ul class="submenu">
                                    <li><a href="comm.do">소통게시판</a></li>
                                    <li><a href="adopt.do">입양게시판</a></li>
                                    <li><a href="petcare.do">펫케어 소개/후기</a></li>
                                 </ul></li>
                              <li><a href="carezoneFinal.do">고양터</a></li>

                                 <%if(id_info.equals("N")){ %>
                                    <li><a href="mypage.do?mem_id=<%=member.getMem_id()%>">마이페이지<i class="ti-angle-down"></i>  </a>
                                       <ul class="submenu">
                                          <li><a
                                             href="mypage.do?mem_id=<%=member.getMem_id()%>">캣카드 조회</a></li>
                                          <li><a href="myInfoCheck.do">회원정보 수정</a></li>
                                       </ul></li>
                                 <%}else if(id_info == "P"){ %>
                                    <li><a href="catcardAdmin.do">고객 관리<i class="ti-angle-down"></i>  </a>
                                       <ul class="submenu">
                                          <li><a
                                             href="catcardAdmin.do">방문고객 관리</a></li>
                                          <li><a href="myInfoCheck.do">회원정보 수정</a></li>
                                       </ul></li>
                                 <%}else{ %>
                                    <li></li>
                                    <%} %>


                              
                              <c:choose>
                                 <c:when test="${empty member}">
                                    <li>
                                     <a href="login.do" data-toggle="modal"  data-target="#loginModal" >
                                    Login
                                    </a>
                                    </li>
                                    <li>
                                    <a href="join.do">Join</a>
                                    </li>
                                 </c:when>
                                 <c:otherwise>
                                    <li>
                                    <a href="logout.do" ><span>Logout</span></a>
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


<ul class="nav">
 <li>

  <div class="modal fade" id="loginModal" role="dialog" >
   <div class="modal-dialog">
    <div class="modal-content" >

     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">×</button>
        

      <div class="modal-title" ></div>
     </div>
     <div class="modal-body">

      <th:block th:replace="~{login.do :: setLogin(~{this::login} )}"></th:block>
     </div>
    </div>
   </div>
  </div>
 </li>
</ul>
 

</body>
</html>