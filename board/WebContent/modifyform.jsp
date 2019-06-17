<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
		function writeCheck()
		  {
		   var form = document.writeform;
		   
		  if( !form.subject.value )
		   {
		    alert( "제목을 적어주세요" );
		    form.subject.focus();
		    return;
		   }
		 
		  if( !form.content.value )
		   {
		    alert( "내용을 적어주세요" );
		    form.content.focus();
		    return;
		   }  
		 
		  form.submit();
		  }
 	</script>
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

            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="join.jsp">Sign-Up</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login.jsp">Login</a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
  <title>BOARD 테이블 레코드 삽입</title>
</head>
<body style="background-color: #880015">
		<div style="text-align:right">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<div  style=" margin-top: 70px;" class="container">
	<form action ="/board/modify.do" method="post">
		<c:forEach items="${articleList}" var="article">
			<input type="hidden" name="num" value="${article.num}">
			<table  class="table table-borderless">	
				<tr> 
					<th style="font-size:20; color:white;">Title</th>
					<td><input type="text" name="subject" class="form-control" value="${article.subject}"></td>
				</tr>
				<tr>	
					<th style="font-size:20; color:white;">Writer</th>
					<td style="font-size:15; color:white;">${article.id} </td>
				</tr>
				<tr>	
					<th style="font-size:20; color:white;">Date</th>
					<td style="font-size:15; color:white;">${article.boarddate}</td>
				</tr>
				
				<tr>	
					<th style="font-size:20; color:white;">Content</th>
					<td style="height:200px; width:100px;text-align:left"><input style="height:200px; width:800px;" type="text" name="content" class="form-control" placeholder="내용을 입력하세요" value="${article.content}"></td>
				</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=submit class="btn btn-warning" value="수정" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>	
			</table>
		</c:forEach>
	</form>
	</div>
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