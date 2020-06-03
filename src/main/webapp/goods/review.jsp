<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 후기</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />

</head>
<body>
<h3 style="text-align: left;">상품후기</h3>

<input type="hidden" name="goods_id" id="goods_id" value="${goods_id }">

<c:if test="${memEmail != null }">
<button id="review_btn" style="text-align:right; float:right; margin:30px 100px;" onclick="reviewWriteWin('${goods_id }')">상품후기 작성</button><br>
</c:if>
<table class="reviewList" id="reviewList" cellpadding="5" frame="hsides" rules="rows" valign="top" margin="0">
    <tr>
        <th width="65%">리뷰 제목</th>
        <th width="10%" style="text-align:center;">닉네임</th>
        <th width="25%" style="text-align:center;">날짜</th>
    </tr>
        <tbody>
        
        </tbody>
</table>

</body>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/goods_review.js"></script>
</html>