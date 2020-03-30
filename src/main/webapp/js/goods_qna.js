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
						+ '<tr>'
						+ '<td class="reply" colspan="2"><textarea id="text_content" rows="3" cols="110"></textarea>'
						+ '<button type="button" class="replyBtn">댓글 작성</button></td>'
						+ '</tr>';
					
				});//each
				
				$('.qnaList').append(tag);
				
				$('.reply').hide();
			}
		
		});
	}
});

$(document).on('click', '.qna_content', function(){
	$(this).parent().next().find('.reply').slideToggle();
});

$(document).on('click', '.replyBtn', function(){
//$('.replyBtn').click(function(){
	var reply = $('.reply #text_content').val();
	alert(text);
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/writeReply',
		data: $('#qnaWrite').serialize(),
		data: 'goods_id='+goods_id+'&reply='+reply+'&bo_seq'+bo_seq, 
		dataType: 'json',
		success: function(data){
			alert(data);
			
		}
	});
});
