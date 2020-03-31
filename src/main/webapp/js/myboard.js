$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/board/getMyboard',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
				}).append($('<a/>', {
					href: '#',
					id: items.brd_seq+"",
					text: items.brd_title
				}))).append($('<td/>',{
					align: 'center',
					text: items.brd_logtime
				})).appendTo('#myboardTable')
			});//each
		}
	});
	
	$.ajax({
		type: 'post',
		url: '/dogiver/board/getMyreply',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					text: items.re_content
				})).append($('<td/>',{
					text: items.re_logtime
				})).appendTo('#myboardreply')
				
			});//each
		}
	});
});