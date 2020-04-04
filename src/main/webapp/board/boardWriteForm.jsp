<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="stylesheet" href="../css/board.css">
<script
	src="https://cdn.ckeditor.com/ckeditor5/18.0.0/classic/ckeditor.js"></script>
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
	<form id="boardWriteForm" name="boardwriteForm" method="post"
		action="boardWrite">

		<input type="hidden" id="role" value="${role }">

		
		<div class="wrap">
			<div class="container"
				style="width: 1100px; margin: 0 auto; margin-top: 150px;">
				<div class="board_category">
					<div id="board_category_select">
						<select id="board_select" name="brd_category">
							<option label="글종류" style="text-align: center; "></option>
							<option value="가입">가입</option>
							<option value="고민">고민</option>
							<option value="자랑">자랑</option>
							<option value="헌혈">헌혈</option>
						</select>
					</div>
				</div>

				<div class="board_title">

					<input type="text" id="insert_text" name="brd_title"
						placeholder="제목을 입력하세요">
				</div>


				<div class="board_write">
					<textarea name="brd_content" id="brd_content"></textarea>
					<input type="hidden" id="text_hidden">
				</div>

				<div class="board_writeBtn">
					<input type="button" id="boardWrite_Btn" name="boardWrite_Btn"
						value="작성하기">
				</div>
			</div>
		</div>
	</form>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if($('#role').val()=='admin'){
		$('#board_select').append("<option value='공지'>공지</option>")
	}
	//클릭이벤트 발생
	$('#boardWrite_Btn').click(function() {
		if ($('#board_select').val() == '') {
			alert("plase selecet the Category");
			$('#board_select').focus();

		} else if ($('#insert_text').val() == '') {
			alert("plase insert your Title");
			$('#insert_text').focus();

		} else if ($('.fr-wrapper').text() == '') {
			alert("plase insert your Content");
			$('.fr-wrapper').focus();
		} else {
			$('#brd_content').val($('.fr-view').html());
			$('#boardWriteForm').submit();
			alert("글이 작성되었습니다.")
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

