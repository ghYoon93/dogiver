$('textarea').keydown(function(){
	var length = $(this).val().length;
	
	$('.writeArea').html(length+'/500'); //선택한 요소 안의 내용을 가져오거나 다른 내용으로 바꿈
	if(length>500)
		$('.writeArea').css('color', 'red');
	else
		$('.writeArea').css('color', 'blue');
});

$('#reviewWriteBtn').click(function(){
	$('.reviewTextDiv').empty();
	
	if($('.text_content').val()==''){
		$('.reviewTextDiv').text('리뷰를 작성해 주세요').css('color', 'red').css('font-size', '10pt').css('font-weight', 'bold');
	}else{
		//document.forms[0].submit();

		var formData = new FormData($('#reviewWriteForm')[0]);
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/dogiver/goods/reviewWrite',
			data: formData,
			success: function(){
				alert('리뷰 등록 완료!');
				window.close();
			}
			
		});
		
	}
	
});
