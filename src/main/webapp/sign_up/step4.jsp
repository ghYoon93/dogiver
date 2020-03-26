<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/sign.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-3.4.1.min.js"
    ></script>
    <script type="text/javascript" src="../js/main.js"></script>
  </head>
  <body>
    <div id="headerDiv"></div>
    <div class="page-title">
      <h2>회원가입</h2>
      <p>회원이 되셔서 Dogner를 이용하세요</p>
    </div>
    <div id="wrap">
      <section class="sign_up">
        <ol class="step">
          <li>
            STEP1
            <div>이메일인증</div>
          </li>
          <li>
            STEP2
            <div>약관동의</div>
          </li>
          <li>
            STEP3
            <div>회원정보입력</div>
          </li>
          <li class="on">
            STEP4
            <div>가입완료</div>
          </li>
        </ol>
        <div class="email_confirm">
          <h3>가입완료</h3>
          <p>dogiver의 회원이 되신걸 축하드립니다!</p>
          <a href="../main/index">홈으로</a>
        </div>
      </section>
    </div>
    <div id="footerDiv"></div>
  </body>
  <script type="text/javascript" src="../js/sign_up.js"></script>
</html>
