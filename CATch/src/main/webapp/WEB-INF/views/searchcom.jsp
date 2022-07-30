<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   
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
    <link rel="stylesheet" href="css/searchcom.css">
    
</head>
<body >

 <jsp:include page="header.jsp"></jsp:include>


    <h1 class="h_title">조회성공</h1>
    <p class="com_p">이 고양이가 맞나요?</p>
    <div class="com_body">
        <div class="com_img"><img src="back-cat.png"></div>
        <svg>
            <text class = 'number' text-anchor="start" x="60" y="125" >75</text><text text-anchor="start" x="120" y="125">%</text>
            <circle cx="110" cy="110" r="100">
            </circle>
            
        </svg>
        
    </div>

  <button class="success_button">메인</button> 
    <br>
    <button class="success_button">다시조회</button> 

    
    <!-- This is Javascript Code -->
    <script>
        $(function(){
            var percent = 629 - (1875/ 100 * 25);
            //2500 이 한바퀴 1250이 한바퀴 반
            $({per : 629}).animate({
                per : percent
            }, {
                duration : 500,
                progress : function(){
                    $('svg circle').css({
                        strokeDashoffset: this.per 
                    });
                    console.log(this.per);
                }
            });
        });


        // ================ 숫자 증가 ========
        $(function(){
            var cnt0 = 0;

            counterFn();

            function counterFn(){
                id0 = setInterval(count0Fn,5);

                function count0Fn(){
                    cnt0++;
                    if(cnt0 > 75){
                        clearInterval(id0);
                    }else {
                        $(".number").text(cnt0);
                    }
                }
            }


        });
    </script>
 </body>
</html>