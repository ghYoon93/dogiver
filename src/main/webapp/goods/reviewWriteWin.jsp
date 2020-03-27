<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<strong>리뷰 작성</strong>
<span class="writeArea">0/500</span><br>

<form id="reviewWriteForm" name="reviewWriteForm" enctype="multipart/form-data" method="post" action="reviewWrite">
	<textarea class="reviewText" name="reviewText" rows="10" cols="90" maxlength="500" placeholder="상품과 무관하거나 스팸, 불법적인 내용의 리뷰는 통보없이 비노출 처리되며, 적립금은 회수될 수 있습니다."></textarea>
	<br><div class="reviewTextDiv"></div><br>
	<input type="file" name="img[]" id="image3" size="50" multiple>
</form>
	<button class="cancle" onclick="window.close();">취소</button>
	<button class="insertBtn">등록</button>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$('textarea').keydown(function(){
	var length = $(this).val().length;
	
	$('.writeArea').html(length+'/500'); //선택한 요소 안의 내용을 가져오거나 다른 내용으로 바꿈
	if(length>500)
		$('.writeArea').css('color', 'red');
	else
		$('.writeArea').css('color', 'blue');
});

$('.insertBtn').click(function(){
	$('.reviewTextDiv').empty();
	
	if($('.reviewText').val()==''){
		$('.reviewTextDiv').text('상품코드를 입력하세요').css('color', 'red').css('font-size', '10pt').css('font-weight', 'bold');
	}else{
		document.forms[0].submit();
		
		var formData = new FormData($('#reviewWriteForm')[0]);
		
		$.ajax({
			type: 'post',
			url: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/dogiver/goods/insertReview',
			data: formData,
			success: function(){
				alert('리뷰 등록 완료!');
				window.close();
			}
			
		});
		
	}
	
});
</script>
