<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="studypat.dto.*"%>
	<%@ page import="java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Miminium</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/mediaelementplayer.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/icheck/skins/flat/red.css"/>
  <link href="../asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="../asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<body id="mimin" class="dashboard">
<jsp:include page="/WEB-INF/views/nav.jsp" />
 <div id="content" class="profile-v1">
 <div class="col-md-12 col-sm-12 profile-v1-wrapper">
	<div class="panel box-v7">
		<div class="panel-body">
			<div class="col-md-12 padding-0 box-v7-header">
				<div class="col-md-12 padding-0">
					<div class="col-md-10 padding-0">
						<img src="../asset/img/avatar.jpg" class="box-v7-avatar pull-left" />
						<h4>${post.title}</h4>
						<p>${post.user.nickName}</p>
						${post.category}  
						${post.area}  
						${post.recruitNo}명  
						${post.createDate}
					</div>
					<div class="col-md-2 padding-0">
						<div class="btn-group right-option-v1">
							<i class="icon-options-vertical icons box-v7-menu"
								data-toggle="dropdown"></i>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">수정</a></li>
								<li><a href="#">삭제</a></li>
								<li><a href="#">신고하기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-body">
				<p>${post.postText}</p>
				<div class="col-md-12 top-20">
					<button class="btn">
						<i class="icon-bubble icons"></i> 2
					</button>
					<button class="btn">
						<i class="icon-loop icons"></i> 스크랩하기
					</button>
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-comment">
				<c:forEach var="comm" items="${commentList}">
					<div class="media">
						<div class="media-left">
							<a href="#"> <img src="../asset/img/avatar2.png"
								class="media-object box-v7-avatar" />
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading">${comm.userNo}</h4>
							<p>${comm.commentText}</p>
							<!-- <a href=""> <i class="icon-like icons"></i> 2819
							</a> <a href=""> | Comment</a> -->
						</div>
					</div>
				</c:forEach>

					<div class="media">
						<div class="media-left">
							<a href="#"> <img src="../asset/img/avatar.jpg"
								class="media-object box-v7-avatar" />
							</a>
						</div>
						<div class="media-body">
							<textarea class="box-v7-commenttextbox" name="commentText"
								placeholder="write comments..."></textarea>
							<input type="checkbox" name="secret" value="1"> 비밀글
							<button class="btn" id="commentBtn">작성</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</div>









	<!-- start: Javascript -->
<script src="../asset/js/jquery.min.js"></script>
<script src="../asset/js/jquery.ui.min.js"></script>
<script src="../asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="../asset/js/plugins/icheck.min.js"></script>
<script src="../asset/js/plugins/moment.min.js"></script>
<script src="../asset/js/plugins/mediaelement-and-player.min.js"></script>
<script src="../asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="../asset/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		$('#commentBtn').on('click', function() {
			var postNo = ${post.postNo};
			var userNo = 2;		// login session 값 갖고올 예정
			var commentText = $('textarea[name=commentText]').val();
			var secret = '';
			if($('input[name=secret]').is(':checked')) {
				secret = '1';
			}else {
				secret = '0';
			}
			$.ajax({
				type : "post",
				url : "/studypat/comment/add",
				data : {
					postNo,
					userNo,
					commentText,
					secret
				},
				complete : function() {
					$('textarea[name=commentText]').val('');
					$("input[name=secret]").prop("checked", false);
				},
				success : function(data) {
					if(data == 1) console.log("comment가 정상적으로 입력되었습니다.");
					else console.log("comment 입력 실패");
				}
			})
		});
	});

	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_flat-red',
			radioClass : 'iradio_flat-red'
		});
		$('video,audio').mediaelementplayer({
			alwaysShowControls : true,
			videoVolume : 'vertical',
			features : [ 'playpause', 'progress', 'volume', 'fullscreen' ]
		});
	});
</script>
<!-- end: Javascript -->
</body>
</html>