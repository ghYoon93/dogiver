<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<style type="text/css">
.fr-view {
	height: 500px;
	!
	important;
}
</style>
</head>

<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>게시판</h2>
		<p>여러분들의 이야기를 들려주세요</p>
	</div>
	<form id="modifyForm" name="modifyForm" method="post" action="boardModify">
		<input type="hidden" id="brd_seq" name="brd_seq" value="${brd_seq }">
		<input type="hidden" id="category" name="category" value="${boardDTO.brd_category }">
		<input type="hidden" id="content" name="content" value="${boardDTO.brd_content }">
		<div class="wrap">
			<div class="container"
				style="width: 1100px; margin: 0 auto; margin-top: 150px;">
				<div class="board_category">
					<div id="board_category_select">
						<select id="brd_category" name="brd_category" style="font-size: 13px; height: 42px; text-align-last: center;">
							<option label="글 종류" style="text-align: center;"></option>
							<option label="가입" value="가입">가입</option>
							<option label="고민" value="고민">고민</option>
							<option label="자랑" value="자랑">자랑</option>
							<option label="헌혈" value="헌혈">헌혈</option>
						</select>
					</div>
				</div>
				<div class="board_title">

					<input type="text" id="insert_text" name="brd_title" value="${boardDTO.brd_title }"
						placeholder="제목을 입력하세요">
				</div>


				<div class="board_write">
					<textarea name="brd_content" id="brd_content"></textarea>
				</div>

				<div class="board_writeBtn">
					<input type="button" id="boardModifyBtn" name="boardModifyBtn" 
						value="수정하기">
				</div>
			</div>
		</div>
	</form>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.fr-placeholder').text('');
	$('.fr-view').html($('#content').val());
	
	var option = $('#category').val(); //선택된 옵션
	
	$('#brd_category option').each(function() {
			if($(this).val()==option){
				$(this).prop('selected', true);
				return false;
			} 
		 });  

	$('#boardModifyBtn').click(function() {
			if ($('#brd_category').val() == '') {
				alert("카테고리를 정해주세요.");
				$('#brd_category').focus();
	
			} else if ($('#insert_text').val() == '') {
				alert("제목을 입력해주세요.");
				$('#insert_text').focus();
	
			} else if ($('.fr-view').text() == '') {
				alert("내용을 입력해주세요.");
				$('.fr-view').focus();
			} else {
				$('#brd_content').val($('.fr-view').html());
				$('#modifyForm').submit();
				alert("글이 수정되었습니다.")
				location.href = 'boardList';
			}
		});
});
</script>
<script type="text/javascript">
	$("#file").on('change', function() {
		var fileName = $("#file").val();
		$(".upload-name").val(fileName);
	});
</script>
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@3.0.6/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/froala-editor@3.0.6/js/froala_editor.pkgd.min.js">
	
</script>
<script type="text/javascript">
	var editor = new FroalaEditor('#brd_content')
</script> 
</html>


