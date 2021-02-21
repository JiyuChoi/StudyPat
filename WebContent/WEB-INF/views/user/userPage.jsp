<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
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
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/fullcalendar.min.css"/>
	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    	<%
	String updateErrMsg = (String) session.getAttribute("updateErrMsg");
	String passwordErrMsg = (String) session.getAttribute("passwordErrMsg");
	%>
	<%	
	session.removeAttribute("updateErrMsg");
	session.removeAttribute("passwordErrMsg");
	%>
  
  </head>

<body id="mimin" class="dashboard">

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div id="content">
		<div class="panel box-shadow-none content-header">
			<div class="panel-body">
				<div class="col-md-12">
					<h3 class="animated fadeInLeft">마이페이지</h3>
				</div>
			</div>
		</div>
		<div class="form-element">
			<div class="col-md-12 padding-0">
				<div class="col-md-8">
					<div class="panel form-element-padding">
						<div class="panel-heading">
							<h4>회원정보변경</h4>
						</div>

						<div class="panel-body" style="padding-bottom: 30px;">
							<div class="col-md-12">
							<!-- 회원정보 수정 -->
							<form action="updateUser" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label text-right">닉네임</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="nickName" value="${user.nickName}">
									</div>
								</div>
								
<!-- 								<div class="form-group">
									<label class="col-sm-2 control-label text-right">현재 비밀번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"  name="password">
									</div>
								</div> -->
								
								<div class="form-group">
									<label class="col-sm-2 control-label text-right">변경할 비밀번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"  name="password">
									</div>
								</div>
								<input type="hidden" name="id" value="${user.id}" readonly="readonly">
							<% if (passwordErrMsg != null) { %>
							<p style="color: red;">
							<%=passwordErrMsg%>
							</p>
						<%}else if(updateErrMsg != null){%>
							<p style="color: red;">
							<%=updateErrMsg%>
							</p>
						<%}else {%>
							<p id="textErrMsg"></p>
						<%} %>
								<input type="submit" class="btn" value="변경">
							</form>
							</div>
							<span>회원탈퇴</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="form-element">
			<div class="col-md-12 padding-0">
				<div class="col-md-8">
					<div class="panel form-element-padding">
						<div class="panel-heading">
							<h4>내 활동</h4>
						</div>

						<div class="col-md-12 padding-0">
							<div class="panel box-v3">
								<div class="panel-body">

									<div class="media">
										<div class="media-left">
											<span class="icon-folder icons" style="font-size: 2em;"></span>
										</div>
										<div class="media-body">
											<h5 class="media-heading">내가 쓴 글</h5>
										</div>
									</div>

									<div class="media">
										<div class="media-left">
											<span class="icon-pie-chart icons" style="font-size: 2em;"></span>
										</div>
										<div class="media-body">
											<h5 class="media-heading">댓글 단 글</h5>
										</div>
									</div>

									<div class="media">
										<div class="media-left">
											<span class="icon-energy icons" style="font-size: 2em;"></span>
										</div>
										<div class="media-body">
											<h5 class="media-heading">스크랩</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>



	<!-- start: Javascript -->
				<script src="asset/js/jquery.min.js"></script>
				<script src="asset/js/jquery.ui.min.js"></script>
				<script src="asset/js/bootstrap.min.js"></script>


				<!-- plugins -->
				<script src="asset/js/plugins/moment.min.js"></script>
				<script src="asset/js/plugins/jquery.knob.js"></script>
				<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
				<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
				<script src="asset/js/plugins/jquery.nicescroll.js"></script>
				<script src="asset/js/plugins/jquery.mask.min.js"></script>
				<script src="asset/js/plugins/select2.full.min.js"></script>
				<script src="asset/js/plugins/nouislider.min.js"></script>
				<script src="asset/js/plugins/jquery.validate.min.js"></script>


				<!-- custom -->
				<script src="asset/js/main.js"></script>
				<script type="text/javascript">
					$(document)
							.ready(
									function() {

										$("#signupForm")
												.validate(
														{
															errorElement : "em",
															errorPlacement : function(
																	error,
																	element) {
																$(element
																		.parent(
																				"div")
																		.addClass(
																				"form-animate-error"));
																error
																		.appendTo(element
																				.parent("div"));
															},
															success : function(
																	label) {
																$(label
																		.parent(
																				"div")
																		.removeClass(
																				"form-animate-error"));
															},
															rules : {
																validate_firstname : "required",
																validate_lastname : "required",
																validate_username : {
																	required : true,
																	minlength : 2
																},
																validate_password : {
																	required : true,
																	minlength : 5
																},
																validate_confirm_password : {
																	required : true,
																	minlength : 5,
																	equalTo : "#validate_password"
																},
																validate_email : {
																	required : true,
																	email : true
																},
																validate_agree : "required"
															},
															messages : {
																validate_firstname : "Please enter your firstname",
																validate_lastname : "Please enter your lastname",
																validate_username : {
																	required : "Please enter a username",
																	minlength : "Your username must consist of at least 2 characters"
																},
																validate_password : {
																	required : "Please provide a password",
																	minlength : "Your password must be at least 5 characters long"
																},
																validate_confirm_password : {
																	required : "Please provide a password",
																	minlength : "Your password must be at least 5 characters long",
																	equalTo : "Please enter the same password as above"
																},
																validate_email : "Please enter a valid email address",
																validate_agree : "Please accept our policy"
															}
														});

										// propose username by combining first- and lastname
										$("#username")
												.focus(
														function() {
															var firstname = $(
																	"#firstname")
																	.val();
															var lastname = $(
																	"#lastname")
																	.val();
															if (firstname
																	&& lastname
																	&& !this.value) {
																this.value = firstname
																		+ "."
																		+ lastname;
															}
														});

										$('.mask-date').mask('00/00/0000');
										$('.mask-time').mask('00:00:00');
										$('.mask-date_time').mask(
												'00/00/0000 00:00:00');
										$('.mask-cep').mask('00000-000');
										$('.mask-phone').mask('0000-0000');
										$('.mask-phone_with_ddd').mask(
												'(00) 0000-0000');
										$('.mask-phone_us').mask(
												'(000) 000-0000');
										$('.mask-mixed').mask('AAA 000-S0S');
										$('.mask-cpf').mask('000.000.000-00', {
											reverse : true
										});
										$('.mask-money').mask(
												'000.000.000.000.000,00', {
													reverse : true
												});
										$('.mask-money2').mask("#.##0,00", {
											reverse : true
										});
										$('.mask-ip_address').mask(
												'0ZZ.0ZZ.0ZZ.0ZZ', {
													translation : {
														'Z' : {
															pattern : /[0-9]/,
															optional : true
														}
													}
												});
										$('.mask-ip_address').mask(
												'099.099.099.099');
										$('.mask-percent').mask('##0,00%', {
											reverse : true
										});
										$('.mask-clear-if-not-match').mask(
												"00/00/0000", {
													clearIfNotMatch : true
												});
										$('.mask-placeholder').mask(
												"00/00/0000", {
													placeholder : "__/__/____"
												});
										$('.mask-fallback')
												.mask(
														"00r00r0000",
														{
															translation : {
																'r' : {
																	pattern : /[\/]/,
																	fallback : '/'
																},
																placeholder : "__/__/____"
															}
														});
										$('.mask-selectonfocus').mask(
												"00/00/0000", {
													selectOnFocus : true
												});

										var options = {
											onKeyPress : function(cep, e,
													field, options) {
												var masks = [ '00000-000',
														'0-00-00-00' ];
												mask = (cep.length > 7) ? masks[1]
														: masks[0];
												$('.mask-crazy_cep').mask(mask,
														options);
											}
										};

										$('.mask-crazy_cep').mask('00000-000',
												options);

										var options2 = {
											onComplete : function(cep) {
												alert('CEP Completed!:' + cep);
											},
											onKeyPress : function(cep, event,
													currentField, options) {
												console.log(
														'An key was pressed!:',
														cep, ' event: ', event,
														'currentField: ',
														currentField,
														' options: ', options);
											},
											onChange : function(cep) {
												console.log('cep changed! ',
														cep);
											},
											onInvalid : function(val, e, f,
													invalid, options) {
												var error = invalid[0];
												console
														.log(
																"Digit: ",
																error.v,
																" is invalid for the position: ",
																error.p,
																". We expect something like: ",
																error.e);
											}
										};

										$('.mask-cep_with_callback').mask(
												'00000-000', options2);

										var SPMaskBehavior = function(val) {
											return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000'
													: '(00) 0000-00009';
										}, spOptions = {
											onKeyPress : function(val, e,
													field, options) {
												field.mask(SPMaskBehavior
														.apply({}, arguments),
														options);
											}
										};

										$('.mask-sp_celphones').mask(
												SPMaskBehavior, spOptions);

										var slider = document
												.getElementById('noui-slider');
										noUiSlider.create(slider, {
											start : [ 20, 80 ],
											connect : true,
											range : {
												'min' : 0,
												'max' : 100
											}
										});

										var slider = document
												.getElementById('noui-range');
										noUiSlider.create(slider, {
											start : [ 20, 80 ], // Handle start position
											step : 10, // Slider moves in increments of '10'
											margin : 20, // Handles must be more than '20' apart
											connect : true, // Display a colored bar between the handles
											direction : 'rtl', // Put '0' at the bottom of the slider
											orientation : 'vertical', // Orient the slider vertically
											behaviour : 'tap-drag', // Move handle on tap, bar is draggable
											range : { // Slider can select '0' to '100'
												'min' : 0,
												'max' : 100
											},
											pips : { // Show a scale with the slider
												mode : 'steps',
												density : 2
											}
										});

										$(".select2-A").select2({
											placeholder : "Select a state",
											allowClear : true
										});

										$(".select2-B").select2({
											tags : true
										});

										$("#range1").ionRangeSlider({
											type : "double",
											grid : true,
											min : -1000,
											max : 1000,
											from : -500,
											to : 500
										});

										$('.dateAnimate')
												.bootstrapMaterialDatePicker({
													weekStart : 0,
													time : false,
													animation : true
												});
										$('.date').bootstrapMaterialDatePicker(
												{
													weekStart : 0,
													time : false
												});
										$('.time').bootstrapMaterialDatePicker(
												{
													date : false,
													format : 'HH:mm',
													animation : true
												});
										$('.datetime')
												.bootstrapMaterialDatePicker(
														{
															format : 'dddd DD MMMM YYYY - HH:mm',
															animation : true
														});
										$('.date-fr')
												.bootstrapMaterialDatePicker(
														{
															format : 'DD/MM/YYYY HH:mm',
															lang : 'fr',
															weekStart : 1,
															cancelText : 'ANNULER'
														});
										$('.min-date')
												.bootstrapMaterialDatePicker(
														{
															format : 'DD/MM/YYYY HH:mm',
															minDate : new Date()
														});

										$(".dial").knob({
											height : 80
										});

										$('.dial1').trigger('configure', {
											"min" : 10,
											"width" : 80,
											"max" : 80,
											"fgColor" : "#FF6656",
											"skin" : "tron"
										});

										$('.dial2').trigger('configure', {

											"width" : 80,
											"fgColor" : "#FF6656",
											"skin" : "tron",
											"cursor" : true
										});

										$('.dial3').trigger('configure', {

											"width" : 80,
											"fgColor" : "#27C24C",
										});
									});
				</script>
				<!-- end: Javascript -->
</body>
</html>
