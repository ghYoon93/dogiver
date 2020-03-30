<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
     <link rel="favicon" href="../image/favicon.ico" />
    <link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta
      name="google-signin-client_id"
      content="YOUR_CLIENT_ID.apps.googleusercontent.com"
    />
    <title>로그인</title>
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.min.js"></script>
    <script type="text/javascript" src="../js/login.js"></script>
  </head>
  <body>
    <section class="login">
       <!-- 로고 -->
        <a href="../main/index">
        	<img src="../image/dogiver-logo.png" alt="로고이미지" />
        </a>
      <h2>로그인</h2>
      <div class="loginMessage" style="display:none;"></div>
      <ul>
      <form id="login-form">
        <li>
          <input
            type="text"
            placeholder="example@exam.com"
            title="아이디입력" id="email" name="email"
          />
        </li>
        <li>
          <input type="password" placeholder="비밀번호" title="비밀번호입력" id="pwd" name="pwd"/>
        </li>
 		</form>
        <li>
          <input type="checkbox" id="chk_email" /><label for="chk_email">
            아이디저장
          </label>
        </li>
        <div id="logins">
          <li><button type="button" id="login_btn"></button></li>
        <!--   <li><div id="my-signin2"></div></li>
          <li><div id="naverIdLogin"></div></li>
          <li><div id="kakao-login"></div></li> -->
        </div>
      </ul>
      <div class="bottomDiv">
        <ul>
          <li><a href="../sign_up/step1">회원가입</a></li>
          <li><a href="">아이디/비밀번호입력 찾기</a></li>
        </ul>
      </div>
    </section>
  </body>
</html>
