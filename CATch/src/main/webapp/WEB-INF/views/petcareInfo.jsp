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
List<Petcare> petCareList = (List<Petcare>)request.getAttribute("petCareList"); 
%>





    <h1 class="h_title">petcare</h1>
    <div class="petcare_body">


    <c:forEach items="${petCareList}" var="pc" varStatus="status">
    	<div class="petcare" onclick="location.href='/web/petcareInfo.do/${pc.petcare_seq}'">
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