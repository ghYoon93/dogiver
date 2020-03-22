<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/goods.css" />
</head>
<body>
	<div id="headerDiv"></div>
	<!-- 컨테이너 헤더(타이틀) -->
	<!-- 페이지타이틀 -->
	<div class="page-title">
		<h2 class="h2">GOODS</h2>
	</div>
	<!-- //페이지타이틀 -->
	<div class="wrap">


		<div>
			<div class="menuBar">HOME>GOODS</div>
		</div>
		<!-- 바디 -->
		<div class="goods_category">
			<ul>
				<li><a href="#">사료/건강</a></li>
				<li><a href="#">위생</a></li>
				<li><a href="#">장난감/용품</a></li>
			</ul>
		</div>
		<div class="goods_top">
			<ul>
				<li class="list_qty"><span>100</span>개의 상품</li>
				<li class="right_box">
					<div class="sort_box">
						<select name="goods_sort" id="goods_sort">
							<option value="newly">등록일순</option>
							<option value="popular">인기순</option>
							<option value="hight_price">높은 가격순</option>
							<option value="low_price">낮은 가격순</option>
						</select>
					</div>
				</li>
			</ul>
		</div>
		<!-- <div class="dropdown">
		<button class="dropdown-sort">최신순</button>
		<div class="dropdown-content">
			<a href="#">최신순</a>
			<a href="#">인기순</a>
			<a href="#">낮은가격순</a>
			<a href="#">높은가격순</a>
		</div>
	</div> -->

		<!-- 상품 컨테이너 -->
		<div class="goods-frame">
			<div class="goods-boxs">
				<div class="goods-image">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'"> <img class="image"
						src="../image/aa.jpg">
					</a>
					<div class="hover_bar">
						<button type="button" class="btn_basket_cart" href="#">
							<img src="../image/shopping_bucket.png">
						</button>
						<button type="button" class="btn_detail_link">
							<img src="../image/search.png">
						</button>
					</div>
				</div>
				<div class="goods-content">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'">
						<h1 id="goods_name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1> <span
						id="goods_price">34000 </span>원
					</a>
				</div>
			</div>
			<div class="goods-boxs">
				<div class="goods-image">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'"> <img class="image"
						src="../image/aa.jpg">
					</a>
					<div class="hover_bar">
						<button type="button" class="btn_basket_cart" href="#">
							<img src="../image/shopping_bucket.png">
						</button>
						<button type="button" class="btn_detail_link">
							<img src="../image/search.png">
						</button>
					</div>
				</div>
				<div class="goods-content">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'">
						<h1 id="goods_name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1> <span
						id="goods_price">34000 </span>원
					</a>
				</div>
			</div>
			<div class="goods-boxs">
				<div class="goods-image">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'"> <img class="image"
						src="../image/aa.jpg">
					</a>
					<div class="hover_bar">
						<button type="button" class="btn_basket_cart" href="#">
							<img src="../image/shopping_bucket.png">
						</button>
						<button type="button" class="btn_detail_link">
							<img src="../image/search.png">
						</button>
					</div>
				</div>
				<div class="goods-content">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'">
						<h1 id="goods_name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1> <span
						id="goods_price">34000 </span>원
					</a>
				</div>
			</div>
			<div class="goods-boxs">
				<div class="goods-image">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'"> <img class="image"
						src="../image/aa.jpg">
					</a>
					<div class="hover_bar">
						<button type="button" class="btn_basket_cart" href="#">
							<img src="../image/shopping_bucket.png">
						</button>
						<button type="button" class="btn_detail_link">
							<img src="../image/search.png">
						</button>
					</div>
				</div>
				<div class="goods-content">
					<a href="javascript:void(0)"
						onclick="location.href='goodsDetail.html'">
						<h1 id="goods_name">SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1> <span
						id="goods_price">34000 </span>원
					</a>
				</div>
			</div>

			<!-- 장바구니 모달 -->
			<div id="option-view" class="layer_option" style="display: none">
				<div class="layer_option_cont">
					<h4>장바구니 옵션</h4>
					<span onclick="" class="close" title="닫기">&times;</span>
					<div class="option_layer_scroll">
						<div class="option_tit_box">
							<dl>
								<dt>
									<img src="../image/no-image-icon.jpg" width="68" alt="상품명"
										title="상품명" class="middle">
								</dt>
								<dd>
									<strong>같이 구하기 되는 있는 뿐이다. 되려니와, 인생의 고동을 이것이다. 있으며,
										되려니와, 피고 철환하였는가?</strong>
								</dd>

								<dd>
									<div class="count">
										<button id="minus">-</button>
										<input type="text" id="quantity" value="1" size="4">
										<button id="plus">+</button>
									</div>
									<strong id="tot_price" title="총합계금액"></strong>
								</dd>

								<dd>
									<button class="cancle">취소</button>
									<button class="">장바구니 담기</button>
								</dd>

							</dl>
						</div>
					</div>
					<!-- //option_layer_scroll -->
				</div>
				<!-- //장바구니 모달 -->
			</div>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/main.js"></script>
<script src="../js/goods.js"></script>
</html>