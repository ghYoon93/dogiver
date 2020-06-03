<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
        rel="stylesheet" />
  <title>주문완료</title>
</head>
<body>
  <div id="headerDiv"></div>
  <!-- 페이지타이틀 -->
  <div class="page-title">
    <h2 class="h2">장바구니</h2>
  </div>
  <div id="wrap">
    <div class="order_wrap">
      <div class="order_process">
        <ol>
          <li class="dot"><span class="dot">01</span> 장바구니 <span>&gt;</span></li>
          <li><span class="dot">02</span> 주문서작성/결제<span>&gt;</span></li>
          <li class="page_on"><span class="dot">03</span> 주문완료</li>
        </ol>
      </div>
          <div class="order_complete">
            <h3>주문완료</h3>
            <p>주문이 정상적으로 완료되었습니다.<br>주문번호: ${param.order_id}</p>
            <a href="../main/index">홈으로</a> <a href="../my/orderList">주문 조회</a>
          </div>
    </div>
  </div>
  <div id="footerDiv"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html>