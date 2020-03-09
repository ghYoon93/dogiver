<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/goods.css" />
</head>
<body>
<!-- 컨테이너 헤더(타이틀) -->
<div class="container-header">
	<div class="">
		<h2>GOODS</h2>
	</div>
</div>

<!-- 바디 -->
<div>
	<div class="menuBar">HOME>GOODS</div>
</div>

<div class="frame">
	<div class="dropdown">
		<button class="dropdown-sort">최신순</button>
		<div class="dropdown-content">
			<a href="#">최신순</a>
			<a href="#">인기순</a>
			<a href="#">낮은가격순</a>
			<a href="#">높은가격순</a>
		</div>
	</div>
	<br>	
	<div class="product-container">
		<div class="product-boxs">
			<div class="goods-image">
				<a id="detailPage" href="javascript:void(0)" onclick="location.href='goodsDetail.jsp'"><img src="../image/aa.jpg"></a>
			</div>
			<div class="goods-content">
				<h1 class="goods-name"> SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1>
				<span class="goods-price-rate">10%</span>
				<span class="goods-price">34,000 원 </span>
			</div>
		</div>
		<div class="product-boxs">
			<div class="goods-image">
				<a id="detailPage" href="javascript:void(0)" onclick="location.href='goodsDetail.jsp'"><img src="../image/aa.jpg"></a>
			</div>
			<div class="goods-content">
				<h1 class="goods-name"> SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1>
				<span class="goods-price-rate">10%</span>
				<span class="goods-price">34,000 원 </span>
			</div>
		</div>
		<div class="product-boxs">
			<div class="goods-image">
				<a id="detailPage" href="javascript:void(0)" onclick="location.href='goodsDetail.jsp'"><img src="../image/aa.jpg"></a>
			</div>
			<div class="goods-content">
				<h1 class="goods-name"> SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1>
				<span class="goods-price-rate">10%</span>
				<span class="goods-price">34,000 원 </span>
			</div>
		</div>
		<div class="product-boxs">
			<div class="goods-image"></div>
			<div class="goods-content">44</div>
		</div>
	</div>
</div>

</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods.js"></script>
</html>