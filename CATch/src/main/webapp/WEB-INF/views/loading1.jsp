
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Insert title here</title>

	<link rel="stylesheet" href="css/catcardloding.css">
</head>
<body>
	 <div id="load">
        <video muted autoplay loop>
          <source src="img/catmove.mp4" type="video/mp4">
        </video>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(window).load(function() {
    $('#load').hide();
	}); 
	</script>

</body>
</html>