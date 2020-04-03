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
    <title>my page</title>
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/mypage.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-3.4.1.min.js"
    ></script>
    <script
      type="text/javascript"
      src="/data/201101/IJ12941530138912/jquery-contained-sticky-scroll.js"
    ></script>
    <script src="../js/main.js"></script>
     <script src="../js/mycontact.js"></script>
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
            <li><a href="../my/mypage">내 정보</a></li>
            <li><a href="">헌혈견</a></li>
            <li><a href="">상품 </a></li>
            <li><a href="../board/myboard">내 게시글 </a></li>
            <li class="on"><a href="../contact/mycontact">내 문의 </a></li>
          </ol>
        </div>
        <div class="article">
        <div id="my-write" style="width: 1100px; margin: 0 auto;  margin-top:100px; margin-bottom: 80px; border: 1px solid red;">
		<form id="myContactForm">
			<div class="mycon-container"
				style="width: 1100px; margin: 0 auto; text-align: center;">
				<table id="my_contactTable" border="1" cellpadding="5" frame="hsides " rules="rows">
					<tr height="70">
						<th width="200" style="font-size: 15px; border: 1px solid black;">번호</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">주제</th>
						<th width="300" style="font-size: 15px; border: 1px solid black;">내용</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">작성날짜</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">삭제</th>
					</tr>
				</table>
			</div>
		</form>
	</div>
        </div>
      </div>
    </div>
    <div id="footerDiv"></div>
  </body>
</html>