$('#boardFormBtn').click(function() {
	$('#contentDiv').empty();
	if ($('#content').val() == '') {
		$('#contentDiv').text('내용을 입력하세요');
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').css('font-weight', 'bold')
	} else
		$.ajax({
			type : 'post',
			url : '/dogiver/board/reply_write',
			data : 'brd_seq=' + $('#brd_seq').val(),
			dataType : 'json',
			success : function(data) {
				alert(JSON.stringify(data));
			}
		});
		
	});