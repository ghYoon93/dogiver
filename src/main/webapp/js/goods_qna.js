//상품QNA 작성
$('#qnaWrite_btn').click(function(){
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
				alert();
				$.each(data.list, function(index, items){
					tag += '<tr>'
						+ '<td width="65%">'+ items.text_content +'</td>'
						+ '<td width="10%" style="text-align:center;">닉네임</td>'
						+ '<td width="25%" style="text-align:center;">'+ items.board_date +'</td>'
						+ '</tr>';
					
				});//each
				
				$('.qnaList').html(tag);
			}
		});
	}
});

