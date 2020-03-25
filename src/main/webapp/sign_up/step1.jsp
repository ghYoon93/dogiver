<<<<<<< HEAD
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
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/sign.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-3.4.1.min.js"
    ></script>
    <script src="../js/main.js"></script>
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
          <li class="on">
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
      <input type="hidden" id="hidden"></input>
      </section>
    </div>
    <div id="footerDiv"></div>
  </body>
  <script type="text/javascript" src="../js/sign_up.js"></script>
</html>
=======
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
        <li class="on">
          STEP1
          <div>약관동의</div>
        </li>
        <li>
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
      <div class="agree">
      <h3 class="h3">이용약관 <span>(필수)</span></h3>
      <div class="agree_box">
        <p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><Dogner>('Dogner')</em> 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p><p class="ls2">○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">4</em>월 <em class="emphasis">1</em>일부터 시행됩니다.</p></br><p class='lh6 bs4'><strong>1. 개인정보의 처리 목적 <em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</strong></p><p class="ls2">가. 홈페이지 회원가입 및 관리</p><p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인 등을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">나. 재화 또는 서비스 제공</p><p class="ls2">물품배송, 서비스 제공, 본인인증, 요금결제·정산 등을 목적으로 개인정보를 처리합니다.</p></br></br></br><p class='lh6 bs4'><strong>2. 개인정보 파일 현황</br></strong></p><p class='ls2'>1. 개인정보 파일명 : member</br> - 개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 생년월일, 이름</br> - 수집방법 : 홈페이지</br> - 보유근거 : test</br>  - 보유기간 : 준영구</br>  - 관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년</p></br></br></br><p class='lh6 bs4'><strong>3. 개인정보의 처리 및 보유 기간</strong></br></br>① <em class="emphasis"><Dogner>('Dogner')</em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>1.<홈페이지 회원가입 및 관리></br><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여 보유.이용됩니다.</br>-보유근거 : test</br>-관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</br>2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년</br></br>-예외사유 : </br></br></br></br><p class='lh6 bs4'><strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br></br> ① <em class="emphasis"><Dogner>('http://dogner.com'이하 'Dogner')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>②  <em class="emphasis"><Dogner>('http://dogner.com')</em>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</br></br><p class='ls2'></br>1. <test></br>- 개인정보를 제공받는 자 : test</br>- 제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호</br>- 제공받는 자의 보유.이용기간: 준영구</p></br></br><p class='lh6 bs4'><strong>5. 개인정보처리 위탁</strong></br></br> ① <em class="emphasis"><Dogner>('Dogner')</em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p><p class='ls2'>1. <test></br>- 위탁받는 자 (수탁자) : setset</br>- 위탁하는 업무의 내용 : 구매 및 요금 결제, 물품배송 또는 청구서 등 발송, 본인인증(금융거래, 금융서비스)</br>- 위탁기간 : 준영구</p></br></br>②  <em class="emphasis"><Dogner>('http://dogner.com'이하 'Dogner')</em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br></br>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br>
    
    <p class="lh6 bs4"><strong>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</strong></p><p class="ls2">① 정보주체는 Dogner에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</br>② 제1항에 따른 권리 행사는Dogner에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 Dogner은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</br>④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</br>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</br>⑥ Dogner은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'><strong>7. 처리하는 개인정보의 항목 작성 </strong></br></br> ① <em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p><p class='ls2'>1<홈페이지 회원가입 및 관리></br>- 필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID</br>- 선택항목 : 이메일, 휴대전화번호</p></br></br></br><p class='lh6 bs4'><strong>8. 개인정보의 파기<em class="emphasis"><Dogner>('Dogner')</em>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</strong></p><p class='ls2'>-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</br></br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</p><p class='ls2'>-파기방법</br>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</p></br></br><p class="lh6 bs4"><strong>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong></p><p class="ls2">① Dogner 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다.
    ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
    가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
    나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
    다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</br></br><p class='lh6 bs4'><strong>10. 개인정보 보호책임자 작성 </strong></p><br/> ①  Dogner(‘http://dogner.com’이하 ‘Dogner) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<p class='ls2'><br/>▶ 개인정보 보호책임자 <br/>성명 :qq<br/>직책 :qq<br/>직급 :qq<br/>연락처 :qq, qq, qq<br/>※ 개인정보 보호 담당부서로 연결됩니다.<br/> <br/>▶ 개인정보 보호 담당부서<br/>부서명 :qq<br/>담당자 :qq<br/>연락처 :qq, qq, qq<br/>② 정보주체께서는 Dogner(‘http://dogner.com’이하 ‘Dogner) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. Dogner(‘http://dogner.com’이하 ‘Dogner) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p></br></br><p class='lh6 bs4'><strong>11. 개인정보 처리방침 변경 </strong></p><p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p></br></br><p class='lh6 bs4'><strong>12. 개인정보의 안전성 확보 조치 <em class="emphasis"><Dogner>('Dogner')</em>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</strong></p><p class='ls2'>1. 정기적인 자체 감사 실시</br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br>2. 해킹 등에 대비한 기술적 대책</br> <<em class="emphasis">Dogner</em>>('<em class="emphasis">Dogner</em>')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</br></br>3. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br></br></p></p>
    </div>
      <input type="checkbox" id="chk1-1" />
      <label for="chk1-1">이용약관에 동의합니다.</label>
      
            <h3 class="h3">광고성 정보 수신동의 <span id="choice">(선택)</span></h3>
      <div class="agree_box">
        <p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><Dogner>('Dogner')</em> 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p><p class="ls2">○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">4</em>월 <em class="emphasis">1</em>일부터 시행됩니다.</p></br><p class='lh6 bs4'><strong>1. 개인정보의 처리 목적 <em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</strong></p><p class="ls2">가. 홈페이지 회원가입 및 관리</p><p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인 등을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">나. 재화 또는 서비스 제공</p><p class="ls2">물품배송, 서비스 제공, 본인인증, 요금결제·정산 등을 목적으로 개인정보를 처리합니다.</p></br></br></br><p class='lh6 bs4'><strong>2. 개인정보 파일 현황</br></strong></p><p class='ls2'>1. 개인정보 파일명 : member</br> - 개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 생년월일, 이름</br> - 수집방법 : 홈페이지</br> - 보유근거 : test</br>  - 보유기간 : 준영구</br>  - 관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년</p></br></br></br><p class='lh6 bs4'><strong>3. 개인정보의 처리 및 보유 기간</strong></br></br>① <em class="emphasis"><Dogner>('Dogner')</em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>1.<홈페이지 회원가입 및 관리></br><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여 보유.이용됩니다.</br>-보유근거 : test</br>-관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</br>2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년</br></br>-예외사유 : </br></br></br></br><p class='lh6 bs4'><strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br></br> ① <em class="emphasis"><Dogner>('http://dogner.com'이하 'Dogner')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>②  <em class="emphasis"><Dogner>('http://dogner.com')</em>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</br></br><p class='ls2'></br>1. <test></br>- 개인정보를 제공받는 자 : test</br>- 제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호</br>- 제공받는 자의 보유.이용기간: 준영구</p></br></br><p class='lh6 bs4'><strong>5. 개인정보처리 위탁</strong></br></br> ① <em class="emphasis"><Dogner>('Dogner')</em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p><p class='ls2'>1. <test></br>- 위탁받는 자 (수탁자) : setset</br>- 위탁하는 업무의 내용 : 구매 및 요금 결제, 물품배송 또는 청구서 등 발송, 본인인증(금융거래, 금융서비스)</br>- 위탁기간 : 준영구</p></br></br>②  <em class="emphasis"><Dogner>('http://dogner.com'이하 'Dogner')</em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br></br>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br>
    
    <p class="lh6 bs4"><strong>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</strong></p><p class="ls2">① 정보주체는 Dogner에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</br>② 제1항에 따른 권리 행사는Dogner에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 Dogner은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</br>④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</br>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</br>⑥ Dogner은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'><strong>7. 처리하는 개인정보의 항목 작성 </strong></br></br> ① <em class="emphasis"><Dogner>('http://dogner.com'이하  'Dogner')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p><p class='ls2'>1<홈페이지 회원가입 및 관리></br>- 필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID</br>- 선택항목 : 이메일, 휴대전화번호</p></br></br></br><p class='lh6 bs4'><strong>8. 개인정보의 파기<em class="emphasis"><Dogner>('Dogner')</em>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</strong></p><p class='ls2'>-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</br></br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</p><p class='ls2'>-파기방법</br>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</p></br></br><p class="lh6 bs4"><strong>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong></p><p class="ls2">① Dogner 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다.
    ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
    가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
    나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
    다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</br></br><p class='lh6 bs4'><strong>10. 개인정보 보호책임자 작성 </strong></p><br/> ①  Dogner(‘http://dogner.com’이하 ‘Dogner) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<p class='ls2'><br/>▶ 개인정보 보호책임자 <br/>성명 :qq<br/>직책 :qq<br/>직급 :qq<br/>연락처 :qq, qq, qq<br/>※ 개인정보 보호 담당부서로 연결됩니다.<br/> <br/>▶ 개인정보 보호 담당부서<br/>부서명 :qq<br/>담당자 :qq<br/>연락처 :qq, qq, qq<br/>② 정보주체께서는 Dogner(‘http://dogner.com’이하 ‘Dogner) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. Dogner(‘http://dogner.com’이하 ‘Dogner) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p></br></br><p class='lh6 bs4'><strong>11. 개인정보 처리방침 변경 </strong></p><p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p></br></br><p class='lh6 bs4'><strong>12. 개인정보의 안전성 확보 조치 <em class="emphasis"><Dogner>('Dogner')</em>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</strong></p><p class='ls2'>1. 정기적인 자체 감사 실시</br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br>2. 해킹 등에 대비한 기술적 대책</br> <<em class="emphasis">Dogner</em>>('<em class="emphasis">Dogner</em>')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</br></br>3. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br></br></p></p>
    </div>
      <input type="checkbox" id="chk1-2" />
      <label for="chk1-2">이용약관에 동의합니다.</label>
      
      <input type="checkbox" id="chkAll" />
      <label for="chkAll" style="display:block; text-align:center; margin-top:30px;">상기 이용약관을 모두 읽었으며 전체동의합니다.</label>
    <div class="btn_center"> <button class="btn_1" id="btn_1">다음</button></div> 
        <!-- 모달 -->
	 <div id="chkModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
              <div class="modal-header">
                <h2>경고</h2>
              </div>
              <div class="modal-body">
              	<div id="chk-message">필수 약관에 동의해 주세요.</span>
              </div>
            </div>
          </div>
  	</div>
    </section>
  </div>
  <div id="footerDiv"></div>
  </body>
  <script type="text/javascript" src="../js/sign_up.js"></script>
</html>
>>>>>>> 회원가입
