<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="favicon" href="../image/favicon.ico" />
    <link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>my page</title>
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/mypage.css" />
    <link rel="stylesheet" href="../css/myblood.css"/>
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
    <script type="text/javascript" src="../js/myblood.js"></script>
    <script src="../js/main.js"></script>
  </head>
  <body>
    <div id="headerDiv"></div>
    <div class="page-title">
      <h2>my page</h2>
      <p>나의 정보들</p>
    </div>
    <div id="wrap">
      <div class="mypage">
        <div class="my-nav">
          <ol>
            <li><a href="../my/mypage">내 정보</a></li>
            <li class="on"><a href="../blood/myblood">헌혈견</a></li>
            <li><a href="">상품 </a></li>
            <li><a href="../board/myboard">내 게시글 </a></li>
            <li><a href="../contact/mycontact">내 문의 </a></li>
          </ol>
        </div>
        <div class="article">
        <form action="../blood/mybloodModify" name="mybloodForm" id="mybloodForm" method="post">
        <input type="hidden" id="email" name="email" value="">
        	<div id="mybloodDiv">
        		<ul>
					<li><label>반려견 이름</label> 
						<input type="text" id="dog_name" name="dog_name">
						<div id="dogNameDiv"></div>
					</li>
					<li><label>반려견 나이</label>
						<input type="text" id="dog_age" name="dog_age">
						<div id="dogAgeDiv"></div> 
					</li>
					<li><label>반려견 종</label>
						<input type="text" id="dog_breed" name="dog_breed" list="breed-list">
						<div id="dogBreedDiv"></div>
					</li>
					<li><label>반려견 몸무게(kg)</label> 
						<input type="text" id="dog_weight" name="dog_weight">
						<div id="dogWeightDiv"></div>
					</li>
					<li><label>반려견 혈액형</label><br /> 
						<input type="text" id="dog_bloodType" name="dog_bloodType">
						<div id="dogBloodTypeDiv"></div>
					</li>
					<li><label>헌혈 진행상황</label><br /> 
						<input type="text" id="apply_status" name="apply_status" readonly="readonly">
					</li>
				</ul>
				<div class="btn_center">
					<button type="button" class="dogModifyBtn">수정하기</button>
				</div>
        	</div>
        </form>
        </div>
      </div>
    </div>
    <div id="footerDiv"></div>
  </body>
</html>
