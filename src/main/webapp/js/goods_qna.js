 //상품QNA 리스트 
$(document).ready(function(){

	var tag="";
	$.ajax({
		type:'post',
		url: '/dogiver/goods/getGoodsQnaList',
		data: 'goods_id='+$('input[name=goods_id]').val(),
		dataType: 'json',
		success: function(data){
			
			$.each(data.list, function(index, items){
				tag += '<tr>'
					+ '<input type="hidden" id="bo_seq" value="'+ items.bo_seq +'">'
					+ '<td class="qna_content" width="65%" style="cursor: pointer;">'+ items.text_content +'</td>'
					+ '<td width="10%" style="text-align:center;">'+items.nickname+'</td>'
					+ '<td width="25%" style="text-align:center;">'+ items.board_date +'</td>'
					+ '</tr>'
					+ '<tr class="replyText">'
					+ '<td colspan="3"><textarea class="text_content" rows="3" cols="110"></textarea>'
					+ '<button type="button" class="replyBtn">댓글 작성</button></td>'
					+ '</tr>';
				
			});//each
			
			$('.qnaList tbody').append(tag);
			
			$('.replyText').hide();
		}
	
	});
});

//상품QNA 작성
$('#qnaWrite').on('click', '#qnaWrite_btn', function(){
	$('.qnaWriteDiv').empty();
	
	if($('.text_content').val()==''){ 
		$('.qnaWriteDiv').text('내용을 입력하세요')
						.css('color', 'red')
						.css('font-size', '10pt')
						.css('font-weight', 'bold')
						.css('text-align', 'left');
	}else {
		document.forms[0].submit();
	}
});

$('.qnaList').on('click', '.qna_content', function(){
	$(this).parent().next().slideToggle();
});

$('.qnaList').on('click', '.replyBtn', function(){

	//alert($(this).parent().parent().prev().find('#bo_seq').val());
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/writeReply',
		contentType: 'application/json;charset=UTF-8',
		data: JSON.stringify({'goods_id': $('#goods_id').val(),
								'bo_seq': $(this).parent().parent().prev().find('#bo_seq').val(),	 
								'reply': $('.replyText .text_content').val()}),
		success: function(){
			alert('댓글 작성 완료하였습니다.');
			//location.reload();
			
			var tag="";
			$.ajax({
				type: 'post',
				url: '/dogiver/goods/replyList',
				data: 'bo_seq='+$('#bo_seq').val(),
				dataType: 'json',
				success: function(data){
					alert(JSON.stringify(data));
					$.each(data.list, function(index, items){
						tag += '<tr class="replyTr">'
							+ '<td class="replyTd" style="padding-left: 50px;">'+ items.reply +'</td>'
							+ '<td width="10%" style="text-align:center;">'+items.nickname+'</td>'
							+ '</tr>';
					});//each
					
					//$('.replyList').prependTo(tag);
					$('.replyText').before(tag);
					
					$('.replyTr').not($(this).parent().parent().prev().find('.reply')).hide();
					$('.replyText').hide();
				}
			});
		}
	});
});
