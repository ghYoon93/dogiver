<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<style type="text/css">
textarea {
	resize: none;
}

textarea:focus {
	outline-color: orange;
}

input:focus {
	outline-color: orange;
}

#contact_wrap {
	width: 1100px;
	margin: 0 auto;
}

#contact_img {
	width: 1100px;
	height: 500px;
	object-fit: cover; /* 아래에서 다룰 속성값 */
}

#contact_infoDiv {
	font-weight:bold;
	position: relative;
	top: 13px;
	z-index: 1;
	display: inline-block;
	width: 424px;
	height: 436px;
	background-color: none;
}

#contact_imgDiv {
	position: relative;
	top: -100px;
	z-index: 0;
}

#contact_visitor {
	position: relative;
	left: 800px;
	top: -172px;
	z-index: 1;
	width: 300px;
	height: 500px;
}

#nameText {
	background-color: rgba(70, 70, 70, 1);
	color: white;
	maxlength: 100px;
	width: 256px;
	height: 37px;
}

#emailText {
	margin-top: 10px;
	background-color: rgba(70, 70, 70, 1);
	color: white;
	maxlength: 100px;
	width: 256px;
	height: 37px;
	background-color: rgba(70, 70, 70, 1);
}

#phoneText {
	margin-top: 10px;
	background-color: rgba(70, 70, 70, 1);
	color: white;
	maxlength: 100px;
	width: 256px;
	height: 37px;
}

#subjectText {
	margin-top: 10px;
	background-color: rgba(70, 70, 70, 1);
	color: white;
	maxlength: 100px;
	width: 256px;
	height: 37px;
}

#textarea {
	margin-top: 10px;
	background-color: rgba(70, 70, 70, 1);
	color: white;
	padding-right: 10px;
	resize: none;
	width: 246px;
	height: 149px;
}

#contact_textarea {
	padding-left: 24px;
	color: white;
	background-color: rgba(70, 70, 70, 1);
	border: none;
	width: 230px;
	height: 145px;
}

#text_name {
	padding-left: 24px;
	color: white;
	background-color: rgba(70, 70, 70, 1);
	border: none;
	width: 232px;
	height: 35px;
}

#text_email {
	padding-left: 24px;
	color: white;
	background-color: rgba(70, 70, 70, 1);
	border: none;
	width: 232px;
	height: 35px;
}

#text_subject {
	padding-left: 24px;
	color: white;
	background-color: rgba(70, 70, 70, 1);
	border: none;
	width: 232px;
	height: 35px;
}

#text_phone {
	padding-left: 24px;
	color: white;
	background-color: rgba(70, 70, 70, 1);
	border: none;
	width: 232px;
	height: 35px;
}

#buttonDiv {
	margin-top: 10px;
	cursor: pointer;
	height: 34px;
	min-height: 25px;
	width: 256px;
	text-align: center;
	display: inline-block;
	cursor: pointer;
}
</style>
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
						<span style="letter-spacing: 0.02em; font-size: 16px;"> We are DogIVER. You
							are interested in us and we are also interested in you. If you
							have any further information or inquiries, please leave a brief
							message and we will contact you soon. May all of us be of help to
							each other.</span>
					</p>
				</div>

			</div>
			<!--이미지 DIV  -->
			<div id="contact_imgDiv">
				<img id="contact_img" src="../image/dog3.jpg">
			</div>
	<form id="contactForm" method="post">
			<div id="contact_visitor">
				<div id="nameText">
					<input id="text_name" name="name" type="text" placeholder="Name">
				</div>


				<div id="emailText">
					<input id="text_email" name="email" type="text" placeholder="Email">
				</div>

				<div id="phoneText">
					<input id="text_phone" name="phone" type="text" placeholder="Phone">
				</div>

				<div id="subjectText">
					<input id="text_subject" name="subject" type="text" placeholder="Subject">
				</div>

				<div id="textarea">
					<textarea id="contact_textarea" name="content"
						placeholder="Type your message here..."></textarea>
				</div>

				<div id="buttonDiv">
					<input type="button" id="contact_button" style="cursor: pointer"
						value="Submit">
				</div>
				<div id="OK_signDiv" style="text-align: center;"> </div>
			</div>
			</form>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"
	charset="URF-8"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/contact.js"></script>

</html>

