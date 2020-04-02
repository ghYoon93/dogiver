<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<link rel="favicon" href="../image/favicon.ico" />
<link rel="shortcut icon" href="../image/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>my page</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/mypage.css" />
<link rel="stylesheet" href="../css/sign.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/main.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>my page</h2>
		<p>나의 정보들</p>
	</div>
	<div id="wrap">
		<div class="mypage">
			<div class="my-nav">
				<ol>
					<li class="on"><a href="../my/mypage">내 정보</a></li>
					<li><a href="../blood/myblood">헌혈견</a></li>
					<li><a href="">상품</a></li>
					<li><a href="../board/myboard">내 게시글 </a></li>
					<li><a href="">내 문의</a></li>
				</ol>
			</div>
			<div class="article">
				<form id="modi-form">
					<div class="sign_insert">
						<h3>내 정보</h3>
						<p id="modi-p">정보를 수정하려면 비밀번호를 입력하세요</p>
						<ul>
							<li><label>이메일 <sapn>(수정불가)</sapn><br /> <input type="text" title="이메일"
									name="email" id="email" value="${memEmail}" readonly />
							</label>
								<div id="emailDiv"></div></li>
							<li id="pre-pwd-li"><label>비밀번호<br /> <input type="password"
									title="우선입력 비밀번호" name="pre-pwd" id="pre-pwd"
									placeholder="비밀번호" />
							</label>
								<div id="pre-pwdDiv"></div></li>
							<div id="after">
								<li><label>이름 <sapn>(수정불가)</sapn><br /> <input type="text" title="이름"
										name="name" id="name" readonly />
								</label>
									<div id="nameDiv"></div></li>
								<li><label>닉네임<br /> <input type="text"
										placeholder="닉네임" title="닉네임" name="nickName" id="nickName"/>
								</label>
									<div id="nickNameDiv"></div></li>
								<li><label>비밀번호<br /> <input type="password"
										placeholder="비밀번호" title="비밀번호" name="pwd" id="pwd" />
								</label>
									<div id="pwdDiv"></div></li>
								<li><label>비밀번호재확인<br /> <input type="password"
										placeholder="비밀번호재확인" title="비밀번호재확인" name="rePwd" id="rePwd" />
								</label>
									<div id="rePwdDiv"></div></li>
								<li><label>전화번호<br /> <input type="tel"
										placeholder="전화번호" title="전화번호" name="pre-phone"
										id="pre-phone" maxlength="13" />
								</label>
									<div id="phoneDiv"></div></li>
								<li><label>주소<br /> <input type="text"
										name="zipcode" id="zipcode" placeholder="우편번호" readonly />
										<button type="button" class="btn_2" id="btn_2"
											onclick="sample2_execDaumPostcode()">우편번호검색</button> <br />
										<input type="text" name="addr" id="addr" placeholder="주소"
										readonly /> <br /> <input type="text" name="addr_Detail"
										id="addr_Detail" placeholder="상세주소" />
								</label></li>
							</div>
						</ul>
					</div>
					<input type="hidden" id="phone" name="phone" value=""
						maxlength="13" />
					<div class="btn_center">
						<button type="button" class="btn_1" id="pre-modi-btn">입력</button>
						<button type="button" class="btn_1" id="modi-btn">수정</button>
						<button type="button" class="btn_1" id="drop-btn">탈퇴</button>
					</div>
				</form>
			</div>
			<!-- 모달 -->
			<div id="modiModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<h2 id="modi-message-header"></h2>
					</div>
					<div class="modal-body">
						<div id="modi-message" class="message"></div>
					</div>
				</div>
			</div>
			<!-- 주소 -->
			<div id="layer"
				style="display: none; position: absolute; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch; border-radius:5px;">
				<img src="http://t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnCloseLayer"
					style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
					onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
<script type="text/javascript" src="../js/mypage.js"></script>
</html>
