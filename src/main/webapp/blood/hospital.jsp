<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>동물병원</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/hospital.css">
	<link
		rel="stylesheet"
		type="text/css"
		href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
	/>
	<link
		rel="stylesheet"
		href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
	/>
	<link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=clbhwdl70e"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		type="text/javascript"
		src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
	></script>
	<script type="text/javascript" src="../js/hospital.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>
</head>

<body>
	<div id="headerDiv"></div>
	<div class="page-title">
      <h2>헌혈 협력 병원</h2>
    </div>
	<div class="wrap">
	<div class="hospitalframe">
	<div class="blood-bred">협력병원</div>
	<div class="hospitalmap" id="map"></div>
		<div class="hospitallist">
			<table>
				<tr id="table-head">
					<th>병원명</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
				<tr>
					<td id="a" class="name">의정부서정동물메디컬센터</td>
					<td id="aTel">031-851-0901</td>
					<td id="aAddr">경기 의정부시 청사로48번길 7 3층 1호</td>
				</tr>
				<tr id="color-table">
					<td id="b" class="name">광주동물메디컬센터</td>
					<td id="bTel">062-523-0075</td>
					<td id="bAddr">광주 광산구 북문대로420번길 206</td>
				</tr>
				<tr>
					<td id="c" class="name">제주대학교부속동물병원</td>
					<td id="cTel">064-754-3384</td>
					<td id="cAddr">제주 제주시 제주대학로 102</td>
				</tr>
				<tr id="color-table">
					<td id="d" class="name">노원24시N동물병원</td>
					<td id="dTel">02-919-0075</td>
					<td id="dAddr">서울 노원구 노원로 456 백암빌딩</td>
				</tr>
				<tr>
					<td id="e" class="name">일산동물의료원</td>
					<td id="eTel">031-924-7582</td>
					<td id="eAddr">경기 고양시 일산서구 대화로 407</td>
				</tr>
				<tr id="color-table">
					<td id="f" class="name">충남대학교부속동물병원</td>
					<td id="fTel">042-821-6704</td>
					<td id="fAddr">대전 유성구 대학로 99</td>
				</tr>
				<tr>
					<td id="g" class="name">부산다솜동물메디컬센터</td>
					<td id="gTel">051-632-7580</td>
					<td id="gAddr">부산 남구 수영로13번길 3</td>
				</tr>
				<tr id="color-table">
					<td id="h" class="name">대구탑스동물메디컬</td>
					<td id="hTel">053-637-7501</td>
					<td id="hAddr">부산 남구 수영로13번길 3</td>
				</tr>
			</table>
		</div>
		
		
	</div>
	</div>
	<div id="footerDiv"></div>
</body>
</html>
