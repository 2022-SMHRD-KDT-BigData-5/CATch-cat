<%@page import="com.smhrd.domain.PetcareReview"%>
<%@page import="com.smhrd.domain.Petcare"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


</head>
<body>
<%
Petcare petcare = (Petcare)request.getAttribute("petcare"); 
List<PetcareReview> petCareReviewList = (List<PetcareReview>)request.getAttribute("petCareReviewList");
%>
<h1><%=petcare.getPetcare_name() %></h1>






</body>
</html>