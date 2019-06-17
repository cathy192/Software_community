<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- Custom fonts for this theme -->
  <link href="bootstrap_yen/startbootstrap-freelancer-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="bootstrap_yen/startbootstrap-freelancer-gh-pages/css/freelancer.min.css" rel="stylesheet">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="main.jsp">SOFTWARE DEPARTMENT</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
          <!-- @@@@@@@@@@@회원가입, 로그인, 등등을 만들 곳@@@@@@@@@@@@ -->
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginform.jsp">Sign-Up</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login.jsp">Login</a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>

<title>로그인 페이지</title>
<script type="text/javascript">
	function login(){
		document.form.submit();
	}
	
	function cancel(){
		document.form.reset();
	}	
</script>
</head>
<body style="background-color:#880015;" id="page-top">
<section class="page-section portfolio" id="portfolio">
    <div class="container">
    <h2 style="margin-top:100px;" class="page-section-heading text-center text-uppercase text-white">LOG IN</h2>

      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>
<form style="margin-top:100px;" action="login.do" method="post" name="form">
  <div class="form-group">
    <h4 style="color:white">ID</h4>
    <input type="text" class="form-control" placeholder="Enter ID" name="id">
  </div>
  <div class="form-group">
    <h4 style="color:white">Pass word</h4>
    <input type="password" class="form-control" placeholder="Password" name="password">
  </div>
  	<input type="button" class="btn btn-outline-primary" value="Log in" onClick="login()" />
	<input type="button" class="btn btn-outline-light" value="Register" onClick="window.location='loginform.jsp'" />
</form>
</div>
</section>
  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <div class="row">

        <!-- Footer Location -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Location</h4>
          <p class="lead mb-0">1. Seowon-gu, Cheongju, Chungbuk
            <br>Chungbuk national university</p>
        </div>

        <!-- Footer Social Icons -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Software Site</h4>
          <!-- <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-facebook-f"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-twitter"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="http://www.chungbuk.ac.kr/site/www/main.do" target="_blank">
            <i class="fab fa-fw fa-linkedin-in"></i>
          </a> -->
          <a class="btn btn-outline-light btn-social mx-1" href="https://software.cbnu.ac.kr/" target="_self">
            <i class="fab fa-fw fa-dribbble"></i>
          </a>
        </div>

        <!-- Footer About Text -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">OPEN SOURCE PROJECT TEAM 1</h4>
          <p class="lead mb-0"><b>이예나 남훈 장찬용 김일환</b></p>
        </div>
        

      </div>
    </div>
  </footer>
 <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/vendor/jquery/jquery.min.js"></script>
  <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/js/jqBootstrapValidation.js"></script>
  <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="bootstrap_yen/startbootstrap-freelancer-gh-pages/js/freelancer.min.js"></script>
	
</body>
</html>