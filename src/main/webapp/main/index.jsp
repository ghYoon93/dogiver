<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<link rel="favicon" href="../image/favicon.ico" />
<link rel="shortcut icon" href="../image/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>DOGIVER</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="../js/main.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="wrap">
		<div class="slider">
			<div>
				<img id="slide-img-1" src="" alt="slide1" />
			</div>
			<div>
				<img id="slide-img-2" src="" alt="slide2" />
			</div>
			<div>
				<img id="slide-img-3" src="" alt="slide3" />
			</div>
		</div>
		<div class="card-box">
			<div class="blood-card">
				<h3>헌혈견</h3>
				<span>2020년에 설립된 dogiver는 반려견 헌혈 문화를 알리고 헌혈견 인식 재고 서비스를 제공하는 유일한 웹사이트 입니다.</span></br></br>
				<div class="button-center"><button type="button" class="goAbout">더 알아보기</button></div>
			</div>
			<div>
				<div class="goods-card">
					<h3>GOODS</h3>
					<span>자살용 밧줄이 아닙니다.</span></br>
					<span> "tug" 입니다!</span>
					<!-- <img alt="장난감" src="../image/goods/1010001/thumbnail.jpg"> -->
					<div class="button-center"><button type="button">사러가기</button></div>
				</div>
				<div class="comu-card">
					<h3>커뮤니티</h3>
					<span>두기버들의 이야기</span>
					<div class="button-center"><button type="button">바로가기</button></div>
				</div>
			</div>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
<script>
	$(".slider").slick({
		autoplay : true,
		autoplaySpeed : 3000,
		dots : true
	});
</script>
</html>
