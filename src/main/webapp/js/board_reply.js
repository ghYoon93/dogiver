// 댓글 작성
$('#boardFormBtn').click(function() {
	// 유효성 검사.
	$('#confirmDiv').empty();
	if ($('#re_content').val() == '') {
		$('#confirmDiv').text('내용을 입력하세요');
		$('#confirmDiv').css('color', 'red');
		$('#confirmDiv').css('font-size', '8pt');
		$('#confirmDiv').css('font-weight', 'bold');
	} else {
		// 검사 끝나면 실행
		$.ajax({
			type : 'post',
			url : '/dogiver/board/re_write',
			data : {
				'brd_seq' : $('#brd_seq').val(),
				're_content' : $('#re_content').val()
			},
			success : function(data) {
				alert('등록되었습니다.');
				$('#re_content').val('');
				$('.comment').remove();

				$.ajax({
					type : 'post',
					url : '/dogiver/board/getBoardView',
					data : 'brd_seq=' + $('#brd_seq').val(),
					dataType : 'json',
					success : function(data) {
						$('#seqSpan').text(data.boardDTO.brd_seq);
						$('#categorySpan').text(
								data.boardDTO.brd_category);
						$('#titleSpan').text(data.boardDTO.brd_title);
						$('#idSpan').text(data.boardDTO.brd_nickname);
						$('#dateSpan').text(data.boardDTO.brd_logtime);
						$('#contentSpan').html(
								data.boardDTO.brd_content);
						$('#brd_seq').val(data.boardDTO.brd_seq);

						let tag = '';
						$.each(data.list, function(index, items) {
							$('.comment').remove();
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

						$.each(data.list, function(index, items) {
							if (data.memNickName != $(
									'.' + items.re_writer)
									.attr('class')) {
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

			}
		});
	}
});
// 댓글 삭제
$(document).on('click','a',function() {
	let re_seq = $(this).attr('id');
	$.ajax({
		type : 'post',
		url : '/dogiver/board/reply_delete',
		data : {'re_seq' : re_seq},
		success : function(data) {
//			alert('삭제되었습니다.');
			if(confirm("정말 삭제하시겠습니까?")){
				$('.comment').remove();
				$('#re_content').val('');
				$.ajax({
					type : 'post',
					url : '/dogiver/board/getBoardView',
					data : 'brd_seq='
							+ $('#brd_seq').val(),
					dataType : 'json',
					success : function(data) {
						$('#seqSpan').text(data.boardDTO.brd_seq);
						$('#categorySpan').text(data.boardDTO.brd_category);
						$('#titleSpan').text(data.boardDTO.brd_title);
						$('#idSpan').text(data.boardDTO.brd_nickname);
						$('#dateSpan').text(data.boardDTO.brd_logtime);
						$('#contentSpan').html(data.boardDTO.brd_content);
						$('#brd_seq').val(data.boardDTO.brd_seq);
						$('#re_seq').val(data.boardDTO.re_seq);
		
							let tag = '';
								$.each(data.list,function(index, items) {
								$('#comment').remove();
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
		
										$.each(data.list,function(index,items) {
										if (data.memNickName != $('.'+ items.re_writer).attr('class')) {
											$('.'+ items.re_writer).hide();}
										});
		
										if ((data.memEmail == data.boardDTO.brd_email)|| (data.role == 'admin')) {
											$('#board_member_addBtn').show();
										} else {$('#board_member_addBtn').hide();
											}
										}
									});
						}
		
	
					}
				});
	});