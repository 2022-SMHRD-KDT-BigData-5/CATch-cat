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

<%
List<Petcare> petCareList = (List<Petcare>)request.getAttribute("petCareList"); 
%>

<jsp:include page="header.jsp"></jsp:include>


    <h1 class="h_title">petcare</h1>
    <div class="petcare_body">


    <c:forEach items="${petCareList}" var="pc" varStatus="status">
    	<div class="petcare" onclick="location.href='petcareInfo.do?petcare_seq=${pc.petcare_seq}'">
            <div class="petcare_img">
                <img src="${pc.petcare_thumb}">
            </div>
            
            <span>${pc.petcare_name}</span>
            <p>${pc.petcare_cate}</p>

        </div>
    
    </c:forEach>

    </div>

</body>
</html>