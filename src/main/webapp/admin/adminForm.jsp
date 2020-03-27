<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/admin.css" >
	<link
      rel="stylesheet"
      type="text/css"
      href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <link
      rel="stylesheet"
      href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		type="text/javascript"
		src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
	></script>
	<script type="text/javascript" src="../js/admin.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
<div id="headerDiv"></div>
 <div id="wrap">
 	<div id="side">
 		<div id="menu">
 			<h3>관리자 메뉴</h3>
 			<ul>
 				<li id="member"><a></a>회원관리</li>
 				<li id="dog">헌혈견관리</li>
 				<li id="goods">상품관리</li>
 				<li id="order">주문관리</li>
 				<li id="board">게시판관리</li>
 				<li id="contact">문의사항</li>
 				<li id="">...</li>
 			</ul>
 		</div>
 	</div>
 	<div id="contents">
 		<jsp:include page="${display }"></jsp:include>
 	</div>
 </div>
</body>
</html>