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
    <link rel="stylesheet" href="css/petcare.css">
    <link rel="stylesheet" href="css/success.css">

    <style>
        h1{
            font-family: var(--font--family) !important;
        }

        body{
            text-align: center;
        }
    </style>
</head>
<body>
 <h1 class = "h_title">등록 완료</h1>
    
    <button class="success_button">메인</button> 
    <br>
    <button class="success_button">등록/조회</button> 





    <script>
        console.clear();

let particles = [];
const colors = ["#006400","#84b076","#ffe9c5","#b4f2e1"];
function pop () {
  for (let i = 0; i < 150; i++) {
    const p = document.createElement('particule');
    p.x = window.innerWidth * 0.5;
    p.y = window.innerHeight + (Math.random() * window.innerHeight * 0.3);
    p.vel = {
      x: (Math.random() - 0.5) * 10,
      y: Math.random() * -20 - 15
    };
    p.mass = Math.random() * 0.2 + 0.8;
    particles.push(p);
    p.style.transform = `translate(${p.x}px, ${p.y}px)`;
    const size = Math.random() * 15 + 5;
    p.style.width = size + 'px';
    p.style.height = size + 'px';
    p.style.background = colors[Math.floor(Math.random()*colors.length)];
    document.body.appendChild(p);
  }
}

function render () {
  for (let i = particles.length - 1; i--; i > -1) {
    const p = particles[i];
    p.style.transform = `translate3d(${p.x}px, ${p.y}px, 1px)`;
    
    p.x += p.vel.x;
    p.y += p.vel.y;
    
    p.vel.y += (0.5 * p.mass);
    if (p.y > (window.innerHeight * 2)) {
      p.remove();
      particles.splice(i, 1);
    }
  }
  requestAnimationFrame(render);
}
pop();
window.setTimeout(render, 700);
window.addEventListener('click', pop);
    </script>





</body>
</html>