<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOODS</title>

<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
	<link
	      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	      rel="stylesheet"
	/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodsDetail.css" />
  <link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
</head>
<body>

<input type="hidden" id="goods_id" value="${goods_id }">


	<!-- 헤더 -->
    <div id="headerDiv"></div>
    
    <!-- 페이지타이틀 -->
    <div class="page-title">
      <h2 class="h2">GOODS</h2>
    </div>

<div class="wrap">
    <div id="section">
	<div class="overview">
<!-- 		<div class="overview-image"><img src="${pageContext.request.contextPath}/resources/img/aa.jpg">  </div>
		<div class="overview-content">
			<h1 id="goods_name" >SET구성(헌혈견 목걸이+헌혈견 팔찌+헌혈견 귀걸이)</h1>			
			<div>
				<span>판매가</span>
				<span id="goods_price">34000</span>	
			</div>
			
			<div class="delivery-fee" style="margin:20px 0;">
				<span>배송비</span>
				<span>2500원</span>
			</div>
			
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
			
		</div> -->
	</div>
	
	<div class="discription">
		<nav class="navigationBar"> 
			<ul> 
				<li><a href="javascript:void(0)" onclick="getContentTab(1);">상세내용</a></li> 
				<li><a href="javascript:void(0)" onclick="getContentTab(2);">상품문의</a></li>  
				<li><a href="javascript:void(0)" onclick="getContentTab(3);">상품후기</a></li> 
				<li><a href="javascript:void(0)" onclick="getContentTab(4);">교환/환불/배송</a></li> 
			</ul> 
		</nav>
		<div title="상세이미지">
		
		</div>
		
	</div>
	</div>
</div>
<div id="footerDiv"></div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/goodsDetail.js"></script>
<!-- <script src="${pageContext.request.contextPath}/resources/js/goods_qna.js"></script>-->
</html>