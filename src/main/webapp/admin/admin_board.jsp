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
    <title>admin</title>
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/admin.css" />
    <link rel="stylesheet" href="../css/sign.css" />
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
     <script src="../js/admin_board.js"></script>
  </head>
  <body>
    <div id="headerDiv"></div>
    <div class="page-title">
      <h2>admin</h2>
      <p>관리자 페이지 입니다.</p>
    </div>
    <div id="wrap">
      <div class="admin-page">
        <div class="admin-nav">
          <ol>
            <li><a href="../admin/admin">회원관리</a></li>
            <li><a href="../admin/admin_blood">헌혈견 관리</a></li>
            <li><a href="">상품 관리</a></li>
            <li class="on"><a href="../admin/admin_board">게시글 관리</a></li>
            <li><a href="../admin/admin_contact">문의 관리</a></li>
          </ol>
        </div>
        <div class="article">
        <form id="admin_boardForm" method="post">
		<div class="wrap">
			<div class="container" style="width: 1000px; height:700px; margin: 0 auto; margin-top: 150px; overflow: auto;">
				<table id="admin_boardTable" border="1"  cellpadding="5" frame="hsides " rules="rows">
					<tr height="70" style="background-color: #FFEBF0;">
						<th width="50" style="font-size: 15px; border: 1px solid black;">번호</th>
						<th width="50" style="font-size: 15px; border: 1px solid black;">종류</th>
						<th width="100" style="font-size: 15px; border: 1px solid black;">닉네임</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">이메일</th>
						<th width="300" style="font-size: 15px; border: 1px solid black;">제목</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">작성시간</th>
						<th width="100" style="font-size: 15px; border: 1px solid black;">데이터 삭제</th>
					</tr>
				</table>
			</div>
		</div>
		<div id="boardPagingDiv"></div>
	</form>
        </div>
      </div>
    </div>
    <div id="footerDiv"></div>
  </body>
</html>
