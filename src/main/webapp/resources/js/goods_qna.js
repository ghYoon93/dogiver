 //상품QNA 리스트 
var check="";
$(document).ready(function(){

	var tag="";
	$.ajax({
		type:'post',
		url: '/dogiver/goods/getGoodsQnaList',
		data: 'goods_id='+$('input[name=goods_id]').val(),
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
					+ '<tr class="replyText">'
					+ '<td colspan="3"><textarea class="reply_content" rows="3" cols="110" ></textarea>'
					+ '<button type="button" class="replyBtn" style="">댓글 작성</button></td>'
					+ '</tr>';
				
				check = items.role;
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
	if(check != 'admin' || $('#memEmail').val() == ''){
		$('.replyBtn, .reply_content').remove();
	}else{
		$(this).parent().next().slideToggle();
	}
});

$('.qnaList').on('click', '.replyBtn', function(){
	var bo_tr = $(this).parent().parent().prev().find('#bo_seq');
	var bo_seq =bo_tr.val();
//	var bo_seq =$(this).parent().parent().prev().find('#bo_seq').val();
	console.log($(this).prev().val());
//	alert(bo_seq); //
	//alert($(this).parent().parent().prev().find('#bo_seq').val());
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/writeReply',
		contentType: 'application/json;charset=UTF-8',
		data: JSON.stringify({'goods_id': $('#goods_id').val(),
								'bo_seq': $(this).parent().parent().prev().find('#bo_seq').val(),	 
//								'reply': $('.replyText .reply_content').val()}),
								'reply': $(this).prev().val()}),
		success: function(){
			alert(	'댓글 작성 완료하였습니다.');
			//location.reload();
			
			
			var tag="";
			$.ajax({
				type: 'post',
				url: '/dogiver/goods/replyList',
				//data: 'bo_seq='+$('#bo_seq').val(),
				data: 'goods_id='+$('#goods_id').val(),
				dataType: 'json',
				success: function(data){
					//alert(JSON.stringify(data));
					$.each(data.list, function(index, items){
//						alert(items.bo_seq);//283
						//if(items.bo_seq == ){
						if(items.bo_seq == bo_seq){
						
							tag += '<tr class="replyTr">'
								+ '<td class="replyTd" style="padding-left: 50px;">'+ items.reply +'</td>'
								+ '<td class="replyTd2" width="10%" style="text-align:center;">'+items.nickname+'</td>'
								+ '</tr>';
						}
						//}
					});//each
					bo_tr.parent().after(tag);
//					$('.replyText').before(tag);
					$('.reply_content').val('');
					
					//$('.qnaList .qna_content').trigger('click');
//					$('.replyTr').not($(this).parent().parent().prev().find('.replyTd, .replyTd2')).hide();
					/*$('.replyTr').show($(this).parent().parent().prev().find('.replyTd, .replyTd2')).hide();*/
					//$('.replyText').hide();
				}
			});
		}
	});
});
