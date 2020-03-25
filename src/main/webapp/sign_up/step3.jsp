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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
	<div id="headerDiv"></div>

	<div class="page-title">
		<h2>회원가입</h2>
		<p>회원이 되셔서 dogiver를 이용하세요</p>
	</div>
	<section class="sign_up">
		<ol class="step">
			<li>STEP1
				<div>이메일인증</div>
			</li>
			<li>STEP2
				<div>약관동의</div>
			</li>
			<li class="on">STEP3
				<div>회원정보입력</div>
			</li>
			<li>STEP4
				<div>가입완료</div>
			</li>
		</ol>
		<form action="">
			<div class="sign_insert">
				<h3>회원정보입력</h3>
				<ul>
					<li><label>이름<br /> <input
							type="text" placeholder="이름" title="이름" name="name" id="name"/>
					</label>
					<div id="nameDiv"></div></li>
					<li><label>닉네임<br /> <input
							type="text" placeholder="닉네임" title="닉네임" name="nickName" id="nickName" />
					</label><div id="nickNameDiv"></div></li>
					<li><label>비밀번호<br /> <input
							type="password" placeholder="비밀번호" title="비밀번호" name="pwd" id="pwd"/>
					</label><div id="pwdDiv"></div></li>
					<li><label>비밀번호재확인<br /> <input
							type="password" placeholder="비밀번호재확인" title="비밀번호재확인" name="rePwd" id="rePwd"/>
					</label><div id="rePwdDiv"></div></li>
					<li><label>전화번호 <span>(선택)</span><br />
							<input type="tel" placeholder="- 를 제외하고 입력하세요" title="전화번호" name="phone" id="phone"/>
					</label><div id="phoneDiv"></div></li>
					<li><label>주소 <span>(선택)</span><br />
							<input type="text" name="zipcode" id="zipcode" placeholder="우편번호"
							readonly /> <button type="button" class="btn_2" id="btn_2">우편번호검색</button>
							<br /> <input type="text" name="addr1" id="addr1"
							placeholder="주소" readonly /> <br /> <input
							type="text" name="addr2" id="addr2" placeholder="상세주소" />
					</label></li>
				</ul>
			</div>
			<div class="btn_center">
				<button class="btn_1" id="btn_2">회원가입</button>
			</div>
			<!-- 모달 -->
			<div id="chkModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<h2>주의</h2>
					</div>
					<div class="modal-body">
						<div id="chk-message">
							필수 약관에 동의해 주세요.</span>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<div id="footerDiv"></div>
</body>
</html>
