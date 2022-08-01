<%@page import="com.smhrd.domain.PetcareAdmin"%>
<%@page import="com.smhrd.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.Vaccination"%>
<%@page import="com.smhrd.domain.Medical"%>
<%@page import="com.smhrd.domain.CatCard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <title>CAT CARD😺</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
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
    <link rel="stylesheet" href="css/movebtn.css">

    <!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <!-- Demo styles -->
<style>
        html,
        body {
            position: relative;

        }



        .swiper {
            width: 100%;
            height: auto;
            overflow: visible;
            
        }

        .swiper-slide {
            display: grid;
            grid-template-columns: 50% 50%;
            grid-template-rows: auto;
            grid-gap: 15px;
            font-size: 18px;
            background: #ffffff;
            width: 50% !important;
            height: 70%;
            margin-left: 26% !important;
            margin-right: 26% !important;
            margin-top: 30px;
            /* Center slide text vertically */
            box-shadow: 3px 3px 3px 3px gray;
            border-radius: 60px;


        }


        .swiper {
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-pagination {
            margin-bottom: -40px !important;
            --swiper-theme-color : #006400;
        }

        .swiper-button-next, .swiper-button-prev{
            --swiper-theme-color : #006400 ;
        }


        .h_title {
            font-size: 60px;
            color  : #006400;
            font-family : var(--font--family);
        }
        
        .btn-primary {
    color: #fff;
    background-color: #006400 !important;
    border-color: #006400 !important;
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
    CatCard catcardInfo = (CatCard)session.getAttribute("catcardInfo");
    List<Medical> medicalList = (List<Medical>)session.getAttribute("medicalList");
    List<Vaccination> jh = (List<Vaccination>)session.getAttribute("jh");
	List<Vaccination> gg = (List<Vaccination>)session.getAttribute("gg");
	List<Vaccination> jb = (List<Vaccination>)session.getAttribute("jb");
	List<Vaccination> hc = (List<Vaccination>)session.getAttribute("hc");
	List<Vaccination> ss = (List<Vaccination>)session.getAttribute("ss");
	List<PetcareAdmin> catcardPetcare = (List<PetcareAdmin>)session.getAttribute("catcardPetcare");
	

    %>

   <jsp:include page="header.jsp"></jsp:include>



   <%if(catcardInfo != null){ %>
   <h1 class='h_title'><%=catcardInfo.getCat_name() %>의 CAT CARD</h1>
   <!-- Swiper -->
   <div class="swiper mySwiper">
      <div class="swiper-wrapper">
         <div class="swiper-slide">
            <div class="catcard_head">
               <div class="catcard_img">
                  <img src="<%=catcardInfo.getCat_url()%>" alt="upload/cat_blank.png">
               </div>
               <div class="catcard_content">
                  <span>NO. <%=catcardInfo.getCat_seq() %></span>
                  <p>
                     고양이 생일 :
                     <%=catcardInfo.getCat_birthdate() %></p>
                  <p>고양이 성별 : <%if(catcardInfo.getCat_gender() == 'M'){%>수컷<%}else{ %>암컷<%}%></p>
                  <p>
                     카드 등록일 :
                     <%=catcardInfo.getCat_date().getYear()-100%>년 <%=catcardInfo.getCat_date().getMonth()+1%>월 <%=catcardInfo.getCat_date().getDate()%>일</p>
                  <p>중성화 : <%if(catcardInfo.getCat_neutral() == 'N'){%>X<%}else{ %>O<%}%></p>
               </div>
            </div>


            <div class="catcard_more">
               <button class="btn btn-primary btn-jittery">더보기</button>
               <div id='more_content'>
                  <p>보호자아이디 : <%=catcardInfo.getMem_id() %></p>
                  <p>보호자연락처 : 010-1234-5678</p>
                  <p>특이사항 : </p>
                  <p><%=catcardInfo.getCat_spec()%></p>
               </div>
            </div>
         </div>

   <%}else{ %>
   <p>캣카드 번호를 다시 확인해주세요.</p>
   <%} %>



         <div class="swiper-slide">
         
              <%if(member!=null){if(member.getMem_hospital() == 'H'){ %> 
          
          <div class='update_btn'>
                    <a  href="#update_modal" rel="modal:open" class='update_btn_body'>수정</a>
                </div>
            
            
           <%}} %> 
           

            <div class="medi_content">
               <h7>진료내역</h7>
               <table class="table table-border table-hover">
                  <tr class="medi_content_head">
                     <td></td>
                     <td>진료병원</td>
                     <td>진료내역</td>
                     <td>진료일</td>
                  </tr>
                  <c:forEach items="${medicalList}" var="medi" varStatus="status">
                     <tr>
                        <td>${status.count}</td>
                        <td>${medi.getMedi_name()}</td>
                        <td>${medi.getMedi_content()}</td>
                        <td>${fn:split(medi.getMedi_date(), " ")[0]}</td>
                     </tr>
                  </c:forEach>

               </table>
            </div>



            <div class="vacc_content">
            <h7>접종 내역</h7>
               <!-- 너무 길어서 백신카드는 외부방식으로 불러옴 -->
               <jsp:include page="vaccincard.jsp"></jsp:include>
            </div>
         </div>
         
         
         <div class="swiper-slide">
         	<div class = "care_content">
         		<h7>펫케어</h7>
         	<table class="table table-border table-hover">
                  <tr class="admin_content_head">
                     <td>번호</td>
                     <td>상품명</td>
                     <td>상품 종류</td>
                     <td>내역</td>
                     <td>등록일</td>
                     <td></td>
                  </tr>
					<c:forEach items="${catcardPetcare}" var="cp" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${cp.getAdmin_name()}</td>
							<td>${cp.getAdmin_cate()}</td>
							<td>${cp.getAdmin_content()} </td>
							<td>${fn:split(cp.getAdmin_date(), " ")[0]}</td>
							<td><a href="petcareInfo.do?petcare_seq=${cp.getAdmin_petcare_seq()}">리뷰작성</a></td>
							
							
						</tr>
					</c:forEach>
               </table>
         	
         	
         	
         	
         	
         	</div>
         </div>
         
         
         
         
         
         
         
         
         
   </div>
   </div>
 
   

   
   
<div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
   </div>
   
       <div class="swiper-pagination"></div>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>





  <div id='update_modal'>
       
       <h7>진료 내역</h7>
			<div class="medical_thumb">
				<table class="table table-border table-hover">
					<tr>
						<td></td>
						<td>진료병원</td>
						<td>진료내역</td>
						<td>진료일</td>
					</tr>
					<c:forEach items="${medicalList}" var="medi" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${medi.getMedi_name()}</td>
							<td>${medi.getMedi_content()}</td>
							<td>${fn:split(medi.getMedi_date(), " ")[0]}</td>
						</tr>
					</c:forEach>
				</table>
				<form action="mediUpdate.do">
					<input type="hidden" name="medi_id" value=<%=member.getMem_id() %> >  
					<input type="hidden" name="medi_name" value=<%=member.getMem_id() %>> 
					<input type="hidden" name="cat_seq" value=<%=catcardInfo.getCat_seq() %>>
					<h7>진료 내용</h7><br>
					
					 <textarea name="medi_content"></textarea>
					<br>
					<input type="submit" value="등록">
				</form>
				<h7>접종 백신</h7>
			<div class="vacc_content">
			<form action="vaccUpdate.do" class = 'vacc_update'>
				<input type="hidden" name="medi_id" value=<%=member.getMem_id() %>>
				<input type="hidden" name="medi_name" value=<%=member.getMem_name() %>>
				<input type="hidden" name="cat_seq" value=<%=catcardInfo.getCat_seq() %>>
				종합백신 <input type="checkbox" name="vacc_type" value="종합백신">
				광견병 <input type="checkbox" name="vacc_type" value="광견병">
				전염성 복막염 <input type="checkbox" name="vacc_type" value="전염성 복막염">
				항체가검사 <input type="checkbox" name="vacc_type" value="항체가검사">
				심장사상충 <input type="checkbox" name="vacc_type" value="심장사상충">
				<br>
				<input type="submit" value="접종완료">
			</form>
				
			</div>	

			
	</div>
	</div>
				
				
    







    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
  <script>

    $(".update_btn_body").click(function(){
        $("#update_modal").show();
    });
    
</script>

  <script>
  		//캣카드 등록자만 상세정보 볼수있게 해주는 '더보기'클릭 메서드
        $(function () {
            $(".btn").click(function () {
            	var cat_mem_id = "<%=catcardInfo.getMem_id()%>";
            	
            	$.ajax({
            		url:'catcardMemCheck.do',
            		type:'POST',
            		data:{'cat_mem_id':cat_mem_id},
            		success:function(check){
            			if(check==1){
            				 $("#more_content").show();
            	             $('.btn').hide();
            			}else{
            				alert('캣카드를 등록한 사용자만 조회할 수 있습니다!');
            			}
            		},
            		error:function(){
            			alert('캣카드를 등록한 사용자만 조회할 수 있습니다!');
            		}
            	});
               
            });
        });


    </script>

   
   <!-- testmonial_area_end  -->


   <!-- JS here -->
   <script src="js/vendor/modernizr-3.5.0.min.js"></script>
   <script src="js/vendor/jquery-1.12.4.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.slicknav.min.js"></script>
   <script src="js/main.js"></script>




	
</body>
</html>