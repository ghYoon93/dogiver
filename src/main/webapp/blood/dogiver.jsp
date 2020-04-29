<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>명예의 전당</title>
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/dogiver.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="favicon" href="../image/favicon.ico" />
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="../js/dogiver.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>명예의 전당</h2>
		<p>자랑스러운 헌혈견들을 소개합니다</p>
	</div>
	<div class="wrap">
		<div class="dognorframe">
			<div class="dog-bred">명예의 전당</div>
			<dl class="dognorlist">
			</dl>
		</div>
	</div>
	<div id="footerDiv"></div>

	<!-- 상세페이지 modal -->
	<div id="dogiverView">
		<div id="image">
			<img src="">
		</div>
		<div id="other">
			<label>이름</label><br>
			<div id="name"></div>
		</div>
		<div id="other">
			<label>나이</label><br>
			<div id="age"></div>
		</div>
		<div id="other">
			<label>몸무게</label><br>
			<div id="weight"></div>
		</div>
		<div id="other">
			<label>견종</label><br>
			<div id="breed"></div>
		</div>
		<div id="other">
			<label>혈액형</label><br>
			<div id="bloodType"></div>
		</div>
		<div id="other">
			<label>최종 헌혈날짜</label><br>
			<div id="donationDate"></div>
		</div>
		<div id="other">
			<label>상세설명</label><br>
			<div id="description"></div>
		</div>
	</div>
	<div id="modalWrap">a</div>
</body>

</html>
