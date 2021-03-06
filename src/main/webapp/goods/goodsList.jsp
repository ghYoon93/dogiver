<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>GOODS</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods.css" />
<link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
</head>

<body>
	<input type="hidden" id="pg" value="${pg }">
	<!-- 헤더 -->
	<div id="headerDiv"></div>
	<!-- 페이지타이틀 -->
	<div class="page-title">
		<h2 class="h2">GOODS</h2>
	</div>
	<!-- //페이지타이틀 -->
	<div class="wrap">
		<div class="goodsListDiv">
			<!-- 카테고리 -->
			<div class="goods_category">
				<ul>
					<li value=""><a href="goodsList">전체</a></li>
					<li value="101"><a href="#">장난감</a></li>
					<li value="201"><a href="#">목줄/하네스</a></li>
					<li value="301"><a href="#">패션/의류</a></li>
				</ul>
			</div>
			<div class="goods_top">
				<ul>
					<li class="list_qty">
						<!-- <span>100</span>개의 상품 -->
					</li>
					<li class="right_box">
						<div class="sort_box">
							<select class="goods_sort" id="goods_sort">
								<option value="10">등록일순</option>
								<option value="20">판매순</option>
								<option value="30">높은 가격순</option>
								<option value="40">낮은 가격순</option>
							</select>
						</div>
					</li>
				</ul>
			</div>
			<!-- 상품 컨테이너 -->
			<div class="goods-frame">
				<!-- 
	        <div class="goods-boxs">
	          <div class="goods-image">
	            <a href="javascript:void(0)">
	              <img class="image" src="${pageContext.request.contextPath}/resources/img/aa.jpg" />
	            </a>
	            <div class="hover_bar">
	              <button type="button" class="btn_basket_cart" href="#">
	                <img src="${pageContext.request.contextPath}/resources/img/shopping_bucket.png" />
	              </button>
	              <button type="button" class="btn_detail_link">
	                <img src="${pageContext.request.contextPath}/resources/img/search.png" />
	              </button>
	            </div>
	          </div>
	          <div class="goods-content">
	            <a href="javascript:void(0)" onclick="location.href='goodsDetail.html'" >
	              <h1 id="goods_name">
	                SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)
	              </h1>
	              <span id="goods_price">1000 </span>원
	            </a>
	          </div>
	        </div> -->
			</div>
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
						<dd class="imgbox">
							<img class="middle" />
						</dd>
						<dd>
							<strong></strong>
						</dd>

						<dd>
							<div class="count">
								<button id="minus">-</button>
								<input type="text" id="quantity" value="1" size="4" />
								<button id="plus">+</button>
							</div>
							<strong id="tot_price" title="총합계금액"></strong>
						</dd>

						<dd class="btnbox">
							<button class="cancel">취소</button>
							<button id="confirm">확인</button>
						</dd>
					</dl>
				</div>
			</div>
			<!-- //option_layer_scroll -->
		</div>

		<!-- //장바구니 모달 -->
	</div>
	<div id="footerDiv"></div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cartItemService.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/goodsList.js"></script>

</html>
