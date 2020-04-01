<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/boardView2.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />


<div id="headerDiv"></div>
<div class="page-title">
	<h2>게시판</h2>
	<p>다양한 주제로 다양한 대화를 하세요</p>
</div>
<div class="wrap">
	<div class="container"
		style="width: 1100px; margin: 0 auto; margin-top: 150px;">
		<form name="boardViewForm" method="post">
			<input type="hidden" name="brd_seq" id="brd_seq" value="${brd_seq }">
			<input type="hidden" name="pg" id="pg" value="${pg }">

			<div id="board_wrap" style="margin-top: 100px;">
				<!-- board_title_text -->
				<div id="board_info_box">

					<div id="board_seq">글번호</div>

					<div id="board_seqText">
						<span id="seqSpan"></span>
					</div>

					<div id="board_category">글종류</div>

					<div id="board_category_text">
						<span id="categorySpan"></span>
					</div>

					<div id=board_writer>작성자</div>

					<div id="board_writer_text">
						<span id="idSpan"></span>
					</div>

					<div id=board_time>작성날짜</div>

					<div id="board_time_text">
						<span id="dateSpan"></span>
					</div>
									
				</div>
			

				<div id="board_title_box">
					<div id="board_title">제목</div>
					<div id="board_title_text">
						<span id="titleSpan"></span>
					</div>
				</div>

				<div id="board_content">
					<span id="contentSpan"> </span>

				</div>
				

				<div id="board_button">
					<input type="button" id="beforeBtn" value="이전"
						style="width: 150px; height: 30px; margin-right: 20px;"> 
					<input type="button" id="afterBtn" value="다음" onclick='mode(2)'
						style="width: 150px; height: 30px; margin-right: 20px;"> 
					<input type="button" id="listBtn" value="목록" 
						style="width: 150px; height: 30px; margin-right: 20px;">
					<input type="button" id="writeBtn" value="글작성" 
						style="width: 150px; height: 30px; margin-right: 20px;">
				</div>

				<div id="board_member_addBtn" style="text-align: center; margin-top: 10px;">
					<input type="button" id="modifyBtn" value="수정" style="width: 150px; height: 30px; margin-right: 20px;"> 
					<input type="button" id="deletBtn" value="삭제" style="width: 150px; height: 30px; margin-right: 20px;">
				</div>

				<div id="board_reply">
					<%@ include file="../board/boardReplyForm.jsp"%>
				</div>
			</div>
		</form>
	</div>
</div>
<div id="footerDiv"></div>
</body>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
<script type="text/javascript" src="../js/board_reply.js"></script>

</html>
