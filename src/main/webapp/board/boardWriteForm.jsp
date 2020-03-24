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
<link rel="stylesheet" href="../css/board.css">
<style>
.fr-box.fr-basic .fr-element {
	min-height: 600px !important;
}
</style>

</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		 <h2>게시판</h2>
      <p>여러분들의 이야기를 들려주세요</p>
	</div>
	<form id="boardWriteForm" name="boardwriteForm" method="post" action="boardWrite">
	<div class="wrap">
			<div class="container"
				style="width: 1100px; margin: 0 auto; margin-top: 150px;">
		<div class="board_category">
				<div id="board_category_select">
					<select id="board_select" name="category"
						style="font-size: 13px; height: 42px; text-align-last: center;">
						<option label="글 종류" selected="selected"
							style="text-align: center;"></option>
						<option label="가입" value="join"></option>
						<option label="고민" value="worry"></option>
						<option label="자랑" value="good"></option>
						<option label="헌혈" value="blood"></option>
					</select>
				</div>
			</div>

			<div class="board_title">
				<input type="text" id="insert_text" name="title" placeholder="제목을 입력하세요">
			</div>


			<div class="board_write" >
				<input type="hidden" name="content" id="content" value="">
			</div>

			<div class="board_writeBtn">
				<input id="boardWrite_Btn" type="button" value="작성하기" onclick="submit()">
			</div>
		</div>
	</div>
	</form>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/board.js"></script>

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
	var editor = new FroalaEditor('.board_write')

</script>

<script type="text/javascript">
$('#boardWrite_Btn').click(function(){
	$('#content').val($('.fr-view').html());
	$('#boardWriteForm').submit();
});
</script>

</html>

