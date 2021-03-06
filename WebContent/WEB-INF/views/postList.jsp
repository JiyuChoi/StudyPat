<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="studypat.dao.*"%>
<%@ page import="studypat.dto.*"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Study Post</title>

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
					<h3 class="animated fadeInLeft">${category}</h3>
				</div>
			</div>
		</div>

		<div class="col-md-12 padding-0" style="padding: 0 20px 20px;">
			<div class="col-md-6" style="padding-left: 10px; width: 870px;">
				<div>
					<a onclick="location.href='/studypat/category?category=${category}&sort=createDate&area=${area}&tag=${tag}&search=${search}'" <c:if test="${sort eq 'createDate'}"> style="color:#2196F3 !important;"</c:if>><span>최신순 </span></a>
					<a onclick="location.href='/studypat/category?category=${category}&sort=comment&area=${area}&tag=${tag}&search=${search}'" <c:if test="${sort eq 'comment'}">style="color:#2196F3 !important;"</c:if>><span>댓글순 </span></a>
					<a onclick="location.href='/studypat/category?category=${category}&sort=view&area=${area}&tag=${tag}&search=${search}'" <c:if test="${sort eq 'view'}">style="color:#2196F3 !important;"</c:if>><span>조회순 </span></a>
					<a onclick="location.href='/studypat/category?category=${category}&sort=scrap&area=${area}&tag=${tag}&search=${search}'" <c:if test="${sort eq 'scrap'}">style="color:#2196F3 !important;"</c:if>><span>스크랩순 </span></a>
				
					<select onchange="if(this.value) location.href=(this.value);">
						<option value="/studypat/category?category=${category}&sort=${sort}&area=all&tag=${tag}">전체</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=서울&tag=${tag}" 
							<c:if test="${area eq '서울'}">selected</c:if>>서울
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=경기&tag=${tag}" 
							<c:if test="${area eq '경기'}">selected</c:if>>경기
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=인천&tag=${tag}" 
							<c:if test="${area eq '인천'}">selected</c:if>>인천
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=대전&tag=${tag}" 
							<c:if test="${area eq '대전'}">selected</c:if>>대전
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=대구&tag=${tag}" 
							<c:if test="${area eq '대구'}">selected</c:if>>대구
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=부산&tag=${tag}" 
							<c:if test="${area eq '부산'}">selected</c:if>>부산
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=광주&tag=${tag}" 
							<c:if test="${area eq '광주'}">selected</c:if>>광주
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=세종&tag=${tag}" 
							<c:if test="${area eq '세종'}">selected</c:if>>세종
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=울산&tag=${tag}" 
							<c:if test="${area eq '울산'}">selected</c:if>>울산
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=충북&tag=${tag}" 
							<c:if test="${area eq '충북'}">selected</c:if>>충북
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=충남&tag=${tag}" 
							<c:if test="${area eq '충남'}">selected</c:if>>충남
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=전북&tag=${tag}" 
							<c:if test="${area eq '전북'}">selected</c:if>>전북
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=전남&tag=${tag}" 
							<c:if test="${area eq '전남'}">selected</c:if>>전남 
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=경북&tag=${tag}" 
							<c:if test="${area eq '경남'}">selected</c:if>>경남
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=강원&tag=${tag}" 
							<c:if test="${area eq '강원'}">selected</c:if>>강원
						</option>
						<option value="/studypat/category?category=${category}&sort=${sort}&area=제주&tag=${tag}" 
							<c:if test="${area eq '제주'}">selected</c:if>>제주
						</option>
						
					</select> 
				<button type="button" class="btn btn-default" onclick="goPage()" style="float: right;">
					글쓰기 
				</button>
			</div>
			<div>
					<c:if test="${tag ne ''}"><span> 태그 [${tag}]으로 검색한 결과입니다.</span>
					<a onclick="location.href='/studypat/category?category=${category}&sort=${sort}&area=${area}&search=${search}'"><span>태그검색해제</span></a>
					</c:if>
			</div>
			</div>
		</div>
	
	<c:forEach var="post" items="${postList}">
		<div class="col-md-12 col-sm-12 profile-v1-wrapper" id="postNo${post.postNo}">
			<div class="panel box-v7">
				<div class="panel-body">
					<div class="col-md-12 padding-0 box-v7-header">
						<div class="col-md-12 padding-0">
							<div class="col-md-10 padding-0">
								<span class="badge-info" style="background-color: #918C8C !important;">${post.category}</span>
								<span class="badge-info" style="background-color: #918C8C !important;">${post.area}</span>
								<c:forEach var="tag" items="${post.tagList}">
									<span class="badge-info" style="margin-right:5px;">
										<a onclick="location.href='/studypat/category?category=${category}&sort=${sort}&area=${area}&tag=${tag.tagName}&search=${search}'">${tag.tagName}</a>
									</span>
								</c:forEach>
									<h4><a href='/studypat/post/${post.postNo}'>${post.title}</a></h4>
									<span><fmt:parseDate value="${post.createDate}" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${parseDate}"  pattern="yyyy-MM-dd"/></span>
									<span style="margin-left:5px;"><span class="fa-eye fa"></span> ${post.viewCount}</span>
									<span style="margin-left:5px;"><span class="fa-comment fa"></span> ${post.commentCount}</span>
									<span style="margin-left:5px;"><span class="icon-star icon"></span> ${post.scrapCount}</span>
							</div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/studypat/category?category=${category}&sort=${sort}&area=${area}&tag=${tag}&search=${search}&nowPage=${paging.startPage-1}">&lt;</a>
		</c:if>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b style="color:#2196F3 !important;">${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/studypat/category?category=${category}&sort=${sort}&area=${area}&tag=${tag}&search=${search}&nowPage=${p}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/studypat/category?category=${category}&sort=${sort}&area=${area}&tag=${tag}&search=${search}&nowPage=${paging.endPage+1}">&gt;</a>
		</c:if>
		
	</div>
</div>


	<!-- start: Javascript -->
<script src="/studypat/asset/js/jquery.min.js"></script>
<script src="/studypat/asset/js/jquery.ui.min.js"></script>
<script src="/studypat/asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="/studypat/asset/js/plugins/icheck.min.js"></script>
<script src="/studypat/asset/js/plugins/moment.min.js"></script>
<script src="/studypat/asset/js/plugins/mediaelement-and-player.min.js"></script>
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
  
  function goPage() {
	  
	  	var userId = null;
	  	<% 
	  		studypat.dto.User user = (studypat.dto.User) session.getAttribute("user"); 
	  		if(user != null){ %>
	  		userId = "<%=user.getId()%>";
	  	<%}%>
	 	
		if(userId == null){
			alert("로그인을 해주세요.");
			return;
		}
		location.href = '/studypat/uploadPostForm?category=${category}';
	};
 
</script>
<!-- end: Javascript -->
</body>
<style>

a { 
 color : #58666e;

}

span a {
	color : white !important;
}
</style>
</html>