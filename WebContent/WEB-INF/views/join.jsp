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
						<!-- 아이디 -->
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="text" class="form-text" name="id" id="id" required> 
							<span class="bar"></span> <label>아이디</label>
							<div class="check_font" id="id_check"></div>
						</div>
							
						<!-- 이메일 -->
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="email" class="form-text" name="email" id="email" required> 
							<span class="bar"></span> <label>이메일</label>
							<div class="check_font" id="email_check"></div>
						</div>
						<!-- 비밀번호 -->
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="password" class="form-text" name="password" required> 
							<span class="bar"></span> <label>비밀번호</label>
						</div>
						<!-- 닉네임 -->
						<div class="form-group form-animate-text" style="margin-top: 40px !important;">
							<input type="text" class="form-text" name="nickName" id="nickName" required> 
							<span class="bar"></span> <label>닉네임</label>
							<div class="check_font" id="nickName_check"></div>
						</div> 
						<input type="submit" class="btn col-md-12" value="회원가입" onclick="doSignUp();"/>
						<!-- <input type="button" class="btn col-md-12" value="네이버계정으로 가입"/> -->
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
	

    
	<!-- 아이디 검사 Ajax -->
	<script>
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#id").blur(function() {
			var user_id = $('#id').val();
			$.ajax({
				url : '/studypat/join/idCheck?id='+ user_id,
				type : 'get',
				success : function(data) {
					//console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#id_check").text("중복된 아이디가 존재합니다.");
							$("#id_check").css("color", "red");
						} else {
							if (user_id != ""){
							$("#id_check").text("사용가능한 아이디입니다.");
							$("#id_check").css("color", "blue");
							} else{
								$("#id_check").text("");
							}
							
						}
					}, error : function() {
							console.log("실패");
					}
				});
			});
	</script>
	
	<!-- 이메일 검사 Ajax-->
	<script>
	// 이메일 유효성 검사(1 = 중복 / 0 != 중복)
		$("#email").blur(function() {
			var user_email = $('#email').val();
			$.ajax({
				url : '/studypat/join/emailCheck?email='+ user_email,
				type : 'get',
				success : function(data) {
					//console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {// 1 : 이메일 중복된 경우 
							$("#email_check").text("중복된 이메일이 존재합니다.");
							$("#email_check").css("color", "red");
					} else {
						if (user_email != "") {
							if (user_email.indexOf("@") === -1) {
								$("#email_check").text("이메일 형식으로 입력해주세요.");
								$("#email_check").css("color", "red");
							} else{
								$("#email_check").text("사용가능한 이메일입니다.");
								$("#email_check").css("color", "blue");
							}
						} else{ //아무것도 입력하지 않은 경우
							$("#email_check").text("");
							}
						}
					}, error : function() {
							console.log("실패");
					}
				});
			});
	</script>
	
	<!-- 닉네임 검사 Ajax-->
	<script>
	// 닉네임 유효성 검사(1 = 중복 / 0 != 중복)
		$("#nickName").blur(function() {
			var user_nickName = $('#nickName').val();
			$.ajax({
				url : '/studypat/join/nickNameCheck?nickName='+ user_nickName,
				type : 'get',
				success : function(data) {
					//console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 닉네임 중복
							$("#nickName_check").text("이미 사용중인 닉네임입니다.");
							$("#nickName_check").css("color", "red");
						} else {
							if (user_nickName != ""){
							$("#nickName_check").text("사용가능한 닉네임입니다.");
							$("#nickName_check").css("color", "blue")
							}
							else{
								$("#nickName_check").text("");
								}
						}
					}, error : function() {
							console.log("실패");
					}
				});
			});
	</script>
	<script>
      	function doSignUp() {
      		if ($("#id_check").text() === ("사용가능한 아이디입니다.")
      				&& $("#email_check").text() === ("사용가능한 이메일입니다.")
      				&& $("#nickName_check").text() ===("사용가능한 닉네임입니다.")) {
      			alert("StudyPat에 가입되었습니다!");
      		} else {
      			alert("회원가입에 실패했습니다.")
      		}
      	}
    </script>
	<!-- end: Javascript -->
</body>
</html>