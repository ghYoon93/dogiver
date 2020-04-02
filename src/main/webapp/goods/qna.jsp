<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<h3 style="text-align: left;">상품 문의</h3><br>

<form id="qnaWrite" method="post" action="qnaWrite">
	<input type="hidden" name="goods_id" id="goods_id" value="${goods_id }">
	<input type="hidden" name="memEmail" id="memEmail" value="${memEmail }">
	
	<p class="qnaWriteDiv"></p>
	<div style="display: flex;">
		<textarea name="text_content" class="text_content" rows="3" cols="110" ></textarea>
		<button type="button" id="qnaWrite_btn">상품문의 작성</button><br><br>
	</div>
</form>


<table class="qnaList" cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
  <thead>
    <tr>
        <th width="65%">문의 내용</th>
        <th width="10%" style="text-align:center;">닉네임</th>
        <th width="25%" style="text-align:center;">날짜</th>
    </tr>
  </thead>
  <tbody>
    
  </tbody>
</table>

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods_qna.js"></script>
