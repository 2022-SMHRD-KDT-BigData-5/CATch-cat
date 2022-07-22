<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link rel="stylesheet" href="css/catcardForm.css">
    <style>
        .id_ok{color:rgb(7, 104, 7); display:none;}
        .id_already{color:rgb(219, 20, 63); display:none;}
        
      
            body > .grid {
              height: 100%;
            }
            .image {
              margin-top: -100px;
            }
            .column {
              max-width: 450px;
            }
         
     </style>
</head>
<body>
<% 
Member member = (Member)session.getAttribute("member");
String mem_id = "";
if(member!=null){
   mem_id = member.getMem_id();
}
%>
   
   <!-- 캣카드 등록 -->
   
   <!-- 캣카드 등록 -->
   
   
   <h1 class = "h_title" ><img src="img/catch-removebg.png" ></h1>
        <div class="cardform">

            <form action="catcardInsert.do" class ="cardform" name="catform"  method="post" enctype="multipart/form-data" >
                
                <h2>캣카드 등록</h2>
                
                <h5>고양이 이름</h5>
            <input name="cat_name" type="text" class="name" placeholder="고양이 이름 입력" >
                 
                 <h5>고양이 생년월일</h5>
            <p><input name="cat_birthdate" type="date" placeholder="-빼고 작성해주세요"></p>
            
               
            <h5>고양이 성별</h5>
            <div class ="select"  >
            <select  name="cat_gender" class="select"  >
                <option value="성별">성별</option>
                <option value="수컷">수컷</option>
                <option value="암컷">암컷</option>
            </select>
            </div>  
              <h5>중성화 여부</h5>
             <label><input class="joincheck" type="checkbox" name="cat_neutral" value="Y">중성화</label>
         
                     
               <h5>보호자 아이디</h5>
            <input name="mem_id" type="text" value=>
  
           
               <h5>고양이 특이사항</h5>
               <td colspan="2"><textarea name="cat_spec" class="cat_spec""></textarea></td>
            <tr align="center" bgcolor="whitesmoke">
            
            <h5>고양이 사진</h5>
            <h5>고양이 사진 무조건 넣으세요!!!!!!!!!!!</h5>
             <input type="file" style=" border:0 solid black; display: inline-block" name="file", id="file" >
                
                <td colspan="2"> 
                    <br><input type="submit" id="btn" value="등록하기">
                </td>
            </tr>       
        </form>
        
        
        
        
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="text/javascript"></script>
       <script>
     
     
     
    
     </script>
</body>
</html>