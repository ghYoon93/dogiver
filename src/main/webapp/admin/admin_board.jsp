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
     <link rel="stylesheet" href="../css/admin_board.css" />
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
            <li><a href="../admin/admin_goods">상품 관리</a></li>
            <li class="on"><a href="../admin/admin_board">게시글 관리</a></li>
            <li><a href="../admin/admin_contact">문의 관리</a></li>
          </ol>
        </div>
        <div class="article">
        <form id="admin_boardForm" method="post">
		<div class="wrap">
			<div class="board_container" >
				<table id="admin_boardTable" border="1"  cellpadding="5" frame="hsides " rules="rows">
					<tr height="70" style="background-color: #FFEBF0;">
					
						<th id="admin_boardTable_th1" width="50">번호</th>
						<th id="admin_boardTable_th2" width="50">종류</th>
						<th id="admin_boardTable_th3" width="100">닉네임</th>
						<th id="admin_boardTable_th4" width="200">이메일</th>
						<th id="admin_boardTable_th5" width="300">제목</th>
						<th id="admin_boardTable_th6" width="200">작성시간</th>
						<th id="admin_boardTable_th7" width="100">데이터 삭제</th>
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
