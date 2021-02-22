<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="studypat.dao.*"%>
<%@ page import="studypat.dto.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<head>

<meta charset="utf-8">
<meta name="description" content="Miminium Admin Template v.1">
<meta name="author" content="Isna Nur Azis">
<meta name="keyword" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StuydPat Join</title>

<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/icheck/skins/flat/aero.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->

<link rel="shortcut icon" href="asset/img/logomi.png">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->

</head>

<body id="mimin" class="dashboard form-signin-wrapper">
	
	<div class="container">
		<jsp:include page="/WEB-INF/views/nav.jsp" />
		
		<form class="form-signin" action="join" method="post">
			<div class="panel periodic-login">
				<span class="atomic-number">28</span>
				<div class="panel-body text-center">
					<p class="atomic-mass">스터디를 구하고 있다면</p>
					<p class="element-name">지금, 바로!</p>
					<h1 class="atomic-symbol">StudyPat</h1>
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="text" class="form-text" name="id" required> 
							<span class="bar"></span> <label>아이디</label>
						</div>
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="text" class="form-text" name="email"required> 
							<span class="bar"></span> <label>이메일</label>
						</div>
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="password" class="form-text" name="password" required> 
							<span class="bar"></span> <label>비밀번호</label>
						</div>
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="text" class="form-text" name="nickName" required> 
							<span class="bar"></span> <label>닉네임</label>
						</div> 
						<input type="submit" class="btn col-md-12" value="회원가입"/>
						<input type="button" class="btn col-md-12" value="네이버계정으로 가입"/>
				</div>
				
				<div class="text-center" style="padding: 5px;">
					<a href="/studypat/">이미 계정이 있으신가요?</a>
				</div>
			</div>
		</form>
	</div>
	

	<!-- end: Content -->
	<!-- start: Javascript -->
	<script src="asset/js/jquery.min.js"></script>
	<script src="asset/js/jquery.ui.min.js"></script>
	<script src="asset/js/bootstrap.min.js"></script>

	<script src="asset/js/plugins/moment.min.js"></script>
	<script src="asset/js/plugins/icheck.min.js"></script>
 
    <script src="asset/js/plugins/fullcalendar.min.js"></script>
    <script src="asset/js/plugins/jquery.nicescroll.js"></script>
    <script src="asset/js/plugins/jquery.vmap.min.js"></script>
    <script src="asset/js/plugins/maps/jquery.vmap.world.js"></script>
    <script src="asset/js/plugins/jquery.vmap.sampledata.js"></script>
    <script src="asset/js/plugins/chart.min.js"></script>

	<!-- custom -->
	<script src="asset/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_flat-aero',
				radioClass : 'iradio_flat-aero'
			});
		});
	</script>
	<!-- end: Javascript -->
</body>
</html>