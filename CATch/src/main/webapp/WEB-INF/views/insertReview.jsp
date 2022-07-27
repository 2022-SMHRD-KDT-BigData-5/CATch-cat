<%@page import="com.smhrd.domain.Member"%>
<%@page import="com.smhrd.domain.PetcareReview"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.Petcare"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/star.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
Petcare petcare = (Petcare)session.getAttribute("petcare"); 
List<PetcareReview> petCareReviewList = (List<PetcareReview>)session.getAttribute("petCareReviewList");
Member member = (Member)session.getAttribute("member");
String mem_id="";
if(member!=null){
	mem_id = member.getMem_id();
}

%>


	
    <form class="mb-3" name="myform" id="myform" method="post" action="insertReview.do">
        <input type="hidden" name="review_id" value="<%=mem_id%>">
        <input type="hidden" name="review_petcare" value="${petcare.getPetcare_seq()}">
        
        <fieldset>
            <span class="text-bold">별점을 선택해주세요</span>
            <input type="radio" name="review_star" value="5" id="rate1"><label for="rate1">★</label>
            <input type="radio" name="review_star" value="4" id="rate2"><label for="rate2">★</label>
            <input type="radio" name="review_star" value="3" id="rate3"><label for="rate3">★</label>
            <input type="radio" name="review_star" value="2" id="rate4"><label for="rate4">★</label>
            <input type="radio" name="review_star" value="1" id="rate5"><label for="rate5">★</label>
        </fieldset>
        <div>
            <textarea class="col-auto form-control" id="reviewContents" name="review_content" placeholder="상대방을 배려하는 리뷰를 작성해주세요^^*"></textarea>
        </div>
        
        <input type="submit" value="리뷰등록">
    </form>	
</body>
</html>