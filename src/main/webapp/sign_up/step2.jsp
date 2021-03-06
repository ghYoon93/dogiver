<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
    <link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico"
  type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-3.4.1.min.js"
    ></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  </head>
  <body>
    <div id="headerDiv"></div>

    <div class="page-title">
      <h2>회원가입</h2>
      <p>회원이 되셔서 dogiver를 이용하세요</p>
    </div>
    <div id="wrap">
      <section class="sign_up">
        <ol class="step">
          <li>
            STEP1
            <div>약관동의</div>
          </li>
          <li class="on">
            STEP2
            <div>이메일인증</div>
          </li>
          <li>
            STEP3
            <div>회원정보입력</div>
          </li>
          <li>
            STEP4
            <div>가입완료</div>
          </li>
        </ol>
        <div class="email_confirm">
          <h3>이메일 인증</h3>
          <p>이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.</p>
          <!-- Trigger/Open The Modal -->
          <button id="myBtn">이메일 인증</button>

          <!-- The Modal -->
          <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
              <div class="modal-header">
                <span class="close">×</span>
                <h2>이메일 인증</h2>
                <p>이메일을 확인해주세요</p>
              </div>
              <div class="modal-body">
                <input type="email" id="email" placeholder="exam@email.com" />
                <button type="button" id="email-btn">입력</button>
                <input type="text" id="auth-number" placeholder="인증번호" />
                <button type="button" id="auth-btn">입력</button>
                <div id="timer-div"></div>
                <div id="result-div"></div>
              </div>
              <div class="modal-footer"></div>
            </div>
          </div>
        </div>
        <p class="noti">
          타인의 정보 및 주민등록번호를 도용하여 기입하는 경우 3년 이하의 징역
          또는 1천 만원 이하의 벌금에 처해지게 됩니다 반드시 본인의 정보를
          이용하여 가입해주시기 바랍니다.
        </p>
      <input type="hidden" path="random" id="random" value="${random }" />
      </section>
    </div>
    <div id="footerDiv"></div>
  </body>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sign_up.js"></script>
</html>