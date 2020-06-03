// 데이터 뿌려주기
$(document).ready(function() {
	$.ajax({
		type : 'post',
		url : '/dogiver/board/getBoardView',
		data : 'brd_seq=' + $('#brd_seq').val(),
		dataType : 'json',
		success : function(data) {
//			alert(data.role);
			$('#seqSpan').text(data.boardDTO.brd_seq);
			$('#categorySpan').text(data.boardDTO.brd_category);
			$('#titleSpan').text(data.boardDTO.brd_title);
			$('#idSpan').text(data.boardDTO.brd_nickname);
			$('#dateSpan').text(data.boardDTO.brd_logtime);
			$('#contentSpan').html(data.boardDTO.brd_content);
			$('#brd_seq').val(data.boardDTO.brd_seq);
			$('#re_seq').val(data.boardDTO.re_seq);
			
			let tag='';
			$.each(data.list, function(index, items) {
				$('#re_content').val('');
				tag += '<div class="comment">'
						+ '<div id="comment-writer">'
						+ items.re_writer + '</div>'
						+ '<div id="comment-logtime">'
						+ items.re_logtime + '</div>'
						+ '<a href="#" id='+items.re_seq+' class="delete_btn">삭제</a>'
						+ '<div id="comment-content">'
						+ items.re_content + '</div>'
						+ '</div>'
			});
			$('#contentDiv').append(tag);
			//alert(data.memNickName); //현재 접속한 아이디 
		
			
			$.each(data.list, function(index, items) {
				if(data.memNickName != $('.'+items.re_writer).attr('class')){
					$('.'+items.re_writer).hide();
				}
						
				
			});
			//글 수정 삭제 보여주기
			if ((data.memEmail == data.boardDTO.brd_email) || (data.role=='admin')){
				$('#board_member_addBtn').show();}
				else{
				$('#board_member_addBtn').hide();
				}
		}
	});
});


// 글쓰기 버튼
$('#writeBtn').click(function() {
	location.href = 'http://localhost:8080/dogiver/board/boardWriteForm';
});

// 이전 버튼
$('#beforeBtn').click(function() {
		$('#re_content').val('');
		$('.comment').remove();
		$.ajax({
			type : 'post',
			url : '/dogiver/board/getBoardView_before',
			data : 'brd_seq=' + $('#brd_seq').val(),
			dataType : 'json',
			success : function(data) {
				$('#seqSpan').text(data.boardDTO.brd_seq);
				$('#categorySpan').text(
						data.boardDTO.brd_category);
				$('#titleSpan').text(
						data.boardDTO.brd_title);
				$('#idSpan').text(
						data.boardDTO.brd_nickname);
				$('#dateSpan').text(
						data.boardDTO.brd_logtime);
				7
				$('#contentSpan').html(
						data.boardDTO.brd_content);
				$('#brd_seq').val(data.boardDTO.brd_seq);
				$('#re_seq').val(data.boardDTO.re_seq);

				let tag = '';
							
				$.each(data.list,function(index, items) {
					tag += '<div class="comment">'
						+ '<div id="comment-writer">'
						+ items.re_writer + '</div>'
						+ '<div id="comment-logtime">'
						+ items.re_logtime + '</div>'
						+ '<a href="#" id='+items.re_seq+' class="delete_btn">삭제</a>'
						+ '<div id="comment-content">'
						+ items.re_content + '</div>'
						+ '</div>'
						});
						$('#contentDiv').append(tag);

					$.each(data.list, function(index, items) {
						if (data.memNickName != $(
								'.' + items.re_writer).attr(
								'class')) {
							$('.' + items.re_writer).hide();
						}

					});

					if ((data.memEmail == data.boardDTO.brd_email)
							|| (data.role == 'admin')) {
						$('#board_member_addBtn').show();
					} else {
						$('#board_member_addBtn').hide();
					}

				}
			});
});
// 다음 버튼 버튼
$('#afterBtn').click(function() {
		$('#re_content').val('');
		$('.comment').remove();
		$.ajax({
			type : 'post',
			url : '/dogiver/board/getBoardView_after',
			data : 'brd_seq=' + $('#brd_seq').val(),
			dataType : 'json',
			success : function(data) {
				$('#seqSpan').text(data.boardDTO.brd_seq);
				$('#categorySpan').text(
						data.boardDTO.brd_category);
				$('#titleSpan').text(
						data.boardDTO.brd_title);
				$('#idSpan').text(
						data.boardDTO.brd_nickname);
				$('#dateSpan').text(
						data.boardDTO.brd_logtime);
				$('#contentSpan').html(
						data.boardDTO.brd_content);
				$('#brd_seq').val(data.boardDTO.brd_seq);
				$('#re_seq').val(data.boardDTO.re_seq);

				let tag = '';
				$.each(data.list,function(index, items) {
				
					tag += '<div class="comment">'
						+ '<div id="comment-writer">'
						+ items.re_writer + '</div>'
						+ '<div id="comment-logtime">'
						+ items.re_logtime + '</div>'
						+ '<a href="#" id='+items.re_seq+' class="delete_btn">삭제</a>'
						+ '<div id="comment-content">'
						+ items.re_content + '</div>'
						+ '</div>'
					});
					$('#contentDiv').append(tag);

					// 삭제 기능 보이고 안보이게
					$.each(data.list, function(index, items) {
						if ((data.memNickName != $('.' + items.re_writer).attr(
								'class'))
								&& data.role != 'admin') {
							$('.' + items.re_writer).hide();
						}

					});

					if ((data.memEmail == data.boardDTO.brd_email)
							|| (data.role == 'admin')) {
						$('#board_member_addBtn').show();
					} else {
						$('#board_member_addBtn').hide();
					}

				}
			});
});
// 글쓰기 버튼 삭제 버튼
$('#deletBtn').click(function() {
	if(confirm("정말 삭제하시겠습니까?")){
	document.boardViewForm.method = 'POST';
	document.boardViewForm.action = 'boardDelete';
	document.boardViewForm.submit();
	alert("글이 삭제되었습니다.")
	location.href = 'boardList';
	}
});

$('#listBtn').click(function() {
	location.href = 'boardList?pg=' + $('#pg').val();
});

// 목록 버튼
$('#listBtn').click(function() {
	location.href = 'boardList?pg=' + $('#pg').val();
});

$('#modifyBtn').click(function() {
	location.href = 'boardModifyForm?brd_seq=' + $('#brd_seq').val();
});
