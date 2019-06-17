<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
    <script> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
function writeCheck()
  {
   var form = document.writeform;
   
  if( !form.subject.value )
   {
    alert( "������ �����ּ���" );
    form.subject.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "������ �����ּ���" );
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
	$("#fileInput").on('change', function(){  // ���� ����Ǹ�
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // ���ϸ� ����
		}
		// ������ ���ϸ� ����
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
          <!-- @@@@@@@@@@@ȸ������, �α���, ����� ���� ��@@@@@@@@@@@@ -->
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginform.jsp">Sign-Up</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login.jsp">Login</a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
  <title>�۾���</title>

</head>

<body style="background-color:#880015">
<section class="page-section portfolio" id="portfolio">
    <div class="container">
    <h2 style="margin-top:100px;" class="page-section-heading text-center text-uppercase text-white">Write</h2>


    </div>
</section>
	<div style="text-align:right; color:white;">
		�����ID : ${id} <input type=button class="btn btn-outline-warning" value="�α׾ƿ�" OnClick="window.location='logout.do'">
	</div>
	<div  style=" margin-top: 60px;" class="container">
	<form id="inform" action ="/board/write.do" method="post">
		<table  class="table table-borderless">
		<!--  	<caption style="text-align:center">�Խ��� �ۼ�</caption> -->
			<tr >
				<th>�۹�ȣ</th>
				<td >�۹�ȣ</td>
			
				<th>ī�װ�</th>
				<td >    
					<select class="form-control" name="category">
						 <option value="">����</option>
						<option value="1" <c:if test="${category == 1}"> selected </c:if>>ȫ��</option> 
					    <option value="2" <c:if test="${category == 2}"> selected </c:if>>����</option> 
					    <option value="3" <c:if test="${category == 3}"> selected</c:if>>����</option>
					    <option value="4" <c:if test="${category == 4}"> selected</c:if>>�ڷ�</option>
					    <option value="5" <c:if test="${category == 5}"> selected</c:if>>����</option>
					    <option value="6" <c:if test="${category == 6}"> selected</c:if>>����</option>
					</select>
				</td>
			</tr>
			<tr >
				<th style="font-size:20; color:white;">Title</th>
				<td ><input type="text" name="subject" class="form-control" placeholder="������ �Է��ϼ���. "></td>
			
				<th style="font-size:20; color:white;">Writer</th>
				<td >${id} </td>
				
			</tr>
			
			<tr >	
				<th style="font-size:20; color:white;">Content</th>
				<td colspan="3"><textarea class="form-control" name="content"  rows="20" cols="50" placeholder="������ �Է��ϼ���" form="inform"></textarea></td>
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
          <p class="lead mb-0"><b>�̿��� ���� ������ ����ȯ</b></p>
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