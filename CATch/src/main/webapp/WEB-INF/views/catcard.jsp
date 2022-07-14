<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
 
 <body>

   <jsp:include page="header.jsp"></jsp:include>


<!-- testmonial_area_start  -->
 <div class="testmonial_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="textmonial_active owl-carousel">
                    <div class="testmonial_wrap">
                        <div class="single_testmonial d-flex align-items-center">
                            
                                
                                    <div class="test_thumb">
                                        <img src="img/testmonial/1.png" alt="">
                                    </div>
                                    <div class="test_content">
                                        <h4>고양이 이름 적을 곳</h4>
                                        <span>고양이 카드 번호</span>
                                        <p>고양이 생일 : 1852년 5월 35일</p>
                                        <p>고양이 성별 : 🎩</p>
                                        <p>카드 등록일 : 1952년 5월 35일</p>
                                    </div>
                                
                                
                            

                            
                                                                                                    
                            <div class = 'moreCard'>
                                 <input value="더보기" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}" type="button" />
                                    <div style="display: none;">
                                     <p>보호자 : 집사조</p>
                                       <p>거주지 : 제주도(자세한 주소는 제주살앙 이용 바람)</p>
                                      <p>중성화 : 고양이가 싫어하여 안함</p> 
                                      <p>특이사항</p>
                                      <p>특이사항 없음 </p>
                                 </div>
                            </div>
                            


                        </div>
                        
                    </div>
                    <div class="testmonial_wrap">
                        <div class="single_testmonial d-flex align-items-center">
                            <h7>진료 내역</h7>
                            <div class="medical_thumb">
                               <table class = "table table-border table-hover">
                                <tr>
                                    <td>진료병원</td>
                                    <td>진료내역</td>
                                    <td>진료일</td>
                                </tr>
                                <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr>
                                <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr>
                                <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr>
                                <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr> <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr> <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr>
                                <tr>
                                    <td>미래아동병원</td>
                                    <td>고양이가 엄청 아파하여 주사를 맞추려다가 개고생을 하였다</td>
                                    <td>1995년 15월 36일</td>
                                </tr>
                               </table>
                            </div>
                            <h7>접종 내역</h7>
                            <div class="vacc_content">
                                <table class = "table table-border table-hover">
                                    <tr>
                                        <td>백신</td>
                                        <td>접종여부</td>
                                        <td>접종병원</td>
                                        <td>접종일자</td>
                                    </tr>
                                    <tr>
                                        <td>종합백신</td>
                                        <td>접</td>
                                        <td>미래아동병원</td>
                                        <td>1994년 2월 38일</td>
                                    </tr>

                                </table>
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