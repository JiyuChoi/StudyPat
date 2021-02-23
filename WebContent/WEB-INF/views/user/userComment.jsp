<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="studypat.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>My Comment</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/mediaelementplayer.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/icheck/skins/flat/red.css"/>
  <link href="/studypat/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="/studypat/asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<body id="mimin" class="dashboard">
<jsp:include page="/WEB-INF/views/nav.jsp" />
 <div id="content" class="profile-v1">

		<div class="panel box-shadow-none content-header">
			<div class="panel-body">
				<div class="col-md-12">
					<h3 class="animated fadeInLeft">내 댓글</h3>
				</div>
			</div>
		</div>
 
			<c:forEach var="comment" items="${commentListUser}">
				<div class="col-md-12 col-sm-12 profile-v1-wrapper" style="width:900px; postion:absolute; top:10px; left:15px;">
					<div class="panel box-v7" >
						<div class="panel-body">
							<div class="col-md-12 padding-0 box-v7-header">
								<div class="col-md-12 padding-0">
									<div class="col-md-10 padding-0"> 
										<h4><a href='/studypat/post/${comment.postNo}'>${comment.commentText}</a></h4>
										<span>작성일:${comment.createDate}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach> 
</div>









	<!-- start: Javascript -->
<script src="/studypat/asset/js/jquery.min.js"></script>
<script src="/studypat/asset/js/jquery.ui.min.js"></script>
<script src="/studypat/asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="/studypat/asset/js/plugins/icheck.min.js"></script>
<script src="/studypat/asset/js/plugins/moment.min.js"></script>
<script src="/studypat//asset/js/plugins/mediaelement-and-player.min.js"></script>
<script src="/studypat/asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="/studypat/asset/js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
   $('input').iCheck({
    checkboxClass: 'icheckbox_flat-red',
    radioClass: 'iradio_flat-red'
  });
   $('video,audio').mediaelementplayer({
            alwaysShowControls: true,
            videoVolume: 'vertical',
            features: ['playpause','progress','volume','fullscreen']
          });
 });
</script>
<!-- end: Javascript -->
</body>
</html>