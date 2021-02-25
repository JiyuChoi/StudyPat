<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="studypat.dto.*"%>
	<%@ page import="java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>StudyPat Admin</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/datatables.bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="/studypat/asset/css/plugins/animate.min.css"/>
  <link href="/studypat/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="/studypat/asset/img/logomi.png">
</head>


<body id="mimin" class="dashboard">
	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="container-fluid mimin-wrapper">

		<!-- start: Content -->
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h3 class="animated fadeInLeft">관리자 페이지</h3>
						<p class="animated fadeInDown">
							관리자 페이지 <span class="fa-angle-right fa"></span> 회원 관리
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-12 top-20 padding-0">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">
							<h3>회원 정보</h3>
						</div>
						<div class="panel-body">
							<div class="responsive-table">
								<table id="datatables"
									class="table table-striped table-bordered" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>회원 번호</th>
											<th>ID</th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>회원 등급</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">
											<tr>
												<td><a href="/studypat/admin/post/${user.userNo}">${user.userNo}</a></td>
												<td>${user.id}</td>
												<td>${user.email}</td>
												<td>${user.nickName}</td>
												<c:if test="${user.admin eq '1'.charAt(0)}">
													<td>관리자</td>
												</c:if>
												<c:if test="${user.admin ne '1'.charAt(0)}">
													<td>일반 회원</td>
												</c:if>
												<td>
													<a href="/studypat/admin/user/delete/${user.userNo}">회원 삭제</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end: content -->

	</div>


	<!-- start: Javascript -->
	<script src="/studypat/asset/js/jquery.min.js"></script>
	<script src="/studypat/asset/js/jquery.ui.min.js"></script>
	<script src="/studypat/asset/js/bootstrap.min.js"></script>

	<!-- plugins -->
	<script src="/studypat/asset/js/plugins/moment.min.js"></script>
	<script src="/studypat/asset/js/plugins/jquery.datatables.min.js"></script>
	<script src="/studypat/asset/js/plugins/datatables.bootstrap.min.js"></script>
	<script src="/studypat/asset/js/plugins/jquery.nicescroll.js"></script>

	<!-- custom -->
	<script src="/studypat/asset/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatables').DataTable({
				"order" : [[ 0, "desc"]],
				"stateSave" : true,
				"columnDefs": [
				    { "orderable": false, "targets": 5}
				  ]
			});
		});
	</script>
	<!-- end: Javascript -->
</body>
</html>