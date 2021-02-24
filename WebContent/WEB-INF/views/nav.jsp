<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="description" content="Miminium Admin Template v.1">
<meta name="author" content="Isna Nur Azis">
<meta name="keyword" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudyPat</title>

<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->

<link rel="shortcut icon" href="asset/img/logomi.png">
</head>
<body>
	<%
		if(session.getAttribute("user") != null){
			studypat.dto.User user = (studypat.dto.User) session.getAttribute("user");
			session.setAttribute("loginUser",user);
			session.setAttribute("login", true);
		}else {
			session.setAttribute("loginUser",null);
			session.setAttribute("login", false);
		}
	%>

	<nav class="navbar navbar-default header navbar-fixed-top">
		<div class="col-md-12 nav-wrapper">
			<div class="navbar-header" style="width: 100%;">
				<div class="opener-left-menu is-open">
					<span class="top"></span> <span class="middle"></span> <span
						class="bottom"></span>
				</div>
				<a href="/studypat" class="navbar-brand"> <b>StudyPat</b>
				</a>

				<ul class="nav navbar-nav search-nav">
					<li>
						<div class="search">
							<span class="fa fa-search icon-search" style="font-size: 23px;"></span>
							<div class="form-group form-animate-text">
								<input type="text" class="form-text" onKeypress="javascript:if(event.keyCode==13) search()" name="searchText" required> 
									<span class="bar"></span> <label class="label-search"> 검색어를 입력해주세요.
								</label>
							</div>
						</div>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right user-nav">
					<li class="user-name">
						<span> 
							<c:if test="${loginUser ne null}">
									<a href="myPage/${loginUser.getNickName()}" style="padding-right: 30px;">
										${loginUser.getNickName()}님 환영합니다. </a>
							</c:if>
						</span>
					</li>
				</ul>

			</div>
		</div>
	</nav>

	<div id="left-menu">
		<div class="sub-left-menu scroll">
			<ul class="nav nav-list">
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=어학'"> 
						<span class="fa-language fa"></span> 
						어학 
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
				</li>
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=취업'"> 
						<span class="fa-black-tie fa"></span> 
						취업
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
				</li>
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=공시/공무원'"> 
						<span class="fa-balance-scale fa"></span> 
						공시/공무원
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
				</li>
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=프로그래밍'"> 
						<span class="fa-keyboard-o fa"></span> 
						프로그래밍
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
				</li>
 
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=자율'"> 
						<span class="icon-people fa"></span> 
						자율
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
				</li>
  
				<li class="ripple">
					<a class="tree-toggle nav-header" onclick="location.href='/studypat/category?category=기타'"> 
						<span class="fa-pinterest fa"></span> 
						기타
						<span class="fa-angle-right fa right-arrow text-right"></span>
					</a>

				<!-- 권한 설정 -->
				<c:if test="${loginUser.admin eq '1'.charAt(0)}">
					<li class="active ripple">
					  <a class="tree-toggle nav-header">
					  	<span class="fa-home fa"></span> 관리자 페이지 
					    <span class="fa-angle-right fa right-arrow text-right"></span>
					  </a>
					  <ul class="nav nav-list tree">
					      <li><a href="/studypat/admin/user">회원 관리</a></li>
					      <li><a href="/studypat/admin/post">게시글 관리</a></li>
					  </ul>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>

<script>

function search() {
	  
	var searchText = $('input[name=searchText]').val();
	location.href = '/studypat/category?category=&search='+searchText;
	
};


</script>
</html>