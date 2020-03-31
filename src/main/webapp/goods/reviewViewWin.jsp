<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<strong>리뷰 </strong>

<form id="reviewViewForm" name="" enctype="multipart/form-data" method="post" >
	<input type="hidden" name="bo_seq" id="bo_seq" value="${bo_seq }">
	<textarea class="text_content" name="text_content"  rows="10" cols="90" readonly></textarea>

	<div>
		<img id="image" src="" width="100" height="100">
	</div>
	
	<button class="cancle" onclick="window.close();">취소</button>
<c:if test="${memEmail != null }">
	<button type="button" id="reviewWriteBtn" onclick="location.href='reviewUpdateWin?bo_seq=${bo_seq}'">수정</button>
	<button type="button" id="reviewDeleteBtn">삭제</button>
</c:if>
	<!-- <button type="button" id="reviewWriteBtn">등록</button> -->
</form>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/dogiver/goods/reviewView',
		data : 'bo_seq=${bo_seq}',
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));

			$('#image').attr('src', '../image/goods_board/'+data.qnaDTO.image);
			$('.text_content').text(data.qnaDTO.text_content);
		}
	});
});

$('#reviewDeleteBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/reviewDelete',
		data: 'bo_seq=${bo_seq}',
		success: function(){
			alert('삭제되었습니다.');
			window.close();

		}
	});
});

</script>
