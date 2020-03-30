let link = document.location.href; 

//데이터 뿌려주기 
$(document).ready(function() {
	
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
			$('#hitSpan').text(data.boardDTO.brd_hit);
			$('#contentSpan').html(data.boardDTO.brd_content);

			if (data.memEmail == data.boardDTO.brd_email)
				$('#board_member_addBtn').show();
			else
				$('#board_member_addBtn').hide();
		}
	});
});
//글쓰기 버튼 
$('#writeBtn').click(function(){
		location.href='http://localhost:8080/dogiver/board/boardWriteForm';
	
});

//이전 버튼
$('#beforeBtn').click(function(){
	location.href ='boardView?brd_seq='+($('#brd_seq').val()-1);
	
	if(link=='http://localhost:8080/dogiver/board/boardView?brd_seq=0')
		alert('현제 페이지가 첫번째 페이지 입니다.');
	else
		location.href='http://localhost:8080/dogiver/board/boardView?brd_seq=1';
});

//다음 버튼 버튼
$('#afterBtn').click(function(){
	var num= $('#brd_seq').val();
	num++;
	location.href ='boardView?brd_seq='+num;
	
});


//글쓰기 버튼 삭제 버튼 
$('#deletBtn').click(function(){
	document.boardViewForm.method = 'POST';
	document.boardViewForm.action = 'boardDelete';
	document.boardViewForm.submit();
	alert("글이 삭제되었습니다.")
	location.href = 'boardList';
	
});


//목록 버튼 
$('#listBtn').click(function(){
	location.href ='boardList?pg='+$('#pg').val();
	
});

