<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<style type="text/css">
#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: blue;
	text-decoration: underline;
}

#subjectA:active {
	color: black;
	text-decoration: none;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#boardListTable td {
	height: 50px;
}

#boardListTable th {
	border: 2px solid #ab2328;
}
</style>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>게시판</h2>
		<p>다양한 주제로 다양한 대화를 하세요</p>
	</div>
	<form id="boardListForm">
		<div class="wrap">
			<div class="container"
				style="width: 1100px; margin: 0 auto; margin-top: 150px;">
				<input type="hidden" id="pg" name="pg" value="${pg }">
				<table id="boardListTable" border="1" cellpadding="5"
					frame="hsides " rules="rows" style="color: #ab2328;">
					<tr height="70">
						<th width="100" style="font-size: 15px;">글번호</th>
						<th width="100" style="font-size: 15px;">글종류</th>
						<th width="500" style="font-size: 15px;">제목</th>
						<th width="150" style="font-size: 15px;">작성자</th>
						<th width="150" style="font-size: 15px;">작성일</th>
						<th width="100" style="font-size: 15px;">조회수</th>
					</tr>
				</table>

				<div id="boardPagingDiv"
					style="display: inline-block; margin: 0 auto; width: 1100px; text-align: center; margin-top: 30px;">
				</div>

				<div id="boardOptionDiv" style="text-align: center; width: 1015px; margin-top: 30px;  display: inline-block; margin-left: 90px;">
					<div id="selectDiv" style="text-align: right; width: 200px; height: 50px;  display: inline-block; float: left;">
						<select name="searchOption" id="searchOption"
							style="width: 100px; height: 40px; text-align-last: center;">
							<option value="brd_title">제목
							<option value="brd_id">아이디
							<option value="brd_category">종류
						</select>
					</div>
					<div id="keywordDiv" style="text-align: center; width: 400px; height: 50px; display: inline-block; float: left;">
						<!-- 검색어가 사라지지 않게 -->
						<input type="text" name="keyword" id="keyword" value="${keyword }"
							placeholder="검색어 입력" style="width: 390px; height: 36px; ">
					</div>
					<div id="searchBtnDiv" style="text-align: left; width: 103px; height: 50px; display: inline-block; float: left;">
						<input type="button" id="boardSearchBtn" value="검색" style="width: 100px; height: 40px;">
					</div>
					<div id="writeBtnDiv" style="text-align: left; width: 200px; height: 50px;  display: inline-block;  float: left;">
						<input type="button" id="boardWriteBtn" value="글쓰기" style="width: 100px; height: 40px;"  onclick="location.href='/dogiver/board/boardWriteForm'">
					</div>
				</div>
			</div>
		</div>
	</form>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
<script type="text/javascript">
$('#keyword').keypress(function(event){
    if ( event.which == 13 ) {
        $('#boardSearchBtn').click();
        return false;
    }
});
</script>
<script type="text/javascript">
	function boardSearch(pg) {
		//location.href='getBoardSearch?pg='+pg+'&searchOption=${searchOption}'+'&keyword=${keyword}'
		$('#pg').val(pg);
		$('#boardSearchBtn').trigger('click');
	}
</script>
</html>