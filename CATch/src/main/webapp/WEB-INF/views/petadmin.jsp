<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/petdamin.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	 <h1 class="h_title">나의 고양이 고객님 </h1>
   <form action="#">
       <div class="petadmin_head">
        <span>캣 카드 번호</span><input type="text">
        <span>보호자 성함</span><input type="text"> 
        <p class="pet_spec">특이사항</p>
        <textarea name="" id="" cols="30" rows="10"></textarea>
    </form>
    <button class="petadmin_footer">등록하기</button>
    <button class="petadmin_footer">확인하기</button>
</div>
    
</body>
</html>