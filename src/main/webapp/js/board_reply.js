// 댓글 작성
$('#boardFormBtn').click(function() {
	//유효성 검사.
	$('#confirmDiv').empty();
	if ($('#re_content').val() == '') {
		$('#confirmDiv').text('내용을 입력하세요');
		$('#confirmDiv').css('color', 'red');
		$('#confirmDiv').css('font-size', '8pt');
		$('#confirmDiv').css('font-weight', 'bold');
	} else{
		//검사 끝나면 실행
		$.ajax({
			type : 'post',
			url : '/dogiver/board/re_write',
			data : {'brd_seq' : $('#brd_seq').val(),'re_content' : $('#re_content').val()},
			success : function(data) {
				alert('등록되었습니다.');
				$('#re_content').val('');
				$('.replyContent').remove();
				
				$.ajax({
					type : 'post',
					url : '/dogiver/board/getBoardView',
					data : 'brd_seq=' + $('#brd_seq').val(),
					dataType : 'json',
					success : function(data) {
						$('#seqSpan').text(data.boardDTO.brd_seq);
						$('#categorySpan').text(data.boardDTO.brd_category);
						$('#titleSpan').text(data.boardDTO.brd_title);
						$('#idSpan').text(data.boardDTO.brd_nickname);
						$('#dateSpan').text(data.boardDTO.brd_logtime);
						$('#contentSpan').html(data.boardDTO.brd_content);
						$('#brd_seq').val(data.boardDTO.brd_seq);
						
						let tag='';
						$.each(data.list,function(index, items) {
							tag += '<table class="replyContent" border="1" style="width: 1080px;">'
								+ '<tr><td height= "45" width="75" align="center">작성자</td>'
								+ '<td width="70" align="center"><span id="writerSapn">'
								+ items.re_writer
								+ '</span></td>'
								+ '<td width="70" align="center">작성일</td>'
								+ '<td width="100" align="center"><span id="timeSapn">'
								+ items.re_logtime
								+ '</span></td>'
								+ '<td width="480" align="right" style="padding-right: 20px;"><a href="#" class='+items.re_writer+'>삭제</a></td>'
								+ '</tr><tr><td colspan="6" height="65" style="padding: 10px;"><span id="timeSapn">'
								+ items.re_content
								+ '</span></td></tr>'
								+ '</table>';
						});
						$('#contentDiv').append(tag);
						
						$.each(data.list, function(index, items) {
							if(data.memNickName != $('.'+items.re_writer).attr('class')){
								$('.'+items.re_writer).hide();
							}
									
							
						});
						if ((data.memEmail == data.boardDTO.brd_email) || (data.role=='admin')){
							$('#board_member_addBtn').show();}
							else{
							$('#board_member_addBtn').hide();
							}
						
					}
				});
				
			}
		});
	}
});
//댓글 삭제
$(document).on('click', 'a', function(){
	let re_seq=$(this).attr('id');
	$.ajax({
		type : 'post',
		url : '/dogiver/board/reply_delete',
		data : {'re_seq':re_seq},
		success : function(data) {
			alert('삭제되었습니다.');
			$('.replyContent').remove();
			$('#re_content').val('');
			$.ajax({
				type : 'post',
				url : '/dogiver/board/getBoardView',
				data : 'brd_seq=' + $('#brd_seq').val(),
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
					
					let tag='';
					$.each(data.list,function(index, items) {
						tag += '<table class="replyContent" border="1" style="width: 1080px;">'
							+ '<tr><td height= "45" width="75" align="center">작성자</td>'
							+ '<td width="70" align="center"><span id="writerSapn">'
							+ items.re_writer
							+ '</span></td>'
							+ '<td width="70" align="center">작성일</td>'
							+ '<td width="100" align="center"><span id="timeSapn">'
							+ items.re_logtime
							+ '</span></td>'
							+ '<td width="480" align="right" style="padding-right: 20px;"><a href="#" class='+items.re_writer+'>삭제</a></td>'
							+ '</tr><tr><td colspan="6" height="65" style="padding: 10px;"><span id="timeSapn">'
							+ items.re_content
							+ '</span></td></tr>'
							+ '</table>';
					});
					$('#contentDiv').append(tag);
					
					
					$.each(data.list, function(index, items) {
						if(data.memNickName != $('.'+items.re_writer).attr('class')){
							$('.'+items.re_writer).hide();
						}
								
						
					});
					
					
					if ((data.memEmail == data.boardDTO.brd_email) || (data.role=='admin')){
						$('#board_member_addBtn').show();}
						else{
						$('#board_member_addBtn').hide();
						}
				}
			});
			
			
		}
	});
});	