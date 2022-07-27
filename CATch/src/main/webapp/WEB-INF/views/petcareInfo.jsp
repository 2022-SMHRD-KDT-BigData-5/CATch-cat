<%@page import="com.smhrd.domain.PetcareReview"%>
<%@page import="com.smhrd.domain.Petcare"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>    

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    <link rel="stylesheet" href="css/catcard.css">
    <link rel="stylesheet" href="css/petcare.css">
    



</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%
Petcare petcare = (Petcare)session.getAttribute("petcare"); 
List<PetcareReview> petCareReviewList = (List<PetcareReview>)session.getAttribute("petCareReviewList");
%>

   <h1 class="h_title"><%=petcare.getPetcare_name() %></h1>
    <div class = "petcare_att_img"></div>
    <div class = "petcare_att_review">
    <jsp:include page="insertReview.jsp"></jsp:include>
        <p class="reivew_name">후기</p>
        
        <c:forEach items="${petCareReviewList}" var="pcr" varStatus="status">

        <div class = "petcare_review_content">
            <hr>
            <span class="review_writer">${pcr.review_id}</span><span>${pcr.review_date}</span><br>
            <pre>${pcr.review_content}</pre>
        </div>
        
        </c:forEach>


    </div>








</body>
</html>