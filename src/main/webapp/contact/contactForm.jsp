<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contact.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<title>문의하기</title>
</head>

<body>
	<!--전체 DIV  -->
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>문의하기</h2>
		<p>문의하시면 신속하게 답변 드리겠습니다</p>
	</div>
	<div class="wrap">
		<div class="container"
			style="width: 1100px; margin: 0 auto; margin-top: 100px;">
			<div id="contact_infoDiv">
				<h2 class="font_2"
					style="line-height: 2.5em; margin-left: 80px; margin-top: 70px;">
					<span style="letter-spacing: 0.2em; font: bold; font-size: 50px;">
						Stay<br> in<br> Touch
					</span>
				</h2>

				<div style="width: 328px; min-height: 180px; pointer-events: none;"
					data-min-height="180">
					<p class="font_8" style="line-height: 1.5em; margin-left: 80px;">
						<span style="letter-spacing: 0.02em; font-size: 16px;"> We
							are DogIVER. You are interested in us and we are also interested
							in you. If you have any further information or inquiries, please
							leave a brief message and we will contact you soon. May all of us
							be of help to each other.</span>
					</p>
				</div>

			</div>
			<!--이미지 DIV  -->
			<div id="contact_imgDiv">
				<img id="contact_img" src="${pageContext.request.contextPath}/resources/img/dog3.jpg" style=" border-radius: 30px;">
			</div>
			<form id="contactForm" method="post">
				<div id="contact_visitor">
					<div id="nameText">
						<input id="text_name" name="name" type="text" placeholder="이름">
					</div>


					<div id="emailText">
						<input id="text_email" name="email" type="text"
							placeholder="이메일">
					</div>

					<div id="phoneText">
						<input id="text_phone" name="phone" type="text"
							placeholder="핸드폰 번호 (-없이 입력)">
					</div>

					<div id="subjectText">
						<input id="text_subject" name="subject" type="text"
							placeholder="방문목적">
					</div>

					<div id="textarea">
						<textarea id="contact_textarea" name="content"
							placeholder="내용을 입력"></textarea>
					</div>

					<div id="buttonDiv">
						<input type="button" id="contact_button" value="문의하기">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"
	charset="URF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/contact.js"></script>
</html>

