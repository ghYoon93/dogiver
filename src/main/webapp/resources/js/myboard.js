$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/board/getMyboard',
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
				}).append($('<a/>', {
					href: '#myboardView',
					id: items.brd_seq+"",
					text: items.brd_title
				}))).append($('<td/>',{
					align: 'center',
					text: items.brd_logtime
				})).appendTo('#myboardTable')
			});//each
		}
	});//글 ajax
	
	$.ajax({
		type: 'post',
		url: '/board/getMyreply',
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					text: items.re_content
				})).append($('<td/>',{
					text: items.re_logtime
				})).appendTo('#myreplyTable')	
			});//each
		}
	});//댓글 ajax
	
	$(document).on('click', 'a', function() {
		let brd_seq = $(this).attr('id');
		$.ajax({
			type: 'post',
			url: '/board/getMyboardView',
			data: {'brd_seq': brd_seq},
			dataType: 'json',
			success: function(data){
				$('#brd_seq').text(data.boardDTO.brd_seq);
				$('#brd_category').text(data.boardDTO.brd_category);
				$('#brd_title').text(data.boardDTO.brd_title);
				$('#brd_logtime').text(data.boardDTO.brd_logtime);
				$('#brd_content').html(data.boardDTO.brd_content);
			}
		});
	});
});