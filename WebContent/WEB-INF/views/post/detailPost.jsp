<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="studypat.dto.*"%>
	<%@ page import="java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Detail Post</title>

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
  </head>

<body id="mimin" class="dashboard">
<jsp:include page="/WEB-INF/views/nav.jsp" />
 <div id="content" class="profile-v1">
 <div class="col-md-12 col-sm-12 profile-v1-wrapper">
	<div class="panel box-v7">
		<div class="panel-body detailPost">
			<div class="col-md-12 padding-0 box-v7-header">
				<div class="col-md-12 padding-0">
					<div class="col-md-10 padding-0">
							<span class="badge-info" style="background-color: #918C8C !important;">${post.category}</span>
							<span class="badge-info" style="background-color: #918C8C !important;">${post.area}</span>
								<c:forEach var="tag" items="${post.tagList}">
									<span class="badge-info">${tag.tagName}</span>
								</c:forEach>
								<h3>${post.title}</h3>
								<div style="padding:5px 0;">
									<strong><span class="icon-pencil icon"></span> ${post.user.nickName}</strong></div>
								<div>
									<span><fmt:parseDate value="${post.createDate}" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${parseDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
									<span style="margin-left:5px;"><span class="fa-eye fa"></span> ${post.viewCount}</span>
									<span style="margin-left:5px;"><span class="fa-comment fa"></span> ${post.commentCount}</span>
									<span style="margin-left:5px;"><span class="icon-star icon"></span> ${post.scrapCount}</span>
									<span style="margin-left:5px;"><span class="icon-people icon"></span> ${post.recruitNo}명</span>
								<div style="margin-top:30px;">${post.postText}</div>
					</div> 
					</div>
					
					<div class="col-md-2 padding-0">
						<div class="btn-group right-option-v1">
							<i class="icon-options-vertical icons box-v7-menu"
								data-toggle="dropdown"></i>
							<ul class="dropdown-menu" role="menu">
								<c:if test="${user.admin eq '1'.charAt(0) or post.userNo eq user.userNo}">
									<li><a href="/studypat/updatePost/${post.postNo}">수정</a></li>
									<li><a href="/studypat/deletePost/${post.postNo}">삭제</a></li>
								</c:if>
								<li><a onclick="report(${post.postNo})">신고하기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-body">
				<div class="col-md-12 top-20" id="scrap">
					<!-- 스크랩 버튼 출력 -->
				</div>
			</div>
			<div class="col-md-12 padding-0 box-v7-comment">
					<div id="commList">
						<!-- 댓글 List 들어옴 -->
					</div>
				<c:if test="${login}">
					<div class="media">
						<div class="media-body">
							<textarea class="box-v7-commenttextbox" name="commentText"
								placeholder="write comments..."></textarea>
							<div style="float:right;">
								<input class="icheckbox_flat-red" type="checkbox" name="secret"> 비밀글
								<button class="btn" id="commentBtn">작성</button>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${login eq false}">
					<div class="media">
						<div class="media-body">
							<textarea class="box-v7-commenttextbox" name="commentText"
								placeholder="로그인 후 댓글 작성 가능합니다"></textarea>
						</div>
					</div>
				</c:if>
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
var admin = null;
var userNo = null;
var postUserNo = null;
if(${login}) admin = ${loginUser.admin} + "";
if(${login}) userNo = ${loginUser.userNo} + "";
if(${login}) postUserNo = ${post.userNo} + "";

	function addScrap(postNo) {
		/* var userNo = ${loginUser.userNo}; */
		$.ajax({
			type : "post",
			url : "/studypat/scrap/add",
			data : {
				"userNo" : userNo,
				"postNo" : postNo
			}, success : function(data) {
				isScrap();
			}
		})
	}
	
	function deleteScrap(postNo) {
	/* 	var userNo = ${loginUser.userNo}; */
		$.ajax({
			type : "post",
			url : "/studypat/scrap/delete",
			data : {
				"userNo" : userNo,
				"postNo" : postNo
			}, success : function(data) {
				isScrap();
			}
		});
	};
	
	function isScrap() {
		var postNo = ${post.postNo};
		$.ajax({
			type : "post",
			url : "/studypat/scrap",
			data : {
				"userNo" : userNo,
				"postNo" : postNo
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
			}, error : function(e) {
				
			}
		});
	};
	
	function delComm(commentNo) {
		$.ajax({
			type : "get",
			url : "/studypat/comment/delete/" + commentNo,
			success : function(data) {
				getCommentList();
			}
		});
	};
	
	function report(postNo) {
		$.ajax({
			type : "get",
			url : "/studypat/post/report/" + postNo,
			success : function(data) {
				
			}
		});
	};
	
	function getCommentList(){
		$.ajax({
			type : "get",
			url : "/studypat/comment/" + ${post.postNo},
			success : function(data){
		        var str = "";
		        $.each(data, function () {
		        	str +="<div class='media'>"
		            	+ "<div class='media-body'>"
		            	+ "<h4 class='media-heading'>" + this.user.nickName;
 		        		if(this.userNo == userNo || admin == 1 ){
		        			str += "<span class='fa-trash-o fa' style='float: right;' onclick='delComm(" + this.commentNo + ")'></span>";
		        		}
		            str	+= "</h4>";
			            if(this.secret == 1){
			 		    	str += "<p> 비밀 댓글 입니다. </p>";
 		 		        	if(this.userNo == userNo || admin == 1 || userNo == postUserNo ) {
		 		        		str += "<p>" + this.commentText + "</p>";
				 		    }
			            }else{
	 			        		str += "<p>" + this.commentText + "</p>";
		    	        }
	        		str += "</div> </div>";
	            });
		        $("#commList").html(str);
		      }
	    })
	}
	
	$(function() {
		$('#commentBtn').on('click', function() {
			var postNo = ${post.postNo};
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
					userNo,
					postNo,
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
		getCommentList();		// 댓글 목록
		isScrap();				// 스크랩 확인
	});
</script>
<!-- end: Javascript -->
</body>
</html>