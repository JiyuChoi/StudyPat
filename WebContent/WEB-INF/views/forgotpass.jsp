<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
    </head>

    <body id="mimin" class="form-signin-wrapper">

      <div class="container">

        <form class="form-signin">
          <div class="panel periodic-login">
              <span class="atomic-number">28</span>
              <div class="panel-body text-center">
                  <h1 class="atomic-symbol">Spot</h1>
                  <p class="atomic-mass">14.072110</p>
                  <p class="element-name">비밀번호 찾기</p>
                  <p class="element-name">가입시 사용한 아이디와 이메일을 입력하세요</p>

                  <i class="icons icon-arrow-down"></i>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" required>
                    <span class="bar"></span>
                    <label>아이디</label>
<!--                     <p>가입시 사용한 아이디를 입력해주세요.</p> -->
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="email" class="form-text" required>
                    <span class="bar"></span>
                    <label>Email</label>
                  </div>
 					<p>해당 이메일로 임시비밀번호가 발송됩니다.</p> 
                  <input type="submit" class="btn col-md-12" value="Reset"/>
              </div>
                <div class="text-center" style="padding:5px;">
                    <a href="login.html">SignIn</a> | 
                    <a href="reg.html">Signup</a>
                </div>
          </div>
        </form>

      </div>

      <!-- end: Content -->
      <!-- start: Javascript -->
      <script src="asset/js/jquery.min.js"></script>
      <script src="asset/js/jquery.ui.min.js"></script>
      <script src="asset/js/bootstrap.min.js"></script>
      <!-- custom -->
      <script src="asset/js/main.js"></script>
      <script type="text/javascript">
       $(document).ready(function(){
         
       });
     </script>
     <!-- end: Javascript -->
   </body>
   </html>