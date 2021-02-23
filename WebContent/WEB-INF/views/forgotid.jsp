<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Forgot ID</title>

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
<%
String userid = (String) session.getAttribute("findID");
if (userid == null) userid = "";
String errMsg = (String) session.getAttribute("errMsg");
if(errMsg==null) errMsg = "";
session.invalidate();
%>
      <div class="container" style="margin-top: 150px;">

        <form class="form-signin" action="forgotid" method="post">
          <div class="panel periodic-login">
              <div class="panel-body text-center">
					<h1 class="atomic-symbol">StudyPat</h1>
 					<p class="element-name">아이디 찾기</p>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" name="email" required>
                    <span class="bar"></span>
                    <label>Email</label>
                    <p>가입시 사용한 이메일을 입력하세요</p>
                  </div>
				<div id="errMsg" style="color:red;"><%=errMsg %></div>
                  <input type="submit" class="btn col-md-12" value="아이디 찾기"/>
			
              </div>
             
                <div class="text-center" style="padding:5px;">
                    <a href="/studypat/">로그인</a> | 
                    <a href="join">회원가입</a>
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

	<script type="text/javascript">
	
		var userid = '<%=userid%>';
		if (userid != "") {
			alert("아이디는 " + userid + "입니다.")
		}

	</script>
	
     <!-- end: Javascript -->
   </body>
   </html>