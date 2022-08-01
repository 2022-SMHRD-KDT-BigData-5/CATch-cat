<%@page import="com.smhrd.domain.Member"%>
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
<title>캣카드 등록</title>

<!-- 게시판css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CSS here -->


    <link rel="stylesheet" href="css/catcardForm.css">

    <style>
    	.id_ok{
    	color:#006400;
    	display:none;}
    	.id_already{
    	color:red;
    	display:none;}
    </style>
</head>
<body>
<%
Member member = (Member)session.getAttribute("member");
String mem_id = "";
if(member != null){
	mem_id = member.getMem_id();
}else{
	mem_id = "로그인을해야합니다.";
}
%>
  <a href="main.do"><h1 class = "h_title"><img src="img/joinlogo.png" ></h1></a>
   
  <!-- 캣카드 등록 -->
   <div id="header">    
    <div id="wrapper">
        <form action="catcardInsert.do" class ="cardform" name="catform"  method="post" enctype="multipart/form-data" >
          <div id="content">    
            
            
            <!-- 고양이 민증번호 -->
            <div>
            	<h3>고양이 민증번호</h3>
            	<p><input name="cat_seq" value="${catnum}" readonly ></p>
            </div>
            
             
            <!--고양이 이름-->   
            <div>    
                <h3>고양이 이름</h3>
            <span class="box int_name">    
            <input name="cat_name" type="text" class="int" placeholder="고양이 이름 입력" >
            </span>
            </div>     
          
            <!--고양이 생년월일-->
            <div>   
            <h3>고양이 생년월일</h3>
            <span class="box int_birthdate"> 
            <p><input name="cat_birthdate" type="date" class="int"></p>
            </span>
          </div> 
             
            <!--고양이 성별-->
            <div>
            <h3>고양이 성별</h3>
            <span class="box int_gender"> 
            <select  name="cat_gender" class="int"  >
                <option value="M">수컷</option>
                <option value="F">암컷</option>
            </select>     
            </span>
            </div>
         
            <!--보호자 아이디-->
            <div>
               <h3>보호자 아이디</h3>
               <span class="box int_id"> 
              <input name="mem_id" type="text" class="int" value=<%=mem_id%> readonly>
               </span> 
            </div>  
            
            <!--고양이 특이사항-->
            <div>
               <h3>고양이 특이사항</h3>
               <span class="box int_spec"> 
               <input name ="cat_spec" class="int" placeholder="특이사항 입력">
               </span>
            </div>
            
            <!--고양이 사진-->
            <div>
            <h3>고양이 사진</h3>
            <span class="box int_file"> 
            <input placeholder="하단의 버튼을 클릭하여 고양이의 사진을 등록해주세요."class="int">   
            </span>
            <br>
             <input class="filecheck" type="file" style=" border:0 solid black; display: inline-block" name="file", id="file" >
            
            </div>

            <!--중성화 유무-->
            <div>
              <h3>중성화 여부</h3>
               <label><input class="neutralcheck" type="checkbox" name="cat_neutral" value="Y">중성화 완료시 체크</label>  
              </div>  
                 
            <!-- join btn -->
            <div class="btn_area">               	
            <button type="submit" id="btn" value="등록하기" >등록하기</button>               	
                </div>		
           
          </div>       
        </form>
        
       </div> 
      </div> 
    
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="text/javascript"></script>
       <script>
     
     
     
    
     </script>
</body>
</html>