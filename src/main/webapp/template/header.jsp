<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<link rel="favicon" href="../image/favicon.ico" />
    <link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
</head>
<body>
	<a href="#content" class="skip">본문바로가기</a>
	<!-- 탑헤더 -->
	<div class="top-header">
		<c:if test="${memEmail == null}">
			<div>
				<a href="../login/login">LOG IN</a>
			</div>
			<div>
				<a href="../sign_up/step1">SIGN UP</a>
			</div>
		</c:if>
		<c:if test="${memEmail != null}">
			<div>
				"<span>${memNickName }</span>"님 dogiver에 오신것을 환영 합니다!
			</div>
			<div>
				<a href="../logout/logout">LOG OUT</a>
			</div>
			<div id="my-page">
				<a href="../my/mypage">MY<img alt="my-page"
					src="../image/user_icon.svg"></a>
			</div>

		</c:if>
		<c:if test="${role eq 'admin' }">
			<div id="admin-page">
				<a href="../admin/admin">관리자<img alt="admin-page"
					src="../image/admin_icon.svg"></a>
			</div>
		</c:if>
		<c:if test="${role ne 'admin' }">
			<div>
				<a><img src="../image/shopping_bucket.png" alt="장바구니" /></a>
			</div>
		</c:if>
	</div>
	<!-- //탑헤더 -->

	<header>
		<div class="header">
			<!-- 헤더 -->
			<h1>도그너</h1>
			<!-- 로고 -->
			<a href="../main/index"><img src="../image/dogiver-logo.png"
				alt="로고이미지" /></a>

			<!-- 헤더 메뉴 -->
			<nav>
				<ul class="header-menu">
					<li><a id="offA" href="#" onclick="return false">ABOUT</a>
						<ul>
							<li><a href="../about/about">ABOUT US</a></li>
							<li><a href="../about/team">TEAM</a></li>
						</ul></li>

					<li><a href="#" onclick="return false">헌혈견</a>
						<ul>
							<li><a href="../blood/bloodNow">헌혈견이란?</a></li>
							<li><a href="../blood/dogiver">명예의 전당</a></li>
							<li><a href="../blood/dogJoin">헌혈견 등록</a></li>
							<li><a href="../blood/hospital">협력병원</a></li>
						</ul></li>

					<li><a id="offA" href="#" onclick="return false">커뮤니티</a>
						<ul>
						</ul></li>

					<li><a id="offA" href="#" onclick="return false">GOODS</a>
						<ul>
							<li><a href="../goods/goodsList">GOODS</a></li>
							<li><a href="../order/cart">장바구니</a></li>
							<li><a href="../my/orderList">주문조회</a></li>
						</ul></li>

					<li><a id="offA"href="#" onclick="return false">CONTACT</a>
						<ul>
							<li><a href="#">문의하기</a></li>
							<!-- <li><a href="#">무엇?</a></li> -->
						</ul></li>
				</ul>
			</nav>
			<!-- //헤더 메뉴 -->
		</div>
		<!-- //헤더 -->
	</header>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
</html>
