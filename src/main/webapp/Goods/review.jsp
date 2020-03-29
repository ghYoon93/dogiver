<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/goodsDetail.css" />
</head>
<body>
<h3 style="text-align: left;">상품후기</h3>
<button id="review_btn" style="text-align:right; float:right; margin:0 100px;" onclick="reviewWrite()">상품후기 작성</button><br>

<table cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
    <tr>
        <th width="65%">리뷰 제목</th>
        <th width="10%" style="text-align:center;">아이디</th>
        <th width="25%" style="text-align:center;">날짜</th>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>

</table>
</body>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/goods.js"></script>
</html>