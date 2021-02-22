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
								<c:if test="${user.admin eq '1'.charAt(0) or post.userNo eq user.userNo}">
									<li><a href="#">수정</a></li>
									<li><a href="#">삭제</a></li>
								</c:if>
								<li><a href="#">신고하기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-body">
				<p>${post.postText}</p>
				<div class="col-md-12 top-20" id="scrap">
					<!-- 스크랩 버튼 출력 -->
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-comment">
				<c:if test="${user.admin eq '1'.charAt(0) or post.userNo eq user.userNo}">
					<div id="commList">
						<!-- 댓글 List 들어옴 -->
					</div>
				</c:if>
				<c:if test="${user.admin ne '1'.charAt(0) or post.userNo ne user.userNo}">
				</c:if>
				<div class="media">
					<div class="media-body">
						<textarea class="box-v7-commenttextbox" name="commentText"
							placeholder="write comments..."></textarea>
						<input class="icheckbox_flat-red" type="checkbox" name="secret"> 비밀글
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
	function addScrap(postNo) {
		var userNo = ${loginUser.userNo};
		$.ajax({
			type : "post",
			url : "/studypat/scrap/add",
			data : {
				userNo,
				postNo
			}, success : function(data) {
				isScrap();
			}
		});
	};
	
	function deleteScrap(postNo) {
		var userNo = ${loginUser.userNo};
		$.ajax({
			type : "post",
			url : "/studypat/scrap/delete",
			data : {
				userNo,
				postNo
			}, success : function(data) {
				isScrap();
			}
		});
	};
	
	function isScrap() {
		var postNo = ${post.postNo};
		var userNo = ${loginUser.userNo};
		$.ajax({
			type : "post",
			url : "/studypat/scrap",
			data : {
				userNo,
				postNo
			}, success : function(data) {
				var str = "<button class='btn' onclick='";
				if(data == 1) {
					str += "deleteScrap(" + postNo + ")' style='color : #FFB400'>"
						+ "<i class='icon-star icons'></i> 스크랩 삭제 </button>"
				}else {
					str += "addScrap(" + postNo + ")'>"
						+ "<i class='icon-star icons'></i> 스크랩하기 </button>"
				}
				$("#scrap").html(str);
			}
		});
	};
	
	function getCommentList() {
		
		$.ajax({
			type : "get",
			url : "/studypat/comment/" + ${post.postNo},
			success : function(data) {
		        var str = "";
		        $(data).each(function () {
		        	/* 	if(this.userNo == userNo || admin == '1'.charAt(0) || userNo == postUserNo){ */ 
 		        		str +="<div class='media'>"
			            	+ "<div class='media-body'>"
			            	+ "<h4 class='media-heading'>" + this.userNo + "</h4>"
 		        	if(this.userNo == ${user.getUserNo()} || ${user.getAdmin()} == 1 || ${user.getUserNo()} == ${post.userNo}){
 		        		str += "<p>" + this.commentText + "</p>"
 		        	}else {
		 		    	str += "<p> 비밀 댓글 입니다. </p>"
		 		    }
			            str += "</div> </div>";
		        });
		        $("#commList").html(str);
			}
	    });
	}
	
	$(function() {
		$('#commentBtn').on('click', function() {
			var postNo = ${post.postNo};
			var userNo = ${loginUser.userNo};
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
				}, complete : function() {
					$('textarea[name=commentText]').val('');
 					$("input[type=checkbox]").prop("checked", false);
				}, success : function(data) {
					if(data == 1) getCommentList();
					else console.log("comment 입력 실패");
				}
			})
		});
	});

	$(document).ready(function() {
		var admin = ${loginUser.admin};
		var userNo = ${loginUser.userNo};
		var postUserNo = ${post.userNo};
		getCommentList();		// 댓글 목록
		isScrap();				// 스크랩 확인
	});
</script>
<!-- end: Javascript -->
</body>
</html>