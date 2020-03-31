<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<strong>리뷰 작성</strong>
<span class="writeArea">0/500</span><br>

<form id="reviewWriteForm" name="" enctype="multipart/form-data" method="post" >
	<textarea class="text_content" name="text_content"  rows="10" cols="90" maxlength="500" placeholder="상품과 무관하거나 스팸, 불법적인 내용의 리뷰는 통보없이 비노출 처리될 수 있습니다."></textarea>
	<br><div class="reviewTextDiv"></div><br>
	<input type="file" name="img[]" id="imageList" size="50" multiple>
	<input type="hidden" name="goods_id" id="goods_id" value="${goods_id }">
	<input type="hidden" name="memEmail" id="memEmail" value="${memEmail }">
	

	<button class="cancle" onclick="window.close();">취소</button>
	<button type="button" id="reviewWriteBtn">등록</button>
</form>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/goods_review.js"></script>
