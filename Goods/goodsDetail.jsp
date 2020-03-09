<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/goodsDetail.css" />
</head>
<body>
<div class="frame">
	<div class="overview">
		<div class="overview-image"></div>
		<div class="overview-content">
			<div class="goods-name"><h1 class="" style="font-size: 25px; margin:20px 0 50px 0;">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1></div>
<!-- 			<div class="goods-price" style="font-size: 15px;">39,000 원</div>
				<div class="goods-price-rate">10%</div> -->
			
			<div class="wrap">
				<div class="price-row">
					<span class="goods-price-rate">10%</span>
					<span class="product-price-wrap">
						<del class="goods-price">39,000 원</del>
						<span class="discount-price">34,000 원</span>
					</span>
				</div>
			</div>
			
			<div class="delivery-fee" style="margin:20px 0;">배송비   2500원</div>
			
			<div class="option-wrap">
				<span class="goods-name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)<br><br></span>
				<div class="amount-wrap">
					<div class="count">
						<button onclick="del()">-</button>
						<input type="text" name="amount" value="1" size="3" onchange="calc()">
						<button onclick="add()">+</button>
					</div>
					<div class="tot-price">총합계금액</div>
				</div>
			</div>
			
			<div class="btn_form">
				<button id="btn-cart">장바구니</button>
				<button id="btn-order">구매하기</button>
			</div>
			
		</div>
	</div>
	<div class="discription">
		<nav class="navigationBar"> 
			<ul> 
				<li><a class="menuLink" href="#">상세내용</a></li> 
				<li><a class="menuLink" href="#">문의하기</a></li> 
				<li><a class="menuLink" href="#">교환/환불/배송</a></li> 
			</ul> 
		</nav>
		
	</div>
</div>
</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods.js"></script>
</html>