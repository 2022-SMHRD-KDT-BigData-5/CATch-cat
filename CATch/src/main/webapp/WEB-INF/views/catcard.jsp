<%@page import="com.smhrd.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.Vaccination"%>
<%@page import="com.smhrd.domain.Medical"%>
<%@page import="com.smhrd.domain.CatCard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Animal</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

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
    <link rel="stylesheet" href="css/myCat.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
 
 <body>
 	<% 
 	Member member = (Member)session.getAttribute("member");
 	CatCard catcardInfo = (CatCard)session.getAttribute("catcardInfo");
 	List<Medical> medicalList = (List<Medical>)session.getAttribute("medicalList");

 	%>
	
   <jsp:include page="header.jsp"></jsp:include>


<!-- testmonial_area_start  -->
 <div class="testmonial_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="textmonial_active owl-carousel">
                    <div class="testmonial_wrap">
                        <div class="single_testmonial d-flex align-items-center">
                            
                                <%if(catcardInfo != null){ %>
                                    <div class="test_thumb">
                                        <img src="img/testmonial/1.png" alt="">
                                    </div>
                                    <div class="test_content">
                                    
                                        <h4><%=catcardInfo.getCat_name() %>??? CAT CARD</h4>
                                        <span>??????????????? : <%=catcardInfo.getCat_seq() %></span>
                                        <p>????????? ?????? : <%=catcardInfo.getCat_birthdate() %></p>
                                        <p>????????? ?????? : <%=catcardInfo.getCat_gender() %></p>
                                        <p>?????? ????????? : <%=catcardInfo.getCat_date() %></p>
                                    
                                    </div>
                                
                                
                                                                                                    
                            <div class = 'moreCard'>
                                 <input value="?????????" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '?????????';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '?????????';}" type="button" />
                                    <div style="display: none;">
                                     <p>?????????????????? : <%=catcardInfo.getMem_id() %></p>
                                      <p>????????? : <%=catcardInfo.getCat_neutral() %></p> 
                                      <p>????????????</p>
                                      <p>???????????? ?????? </p>
                                 </div>
                            </div>
                            <%}else{ %>
                                    <p>????????? ????????? ?????? ??????????????????.</p>
                                    <%} %>


                        </div>
                        
                    </div>
                    <div class="testmonial_wrap">
                        <div class="single_testmonial d-flex align-items-center">
                        <%if(member!=null){if(member.getMem_hospital() == 'T'){ %>
                        	<button onclick="location.href='medicalUpdate.do'">??????</button><br>
                        	<%}} %>
                            <h7>?????? ??????</h7>
                            <div class="medical_thumb">
                               <table class = "table table-border table-hover">
                               <tr>
                               		<td></td>
                                    <td>????????????</td>
                                    <td>????????????</td>
                                    <td>?????????</td>
                                </tr>
                               <c:forEach items="${medicalList}" var="medi" varStatus = "status">
                               		<tr>
                               		<td>${status.count}</td>
                               		<td>${medi.getMedi_name()}</td>
                               		<td>${medi.getMedi_content()}</td>
                               		<td>${medi.getMedi_date()}</td>
                               		</tr>
                               </c:forEach>
                               
                               </table>
                            </div>
                            <h7>?????? ??????</h7>
                            <div class="vacc_content">
                            <!-- ?????? ????????? ??????????????? ?????????????????? ????????? -->
                                <jsp:include page="vaccincard.jsp"></jsp:include>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

    </div>
</div>
<!-- testmonial_area_end  -->


    <!-- JS here -->
     <script src="js/vendor/modernizr-3.5.0.min.js"></script>
     <script src="js/vendor/jquery-1.12.4.min.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/jquery.slicknav.min.js"></script>
     <script src="js/main.js"></script>
    

</body>
</html>