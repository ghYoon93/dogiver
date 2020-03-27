//상품QNA 작성
$('.qnaWrite_btn').click(function(){
	$('.qnaWriteDiv').empty();
	
	if($('textarea').val()==''){ 
		$('.qnaWriteDiv').text('내용을 입력하세요')
						.css('color', 'red')
						.css('font-size', '8pt')
						.css('font-weight', 'bold');
	}else{
		document.forms[0].submit();
	}
});

 