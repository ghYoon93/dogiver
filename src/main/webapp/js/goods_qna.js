//상품QNA 작성
$(document).on('click', '#qnaWrite_btn', function(){
	$('.qnaWriteDiv').empty();
	
	if($('#text_content').val()==''){ 
		$('.qnaWriteDiv').text('내용을 입력하세요')
						.css('color', 'red')
						.css('font-size', '10pt')
						.css('font-weight', 'bold')
						.css('text-align', 'left');
	}else {
		document.forms[0].submit();
	}
});

 //상품QNA 리스트 
//$(document).ready(function(){
$(document).on('click', 'nav ul li', function(){
	if($(this).index()=='1'){
		var tag="";
		$.ajax({
			type:'post',
			url: '/dogiver/goods/getGoodsQnaList',
			data: 'goods_id='+$('#goods_id').val(),
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				
				$.each(data.list, function(index, items){
					tag += '<tr>'
						+ '<input type="hidden" id="bo_seq" value="'+ items.bo_seq +'">'
						+ '<td class="qna_content" width="65%" style="cursor: pointer;">'+ items.text_content +'</td>'
						+ '<td width="10%" style="text-align:center;">'+items.nickname+'</td>'
						+ '<td width="25%" style="text-align:center;">'+ items.board_date +'</td>'
						+ '</tr>'
						+ '<tr class="tr">'
						+ '<td class="replyList" colspan="2" width="65%" style="cursor: pointer;"></td>'
						+ '</tr>'
						+ '<tr>'
						+ '<td class="reply" colspan="2"><textarea id="text_content" rows="3" cols="110"></textarea>'
						+ '<button type="button" class="replyBtn">댓글 작성</button></td>'
						+ '</tr>';
					
				});//each
				
				$('.qnaList').append(tag);
				
				$('.reply, .replyList').hide();
			}
		
		});
	}
});

$(document).on('click', '.qna_content', function(){
	$(this).parent().next().find('.replyList').slideToggle();
	$(this).parent().next().next().find('.reply').slideToggle();
});

$(document).on('click', '.replyBtn', function(){
	//alert($('#bo_seq').val());
	alert($(this).parent().parent().prev().prev().find('#bo_seq').val());
	alert($('.reply #text_content').val());
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/writeReply',
		contentType: 'application/json;charset=UTF-8',
		//data: $('#qnaWrite').serialize(),
		//data: 'goods_id='+goods_id+'&reply='+reply+'&bo_seq'+bo_seq, 
		data: JSON.stringify({'goods_id': $('#goods_id').val(),
								'bo_seq': $(this).parent().parent().prev().prev().find('#bo_seq').val(),	 
								'reply': $('.reply #text_content').val()}),
		success: function(){
			alert('댓글 작성 완료하였습니다.');
			//location.reload();
			//$('#qnaList').load(window.location +'#qnaList');
			
			var tag="";
			$.ajax({
				type: 'post',
				url: '/dogiver/goods/replyList',
				data: 'bo_seq='+$('#bo_seq').val(),
				dataType: 'json',
				success: function(data){
					
					alert(JSON.stringify(data));
					$.each(data.list, function(index, items){
						tag += '<td colspan="2">'+ items.reply +'</td>';
					});//each
					
					$('.replyList').append(tag);
					
					$('.reply').hide();
				}
			});
		}
	});
});
