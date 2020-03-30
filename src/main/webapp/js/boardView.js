$(document).ready(function() {
	$.ajax({
		type : 'post',
		url : '/dogiver/board/getBoardView',
		data : 'brd_seq=' + $('#brd_seq').val(),
		dataType : 'json',
		success : function(data) {
			alert(JSON.stringify(data));

			$('#seqSpan').text(data.boardDTO.brd_seq);
			$('#categorySpan').text(data.boardDTO.brd_category);
			$('#titleSpan').text(data.boardDTO.brd_title);
			$('#idSpan').text(data.boardDTO.brd_id);
			$('#dateSpan').text(data.boardDTO.brd_logtime);
			$('#hitSpan').text(data.boardDTO.brd_hit);
			$('#contentSpan').html(data.boardDTO.brd_content);

			if (data.memId == data.boardDTO.brd_id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();
		}
	});
});

$('#beforeBtn').click(function(){
	location.href ='boardView?brd_seq='+($('#brd_seq').val()-1);
});

$('#writeBtn').click(function(){
	location.href ='boardWriteForm';
});



$('#afterBtn').click(function(){
	var num= $('#brd_seq').val();
	num++;
	location.href ='boardView?brd_seq='+num;
});

$('#deletBtn').click(function(){
	document.boardViewForm.method = 'POST';
	document.boardViewForm.action = 'boardDelete';
	document.boardViewForm.submit();
	alert("글이 삭제되었습니다.")
	location.href = 'boardList';
	
});

$('#listBtn').click(function(){
	location.href ='boardList?pg='+$('#pg').val();
	
});


