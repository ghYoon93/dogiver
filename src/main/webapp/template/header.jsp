<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
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
      <div><a href="../login/login">LOG IN</a></div>
      <div><a href="../sign_up/step1">SIGN UP</a></div>
    </c:if>
    <c:if test="${memEmail != null}">
      <div><a href="../logout/logout">LOG OUT</a></div>
      <div id="my-page"><a href="../member/mypage">MY</a></div>
    </c:if>
      <div>
        <a><img src="../image/shopping_bucket.png" alt="장바구니"/></a>
      </div>
    </div>
    <!-- //탑헤더 -->

    <header>
      <div class="header">
        <!-- 헤더 -->
        <h1>도그너</h1>
        <!-- 로고 -->
        <a href="../main/index"
          ><img src="../image/dogner.png" alt="로고이미지"
        /></a>

        <!-- 헤더 메뉴 -->
        <nav>
          <ul class="header-menu">
            <li>
              <a href="#">ABOUT</a>
              <ul>
                <li><a href="../about/about.html">ABOUT US</a></li>
                <li><a href="#">TEAM</a></li>
                <li><a href="#">JOIN THE TEAM</a></li>
              </ul>
            </li>

            <li>
              <a href="#">헌혈견</a>
              <ul>
                <li><a href="../blood/bloodNow">헌혈견이란?</a></li>
                <li><a href="../blood/dogiver">명예의 전당</a></li>
                <li><a href="../blood/dogJoin">헌혈견 등록</a></li>
                <li><a href="../blood/hospital">협력병원</a></li>
              </ul>
            </li>

            <li>
              <a href="#">커뮤니티</a>
              <ul>
                <li><a href="#">자유게시판</a></li>
              </ul>
            </li>

            <li>
              <a href="#">GOODS</a>
              <ul>
                <li><a href="#">GOODS</a></li>
                <li><a href="../order/cart">장바구니</a></li>
                <li><a href="#">주문조회</a></li>
              </ul>
            </li>

            <li>
              <a href="#">CONTACT</a>
              <ul>
                <li><a href="#">문의하기</a></li>
                <!-- <li><a href="#">무엇?</a></li> -->
              </ul>
            </li>
          </ul>
        </nav>
        <!-- //헤더 메뉴 -->
      </div>
      <!-- //헤더 -->
    </header>
  </body>
  <script
    type="text/javascript"
    src="http://code.jquery.com/jquery-3.4.1.min.js"
  ></script>
  <script type="text/javascript" src="../js/main.js"></script>
</html>
