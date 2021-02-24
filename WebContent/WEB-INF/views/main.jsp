<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="description" content="Miminium Admin Template v.1">
<meta name="author" content="Isna Nur Azis">
<meta name="keyword" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudyPat</title>

<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/fullcalendar.min.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->

<link rel="shortcut icon" href="asset/img/logomi.png">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
	String errMsg = (String) session.getAttribute("errMsg");
if (errMsg == null)
	errMsg = "";
%>
<body id="mimin" class="dashboard">
	<!-- start: Header -->

	<!-- end: Header -->

	<div class="container-fluid mimin-wrapper">
		<!-- start:Left Menu -->
		<jsp:include page="/WEB-INF/views/nav.jsp" />
		<!-- end: Left Menu -->
		<!-- start: content -->
		<div id="content">
			<div class="col-md-12" style="padding: 20px;">
				<div class="col-md-12 padding-0">
					<div class="col-md-8 padding-0">
						<div class="col-md-12 padding-0">
							<div class="panel box-v4">
								<div class="panel-heading bg-white border-none">
									<h4>
										<span class="fa-bullhorn fa"> 스터디 모집글</span> 
									</h4>
								</div>
							</div>
						</div>
						<div class="col-md-12 padding-0">
							<c:forEach var="post" items="${postListLatest}">
								<div class="panel box-v4">
									<div class="panel-heading bg-white border-none">
										<c:forEach var="tag" items="${post.tagList}">
											<span class="badge-info">${tag.tagName}</span>
										</c:forEach>
										<h4>${post.title}</h4>
										<span>${post.userNickName}</span> <span>조회수:${post.viewCount}</span>
										<span>지역:${post.area}</span> <span>작성일:${post.createDate}</span>
										<span>댓글수:${post.commentCount}</span> <span>스크랩수:${post.scrapCount}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-4">
						<div class="col-md-12 padding-0">
							<div class="panel box-v2">
								<div class="panel-body loginForm">
									<div class="col-md-12 padding-0 text-center">
										<form action="login" method="post">
											<c:if test="${session_id eq null}">
												<div class="login"
													style="overflow: hidden;">
													<div class="col-sm-10" style="margin: 5px 0;">
														<input type="id" id="id"
															class="form-control border-bottom" name="id"
															placeholder="아이디" required>
													</div>
													<div class="col-sm-10">
														<input type="password" id="password"
															class="form-control border-bottom" name="password"
															placeholder="비밀번호" required>
													</div>

													<input type="submit" class="btn" value="로그인"
														style="margin-top: 5px; padding: 26px 10px; position: absoulte; top: 5px; right: 0;" />
													
												</div>
												<div style="padding:10px 25px; text-align: left; position: relative;">
													<span class="icon-lock">
														<a href="forgotid" style="color:#fff !important;">아이디 찾기 </a>
														<a href="forgotpass" style="color:#fff !important;"> 비밀번호 찾기</a>
													</span> 
													<span class="icon-user" style="position: absolute; top:10px; right: 80px;">
														<a href="join" style="color:#fff !important;">회원가입</a>
													</span>
												</div>
												<div id="errMsg" style="color: black; margin-bottom:10px;"><%=errMsg%></div>
												<!-- <button class="btn col-md-12" value="네이버 아이디로 로그인" style="margin-top:10px !important;"> </button> -->
											</c:if>

											<c:if test="${session_id ne null}">
												<div style="padding-bottom:15px;">
													<button type="button" onclick="location.href='myPage/${user.userNo}'"
														class="btn btn-default">
														<span class=" icon-emotsmile"> 마이페이지</span>
													</button>
													<button  type="button" onclick="location.href='logout'"
														id="logoutBtn" class="btn btn-default">
														<span class="icon-logout"> 로그아웃</span>
													</button>
												</div>
											</c:if>
										</form>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 padding-0">
							<div class="panel box-v3">
								<div class="panel-heading bg-white border-none">
									<h4>내 스크랩 글</h4>
								</div>
								<c:if test="${scrapLoginErrMsg ne null}">
									${scrapLoginErrMsg}
									<%
										session.invalidate();
									%>
								</c:if>
								<c:if test="${scrapNullMsg ne null}">
									${scrapNullMsg}
								</c:if>
								<c:if
									test="${scrapLoginErrMsg eq null && scrapNullMsg eq null }">
									<c:forEach var="post" items="${postListUserScrap}">
										<div class="panel-body">
											<div class="media">
												<div class="media-left">
													<span class="icon-folder icons" style="font-size: 2em;"></span>
												</div>
												<div class="media-body">
													<h5 class="media-heading">${post.title}</h5>
													<span>조회수:${post.viewCount}</span> <span>작성일:${post.createDate}</span>
													<span>스크랩수:${post.scrapCount}</span>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
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
	<script src="asset/js/plugins/fullcalendar.min.js"></script>
	<script src="asset/js/plugins/jquery.nicescroll.js"></script>
	<script src="asset/js/plugins/jquery.vmap.min.js"></script>
	<script src="asset/js/plugins/maps/jquery.vmap.world.js"></script>
	<script src="asset/js/plugins/jquery.vmap.sampledata.js"></script>
	<script src="asset/js/plugins/chart.min.js"></script>


	<!-- custom -->
	<script type="text/javascript">
	function doLogin() {
		var errMsg = '<%=errMsg%>';
		if (errMsg !== "") {
			alert(errMsg);
		}
	}
	</script> 
	<script src="asset/js/main.js"></script>
	<script type="text/javascript">
      (function(jQuery){

        // start: Chart =============

        Chart.defaults.global.pointHitDetectionRadius = 1;
        Chart.defaults.global.customTooltips = function(tooltip) {

            var tooltipEl = $('#chartjs-tooltip');

            if (!tooltip) {
                tooltipEl.css({
                    opacity: 0
                });
                return;
            }

            tooltipEl.removeClass('above below');
            tooltipEl.addClass(tooltip.yAlign);

            var innerHtml = '';
            if (undefined !== tooltip.labels && tooltip.labels.length) {
                for (var i = tooltip.labels.length - 1; i >= 0; i--) {
                    innerHtml += [
                        '<div class="chartjs-tooltip-section">',
                        '   <span class="chartjs-tooltip-key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
                        '   <span class="chartjs-tooltip-value">' + tooltip.labels[i] + '</span>',
                        '</div>'
                    ].join('');
                }
                tooltipEl.html(innerHtml);
            }

            tooltipEl.css({
                opacity: 1,
                left: tooltip.chart.canvas.offsetLeft + tooltip.x + 'px',
                top: tooltip.chart.canvas.offsetTop + tooltip.y + 'px',
                fontFamily: tooltip.fontFamily,
                fontSize: tooltip.fontSize,
                fontStyle: tooltip.fontStyle
            });
        };
        var randomScalingFactor = function() {
            return Math.round(Math.random() * 100);
        };
        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
                label: "My First dataset",
                fillColor: "rgba(21,186,103,0.4)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(66,69,67,0.3)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                 data: [18,9,5,7,4.5,4,5,4.5,6,5.6,7.5]
            }, {
                label: "My Second dataset",
                fillColor: "rgba(21,113,186,0.5)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [4,7,5,7,4.5,4,5,4.5,6,5.6,7.5]
            }]
        };

        var doughnutData = [
                {
                    value: 300,
                    color:"#129352",
                    highlight: "#15BA67",
                    label: "Alfa"
                },
                {
                    value: 50,
                    color: "#1AD576",
                    highlight: "#15BA67",
                    label: "Beta"
                },
                {
                    value: 100,
                    color: "#FDB45C",
                    highlight: "#15BA67",
                    label: "Gamma"
                },
                {
                    value: 40,
                    color: "#0F5E36",
                    highlight: "#15BA67",
                    label: "Peta"
                },
                {
                    value: 120,
                    color: "#15A65D",
                    highlight: "#15BA67",
                    label: "X"
                }

            ];


        var doughnutData2 = [
                {
                    value: 100,
                    color:"#129352",
                    highlight: "#15BA67",
                    label: "Alfa"
                },
                {
                    value: 250,
                    color: "#FF6656",
                    highlight: "#FF6656",
                    label: "Beta"
                },
                {
                    value: 100,
                    color: "#FDB45C",
                    highlight: "#15BA67",
                    label: "Gamma"
                },
                {
                    value: 40,
                    color: "#FD786A",
                    highlight: "#15BA67",
                    label: "Peta"
                },
                {
                    value: 120,
                    color: "#15A65D",
                    highlight: "#15BA67",
                    label: "X"
                }

            ];

        var barChartData = {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [
                    {
                        label: "My First dataset",
                        fillColor: "rgba(21,186,103,0.4)",
                        strokeColor: "rgba(220,220,220,0.8)",
                        highlightFill: "rgba(21,186,103,0.2)",
                        highlightStroke: "rgba(21,186,103,0.2)",
                        data: [65, 59, 80, 81, 56, 55, 40]
                    },
                    {
                        label: "My Second dataset",
                        fillColor: "rgba(21,113,186,0.5)",
                        strokeColor: "rgba(151,187,205,0.8)",
                        highlightFill: "rgba(21,113,186,0.2)",
                        highlightStroke: "rgba(21,113,186,0.2)",
                        data: [28, 48, 40, 19, 86, 27, 90]
                    }
                ]
            };

         window.onload = function(){
                var ctx = $(".doughnut-chart")[0].getContext("2d");
                window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx2 = $(".line-chart")[0].getContext("2d");
                window.myLine = new Chart(ctx2).Line(lineChartData, {
                     responsive: true,
                        showTooltips: true,
                     <%--    multiTooltipTemplate: "<%= value %>", --%>
                     maintainAspectRatio: false
                });

                var ctx3 = $(".bar-chart")[0].getContext("2d");
                window.myLine = new Chart(ctx3).Bar(barChartData, {
                     responsive: true,
                        showTooltips: true
                });

                var ctx4 = $(".doughnut-chart2")[0].getContext("2d");
                window.myDoughnut2 = new Chart(ctx4).Doughnut(doughnutData2, {
                    responsive : true,
                    showTooltips: true
                });

            };
        
        //  end:  Chart =============

        // start: Calendar =========
         $('.dashboard .calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: '2015-02-12',
            businessHours: true, // display business hours
            editable: true,
            events: [
                {
                    title: 'Business Lunch',
                    start: '2015-02-03T13:00:00',
                    constraint: 'businessHours'
                },
                {
                    title: 'Meeting',
                    start: '2015-02-13T11:00:00',
                    constraint: 'availableForMeeting', // defined below
                    color: '#20C572'
                },
                {
                    title: 'Conference',
                    start: '2015-02-18',
                    end: '2015-02-20'
                },
                {
                    title: 'Party',
                    start: '2015-02-29T20:00:00'
                },

                // areas where "Meeting" must be dropped
                {
                    id: 'availableForMeeting',
                    start: '2015-02-11T10:00:00',
                    end: '2015-02-11T16:00:00',
                    rendering: 'background'
                },
                {
                    id: 'availableForMeeting',
                    start: '2015-02-13T10:00:00',
                    end: '2015-02-13T16:00:00',
                    rendering: 'background'
                },

                // red areas where no events can be dropped
                {
                    start: '2015-02-24',
                    end: '2015-02-28',
                    overlap: false,
                    rendering: 'background',
                    color: '#FF6656'
                },
                {
                    start: '2015-02-06',
                    end: '2015-02-08',
                    overlap: true,
                    rendering: 'background',
                    color: '#FF6656'
                }
            ]
        });
        // end : Calendar==========

        // start: Maps============

          jQuery('.maps').vectorMap({
            map: 'world_en',
            backgroundColor: null,
            color: '#fff',
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: true,
            showTooltip: true,
            values: sample_data,
            scaleColors: ['#C8EEFF', '#006491'],
            normalizeFunction: 'polynomial'
        });

        // end: Maps==============

      })(jQuery);
     </script>
	<!-- end: Javascript -->
</body>
<style>
</style>
</html>