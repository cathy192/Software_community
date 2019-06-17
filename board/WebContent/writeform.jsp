<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
    <script> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 
 <script>
 function getSelectValue(frm)
 {
 	 frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
 }
 function readURL(input) {
		if (input.files && input.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				$('.image-upload-wrap').hide();

				$('.file-upload-image').attr('src', e.target.result);
				$('.file-upload-content').show();

				$('.image-title').html(input.files[0].name);
			};

			reader.readAsDataURL(input.files[0]);

		} else {
			removeUpload();
		}
	}


function removeUpload() {
		$('.file-upload-input').replaceWith($('.file-upload-input').clone());
		$('.file-upload-content').hide();
		$('.image-upload-wrap').show();
	}
	$('.image-upload-wrap').bind('dragover', function() {
		$('.image-upload-wrap').addClass('image-dropping');
	});
	$('.image-upload-wrap').bind('dragleave', function() {
		$('.image-upload-wrap').removeClass('image-dropping');
	});
 </script>
 <script type="text/javascript">

$(document).ready(function(){
	$("#fileInput").on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		// 추출한 파일명 삽입
		$("#userfile").val(filename);
	});

});

</script>


<html>
<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>writeform</title>

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
  <title>글쓰기</title>

</head>

<body style="background-color:#880015">
<section class="page-section portfolio" id="portfolio">
    <div class="container">
    <h2 style="margin-top:100px;" class="page-section-heading text-center text-uppercase text-white">Write</h2>


    </div>
</section>
	<div style="text-align:right; color:white;">
		사용자ID : ${id} <input type=button class="btn btn-outline-warning" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<div  style=" margin-top: 60px;" class="container">
	<form id="inform" action ="/board/write.do" method="post">
		<table  class="table table-borderless">
		<!--  	<caption style="text-align:center">게시판 작성</caption> -->
			<tr >
				<th>글번호</th>
				<td >글번호</td>
			
				<th>카테고리</th>
				<td >    
					<select class="form-control" name="category">
						 <option value="">구분</option>
						<option value="1" <c:if test="${category == 1}"> selected </c:if>>홍보</option> 
					    <option value="2" <c:if test="${category == 2}"> selected </c:if>>장터</option> 
					    <option value="3" <c:if test="${category == 3}"> selected</c:if>>정보</option>
					    <option value="4" <c:if test="${category == 4}"> selected</c:if>>자료</option>
					    <option value="5" <c:if test="${category == 5}"> selected</c:if>>공지</option>
					    <option value="6" <c:if test="${category == 6}"> selected</c:if>>자유</option>
					</select>
				</td>
			</tr>
			<tr >
				<th style="font-size:20; color:white;">Title</th>
				<td ><input type="text" name="subject" class="form-control" placeholder="제목을 입력하세요. "></td>
			
				<th style="font-size:20; color:white;">Writer</th>
				<td >${id} </td>
				
			</tr>
			
			<tr >	
				<th style="font-size:20; color:white;">Content</th>
				<td colspan="3"><textarea class="form-control" name="content"  rows="20" cols="50" placeholder="내용을 입력하세요" form="inform"></textarea></td>
			</tr>	
			<tr>
				<th style="font-size:20; color:white;">File</th>
				<td colspan="3"><div class="form-group">
				<br style="clear:both;"/>
				<div class="file-upload">
					<div class="image-upload-wrap">
						<input class="file-upload-input" type='file'
							onchange="readURL(this);" accept="image/*" name="img" required />
					</div>
				</div>

				<br style="clear:both;"/>
				</td>
			</tr>
			<tr>
				<th></th>
				<td colspan="3" >		
					<input type=submit class="btn btn-outline-success" value="Write" Onclick="javascript:writeCheck();">
					
					<input type=button class="btn btn-outline-warning" value="Cancle" OnClick="window.location='main.jsp'">
				</td>
			</tr>
			
		</table>
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
	 </footer>
	  <!-- Bootstrap core JavaScript -->
  <!-- Bootstrap core JavaScript -->
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