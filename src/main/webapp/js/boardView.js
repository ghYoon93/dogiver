let link = document.location.href; 

//데이터 뿌려주기 
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


$('#writeBtn').click(function(){

			if (data.memEmail == data.boardDTO.brd_email)
				$('#board_member_addBtn').show();
			else
				$('#board_member_addBtn').hide();
	location.href ='boardWriteForm';
		}
	});
});
//글쓰기 버튼 
$('#writeBtn').click(function(){
		location.href='http://localhost:8080/dogiver/board/boardWriteForm';
	
});

//이전 버튼
$('#beforeBtn').click(function() {
    $.ajax({
        type : 'post',
        url : '/dogiver/board/getBoardView_before',
        data : 'brd_seq=' + $('#brd_seq').val(),
        dataType : 'json',
        success : function(data) {
            alert("aa");
            $('#seqSpan').text(data.boardDTO.brd_seq);
            $('#categorySpan').text(data.boardDTO.brd_category);
            $('#titleSpan').text(data.boardDTO.brd_title);
            $('#idSpan').text(data.boardDTO.brd_nickname);
            $('#dateSpan').text(data.boardDTO.brd_logtime);
            $('#hitSpan').text(data.boardDTO.brd_hit);
            $('#contentSpan').html(data.boardDTO.brd_content);
            $('#brd_seq').val(data.boardDTO.brd_seq);

            if (data.memEmail == data.boardDTO.brd_email)
                $('#board_member_addBtn').show();
            else
                $('#board_member_addBtn').hide();
        }
    });

});
//다음 버튼 버튼
$('#afterBtn').click(function() {
    $.ajax({
        type : 'post',
        url : '/dogiver/board/getBoardView_after',
        data : 'brd_seq=' + $('#brd_seq').val(),
        dataType : 'json',
        success : function(data) {
            alert("aa");
            $('#seqSpan').text(data.boardDTO.brd_seq);
            $('#categorySpan').text(data.boardDTO.brd_category);
            $('#titleSpan').text(data.boardDTO.brd_title);
            $('#idSpan').text(data.boardDTO.brd_nickname);
            $('#dateSpan').text(data.boardDTO.brd_logtime);
            $('#hitSpan').text(data.boardDTO.brd_hit);
            $('#contentSpan').html(data.boardDTO.brd_content);
            $('#brd_seq').val(data.boardDTO.brd_seq);
	}
      });
	
});


//글쓰기 버튼 삭제 버튼 
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

//목록 버튼 
$('#listBtn').click(function(){
	location.href ='boardList?pg='+$('#pg').val();
	
});
