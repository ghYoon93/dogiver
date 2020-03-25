<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<style type="text/css">
.contents {
	white-space: pre-line;
	word-break: break-all;
	width: 450px;
}
</style>
<div id="headerDiv"></div>
<div class="page-title">
	<h2>게시판</h2>
	<p>다양한 주제로 다양한 대화를 하세요</p>
</div>
<div class="wrap">
	<div class="container"
		style="width: 1100px; margin: 0 auto; margin-top: 150px;">
		<form name="boardViewForm">
			<input type="hidden" name="seq" id="seq" value="${seq }"> <input
				type="hidden" name="pg" id="pg" value="${pg }">

			<table border="1" cellpadding="5" frame="hsides" rules="rows">
				<tr>
					<td colspan="3">
						<h3>
							<span id="subjectSpan"></span>
						</h3>
					</td>
				</tr>
				<tr>
					<td width="100">글번호 : <span id="seqSpan"></span></td>
					<td width="100">글종류 : <span id="categorySpan"></span></td>
					<td width="600">제목 : <span id="titleSpan"></span></td>
					<td width="100">작성자 : <span id="idSpan"></span></td>
					<td width="100">작성일 : <span id="dateSpan"></span></td>
					<td width="100">조회수 : <span id="hitSpan"></span></td>
					
				</tr>
				<tr>
					<td colspan="3" height="200" valign="top"><pre
							class="contents">
							<span id="contentSpan"></span>
						</pre></td>
				</tr>
			</table>
			<input type="button" value="목록"
				onclick="location.href='boardList?pg=${pg}'"> <span
				id="boardViewSpan"> <input type="button" value="글수정"
				onclick="mode(1)"> <input type="button" value="글삭제"
				onclick="mode(2)">
			</span>
		</form>
	</div>
</div>

<script type="text/javascript">
	function mode(num) {
		if (num == 1) {
			document.boardViewForm.method = 'post';
			document.boardViewForm.action = 'boardModifyForm';
			document.boardViewForm.submit();

		} else if (num == 2) {
			document.boardViewForm.method = 'post';
			document.boardViewForm.action = 'boardDelete';
			document.boardViewForm.submit();

		}
	}
</script>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'post',
			url : '/dogiver/board/getBoardView',
			data : 'seq=' + $('#seq').val(),
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));

				$('#seqSpan').text(data.boardDTO.brd_seq);
				$('#categorySpan').text(data.boardDTO.brd_category);
				$('#titleSpan').text(data.boardDTO.brd_title);
				$('#idSpan').text(data.boardDTO.brd_id);
				$('#dateSpan').text(data.boardDTO.brd_logtime);
				$('#hitSpan').text(data.boardDTO.brd_hit);

				if (data.memId == data.boardDTO.brd_id)
					$('#boardViewSpan').show();
				else
					$('#boardViewSpan').hide();
			}
		});
	});
</script>
</html>
