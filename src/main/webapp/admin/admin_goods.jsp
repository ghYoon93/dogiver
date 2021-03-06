<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-3.4.1.min.js"
    ></script>
    <script
      type="text/javascript"
      src="/data/201101/IJ12941530138912/jquery-contained-sticky-scroll.js"
    ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin_goods.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  </head>
  <body>
    <div id="headerDiv"></div>
    <div class="page-title">
      <h2>admin</h2>
      <p>관리자 페이지 입니다.</p>
    </div>
    <div id="wrap">
      <div class="admin-page">
        <div class="admin-nav">
          <ol>
            <li><a href="../admin/admin">회원관리</a></li>
            <li><a href="../admin/admin_blood">헌혈견 관리</a></li>
            <li class="on"><a href="../admin/admin_goods">상품 관리</a></li>
            <li><a href="../admin/admin_board">게시글 관리</a></li>
            <li><a href="../admin/admin_contact">문의 관리</a></li>
          </ol>
        </div>
        <div class="article">
        	<div id="adminGoodsDiv">
        		<div id="adminGoodsList">
        			<table id="adminGoodsListTable" border="1px solid" cellspacing="0">
        				<tr>
        					<th width="75">카테고리</th>
        					<th width="100">상품번호</th>
        					<th width="300">상품명</th>
        					<th width="110">가격</th>
        					<th width="80">수량</th>
        					<th width="80">누적판매량</th>
        					<th width="150">날짜</th>
        					<th width="60">판매여부</th>
        				</tr>
        			</table>
        		</div>
        		<div id="adminGoodsView">
	        		<form name="goodsForm" id="goodsForm">
	        			<!-- <input type="hidden" name="goods_id" id="goods_id"> -->
	        			<div class="adminGoodsViewDiv">
	        				<p>카테고리</p>
							<select id="category_code" name="category_code">
								<option value="101">장난감</option>
								<option value="201">목줄/하네스</option>
								<option value="301">패션/의류</option>
							</select>
	        			</div>
	        			<div class="adminGoodsViewDiv">
	        				<p>상품번호</p><input type="text" name="goods_id" id="goods_id" value="1" readonly>
	        			</div>
	        			<div class="adminGoodsViewDiv">
	        				<p>상품명</p><input type="text" id="goods_name" name="goods_name">
	        			</div>
	        			<div class="adminGoodsViewDiv">
	        				<p>가격(원)</p><input type="text" id="goods_price" name="goods_price">
	        			</div>
	        			<div class="adminGoodsViewDiv">
	        				<p>수량</p><input type="text" id="goods_amt" name="goods_amt">
	        			</div>
	        			<!-- <div class="adminGoodsViewDiv">
	        				<p>판매여부</p>
	        				<input type="checkbox" id="sales_yn" name="sales_yn" value="Y">
	        				<label for="YN">판매여부</label>
	        			</div> -->
	        			<div class="adminGoodsViewDiv">
							<p><label for="sales_yn">판매여부</label></p>
							<div class="form-sort" style="width:250px; line-height: 50px;"> 
								<input type="checkbox" name="sales_yn" id="sales_y" value="Y" onclick="oneCheckBox(this)"/> <label for="sales_y" style="padding: 0 50px;">Y</label>
								<input type="checkbox" name="sales_yn" id="sales_n" value="N" onclick="oneCheckBox(this)" checked="checked"/> <label for="sales_n">N</label>
							</div>
						</div>
	        			<div class="adminGoodsViewimg">
	        				<p>썸네일</p>
	        				<input type="file" id="goods_thumbnail" name="goods_img">
	        			</div>
	        			<div class="adminGoodsViewimg">
	        				<p>상세정보 이미지</p>
	        				<input type="file" id="goods_detail" name="goods_img2">
	        			</div>
	        		</form>
        		</div>
        			<div id="adminGoodsBtn">
        			<input type="button" value="수정하기" id="goodsModify">
        			<input type="button" value="비우기" id="re">
        			<input type="button" value="등록하기" id="goodsInsert">
        			</div>
        	</div>
        </div>
      </div>
    </div>
    <div id="footerDiv"></div>
  </body>
</html>
