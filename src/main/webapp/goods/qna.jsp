<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/goodsDetail.css" />
<link rel="stylesheet" href="../css/reset.css" />
</head>
<body>
<h3 style="text-align: left;">상품 문의</h3><br>

<form id="qnaWrite" method="post" action="qnaWrite">
	<input type="hidden" name="goods_id" id="goods_id" value="${goods_id }">
	
	<p class="qnaWriteDiv"></p>
	<div style="display: flex;">
		<textarea name="text_content" id="text_content" rows="3" cols="110" ></textarea>
		<button type="button" id="qnaWrite_btn">상품문의 작성</button><br><br>
	</div>
</form>


<table cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
    <tr>
        <th width="65%">문의 내용</th>
        <th width="10%" style="text-align:center;">닉네임</th>
        <th width="25%" style="text-align:center;">날짜</th>
    </tr>
</table>
<table class="qnaList" cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
</table>

</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods_qna.js"></script>
</html>