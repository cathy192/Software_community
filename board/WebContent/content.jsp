<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="euc-kr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
      <a class="navbar-brand js-scroll-trigger" href="#page-top">SOFTWARE DEPARTMENT</a>
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
<title>게시판</title>
</head>

<body style="background-color:#880015;" id="page-top">
<section class="page-section portfolio" id="portfolio">
    <div class="container">
    <h2 style="margin-top:100px;" class="page-section-heading text-center text-uppercase text-white">CONTENT</h2>
      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>
	<div style="text-align:right">
	사용자ID : ${id} <input type=button class="btn btn-outline-info" value="Log out" OnClick="window.location='logout.do'">
	</div>
	<c:forEach items="${articleList}" var="article">
	<table class="table table-striped table-bordered" style="text-align:center; color:white;">	
		<tr>
			<td>제목</td>
			<td colspan="7" style="text-align:left; " >${article.subject}</td>			
		</tr>
		<tr>
			<td>작성자</td>
			<td style="text-align:left; " >${article.id}</td>						
		
			<td>카테고리</td>
			<td style="text-align:left;">${article.category}</td>						
		</tr>
		<tr>
			<td>작성일자</td>
			<td style="text-align:left; " >${article.boarddate}</td>						
		
			<td>조회수</td>
			<td style="text-align:left; " >${article.score}</td>						
		</tr>
		</table>
	<table class="table table-striped table-bordered" style="color:white;">	
		<tr>
			<td colspan="8" style=" color:black; text-align:left; height:250px; font-size:30px; background-color:white;  ">${article.content}</td>						
		</tr>
	</table>
		<tr>
			
			<td style="text-align:left"><img src="${article.img}" width="250" height="150" /></td>						
		</tr>	
	</table>
	<div style="text-align:right">
		<input type=button class="btn btn-outline-danger" value="삭제하기" OnClick="window.location='delete.do?num=${article.num}'">
		<input type=button class="btn btn-outline-warning" value="수정하기" OnClick="window.location='modifyform.do?num=${article.num}'">			
		<input type=button class="btn btn-outline-secondary" value="돌아가기" OnClick="window.location='best.do'">
	</div>
	</c:forEach>
	</div>
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@댓글부분@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<!-- 여기는 댓글창이 보여지는곳 -->
	<h2 style="margin-left: 20px; color: white;">댓글</h2>
	<br/>
	<table class="table table-striped table-bordered " style="text-align:center; color:white;">
		
		<tr>
			<td width="250px">아이디</td>
			<td width="120px">작성일자</td>
			<td>댓글 내용</td>
		</tr>
		
		<c:forEach items="${commentList}" var="comment">
		<tr>
			<td>${comment.id}</td>
			<td>${comment.boarddate}</td>
			<td style="text-align-last:justify;">${comment.content}
			<%-- <c:if test="${comment.id eq id}">
				<%int num=Integer.parseInt(request.getParameter("num2")); %>
				<input type=button class="btn btn-danger" value="삭제하기" OnClick="window.location='commentsdelete.do?num=${comment.num}&num=<%=num%>'" >
			</c:if> --%>
			</td>
		</tr>
		</c:forEach>
	</table>
	<c:forEach items="${articleList}" var="article">
	<form id="inform" action="/board/commentwrite.do?num=${article.num}" method="post" style="margin-bottom:10;" onsubmit="return writeCheck();">
		<table class="table table-striped table-bordered " style="text-align:left; ;">
			<tr>
				<td  style="color: white;"width="250px">${id}</td>
				<td><input  type="text" id="comment" name="comment" placeholder="내용을 입력하세요" size="100"></td>
				<td><input type=submit class="btn btn-success" value="등록" Onclick="javascript:writeCheck();"></td>
			</tr>	
		</table>
	</form>
	</c:forEach>
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
</body>
</html>