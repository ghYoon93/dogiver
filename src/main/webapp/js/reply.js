$('#boardFormBtn').click(function() {
	$('#contentDiv').empty();
	if ($('#content').val() == '') {
		$('#contentDiv').text('내용을 입력하세요');
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').css('font-weight', 'bold')
	} else
		var re_content = $('#re_content').val();
	$.ajax({
		type : 'POST',
		url : '/dogiver/board/boardReply',
		data : {
			're_content' : re_content
		},
		success : function(data) {
			alert("댓글이 작성되었습니다.");
		}
	});
});