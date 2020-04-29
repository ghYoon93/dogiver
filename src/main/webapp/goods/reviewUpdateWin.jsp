<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="favicon" href="../image/favicon.ico" />
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
</head>
<strong>리뷰 수정</strong>
<span class="writeArea">0/500</span><br>
<form id="reviewWriteForm" name="" enctype="multipart/form-data" method="post" >

	<textarea class="text_content" name="text_content"  rows="10" cols="90" maxlength="500" placeholder="상품과 무관하거나 스팸, 불법적인 내용의 리뷰는 통보없이 비노출 처리될 수 있습니다.">
	</textarea>
	<br><div class="reviewTextDiv"></div><br>
	<input type="file" name="img[]" id="imageList" size="50" multiple>
	<input type="hidden" name="bo_seq" id="bo_seq" value="${bo_seq }">

	<button class="cancle" onclick="window.close();">취소</button>
	<button type="button" id="reviewUpdateBtn">수정</button>

</form>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){

	$.ajax({
		type: 'post',
		url: '/dogiver/goods/reviewView',
		data: 'bo_seq=${bo_seq }',
		dataType: 'json',
		success: function(data){
			/* alert(JSON.stringify(data)); */
			$('.text_content').val(data.qnaDTO.text_content);

		}
	});	
});

$('#reviewUpdateBtn').click(function(){
	/* alert("qbtn"); */
	$('.reviewTextDiv').empty();
	
	if($('.text_content').val()==''){
		$('.reviewTextDiv').text('리뷰를 작성해 주세요').css('color', 'red').css('font-size', '10pt').css('font-weight', 'bold');
	}else{

		var formData = new FormData($('#reviewWriteForm')[0]);
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/dogiver/goods/reviewUpdate',
			data: formData,
			success: function(){
				alert('리뷰 수정 완료!');
				window.close();
			}
		});
	}
});

</script>
