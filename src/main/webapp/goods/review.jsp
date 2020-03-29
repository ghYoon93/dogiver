<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css" />
</head>
<body>
<h3 style="text-align: left;">상품후기</h3>

<button id="review_btn" style="text-align:right; float:right; margin:30px 100px;" onclick="reviewWriteWin('${goods_id }')">상품후기 작성</button><br>

<input type="hidden" name="goods_id" id="goods_id" value="${goods_id }">


<table cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
    <tr>
        <th width="65%">리뷰 제목</th>
        <th width="10%" style="text-align:center;">아이디</th>
        <th width="25%" style="text-align:center;">날짜</th>
    </tr>
</table>
<table class="reviewList" cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">

</table>
</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goodsDetail.js"></script>
<script src="../js/goods_review.js"></script>
</html>