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
		<div class="overview-image"><img src="../image/aa.jpg">  </div>
		<div class="overview-content">
			<h1 id="goods_name" >SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1>
<!-- 			<div class="goods-price" style="font-size: 15px;">39,000 원</div>
				<div class="goods-price-rate">10%</div> -->
			
			<div class="wrap">
				<div>
					<span class="product-price-wrap">
						판매가
						<span id="goods_price">34000</span>	
					</span>
				</div>
			</div>
			
			<div class="delivery-fee" style="margin:20px 0;">배송비   2500원</div>
			
			<div class="option-wrap">
				<span class="goods-name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)<br><br></span>
				<div class="amount-wrap">
					<div class="count">
						<button id="minus">-</button>
						<input type="text" id="quantity" value="1" size="4" >
						<button id="plus">+</button>
					</div>
					<strong id="tot_price" title="총합계금액"></strong>
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
				<li>상세내용</li> 
				<li>상품후기</li> 
				<li>교환/환불/배송</li> 
			</ul> 
		</nav>
		<div>
		dd
		</div>
		
	</div>
</div>
</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods.js"></script>
</html>