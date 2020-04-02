<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/boardList.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<style type="text/css">

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
			<input type="hidden" id="pg" value="${pg }">
			
			
			<div class="content_info">
				<table id="boardListTable" border="1" cellpadding="5"
					frame="hsides " rules="rows" style="color: #ab2328;">
					<tr height="70" style="font-size: 20px; font-weight: bold">
						<th width="100">글번호</th>
						<th width="100">글종류</th>
						<th width="500">제목</th>
						<th width="150">닉네임</th>
						<th width="150">작성일</th>
					</tr>
				</table>
			</div>
			
					
			
			
			

				<div id="boardPagingDiv"></div>

				<div id="boardOptionDiv">
					
						<input type="hidden" name="pg" value="1">
						<select name="searchOption" id="searchOption" >
							<option value="brd_title">제목
							<option value="brd_nickname">닉네임
							<option value="brd_category">종류
							</option>
						</select>
					
				
						<!-- 검색어가 사라지지 않게 -->
						<input type="text" name="keyword" id="keyword" value="${keyword }"
							placeholder="검색어 입력" style="width: 390px; height: 36px; ">
					
					
						<input type="button" id="boardSearchBtn" value="검색" 
						style="width: 100px; height: 40px;">
					
				
						<input type="button" id="boardWriteBtn" value="글쓰기" 
						style="width: 100px; height: 40px;"  onclick="location.href='/dogiver/board/boardWriteForm'">
					
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
		$('input[name=pg]').val(pg);
		$('#boardSearchBtn').trigger('click','trigger');
	}
</script>
</html>