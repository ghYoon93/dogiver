<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ABOUT US</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/about.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/team.css" />
<link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/about.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<!-- 페이지타이틀 -->
	<div class="page-title">
		<h2 class="h2">team</h2>
	</div>
	<!-- //페이지타이틀 -->
	<div class="wrap">
		<section class="about">
			<div class="about-nav">
				<ol>
					<li><a href="../about/about">ABOUT US</a></li>
					<li class="on"><a href="../about/team">TEAM</a></li>
				</ol>
			</div>
			<div class="team-content">
				<div class="row">
					<div class="column">
						<div class="card">
							<div id="ygh"></div>
							<div class="container">
								<h2>윤건희</h2>
								<p class="title">PL</p>
								<p>고생했다</p>
								<p>gh.yoon93@gmail.com</p>
								<p></p>
							</div>
						</div>
					</div>

					<div class="column">
						<div class="card">
							<div id="jwb"></div>
							<div class="container">
								<h2>정우복</h2>
								<p class="title">Designer</p>
								<p>즐거웠다.</p>
								<p>jwb0501@gmail.com</p>
								<p></p>
							</div>
						</div>
					</div>

					<div class="column">
						<div class="card">
							<div id="kkw"></div>
							<div class="container">
								<h2>김경우</h2>
								<p class="title">Designer</p>
								<p>주는만큼 받는다 두 기 버.</p>
								<p>ruddn615@naver.com</p>
								<p></p>
							</div>
						</div>
					</div>

					<div class="center">
						<div class="column">
							<div class="card">
								<div id="syr"></div>
								<div class="container">
									<h2>신유리</h2>
									<p class="title">Designer</p>
									<p>큰일낫따.</p>
									<p>jefforle20@gmail.com</p>
									<p></p>
								</div>
							</div>
						</div>

						<div class="column">
							<div class="card">
								<div id="pjs"></div>
								<div class="container">
									<h2>박진수</h2>
									<p class="title">Art Director</p>
									<p>하기 싫다.</p>
									<p>01077717141p@gmail.com</p>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="footerDiv"></div>
</body>
</html>
