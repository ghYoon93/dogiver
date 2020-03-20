<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/hospital.css">
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=clbhwdl70e"></script>
</head>

<body>
	<div class="hospitalframe">
		<div class="hospitallist">
			<table border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
				<tr>
					<th width="250">ë³ìëª</th>
					<th width="250">ì íë²í¸</th>
					<th width="500">ì£¼ì</th>
				</tr>
				<tr>
					<td id="a" class="name">ìì ë¶ìì ëë¬¼ë©ëì»¬ì¼í°</td>
					<td id="aTel">031-851-0901</td>
					<td id="aAddr">ê²½ê¸° ìì ë¶ì ì²­ì¬ë¡48ë²ê¸¸ 7 3ì¸µ 1í¸</td>
				</tr>
				<tr>
					<td id="b" class="name">ê´ì£¼ëë¬¼ë©ëì»¬ì¼í°</td>
					<td id="bTel">062-523-0075</td>
					<td id="bAddr">ê´ì£¼ ê´ì°êµ¬ ë¶ë¬¸ëë¡420ë²ê¸¸ 206</td>
				</tr>
				<tr>
					<td id="c" class="name">ì ì£¼ëíêµë¶ìëë¬¼ë³ì</td>
					<td id="cTel">064-754-3384</td>
					<td id="cAddr">ì ì£¼ ì ì£¼ì ì ì£¼ëíë¡ 102</td>
				</tr>
				<tr>
					<td id="d" class="name">ë¸ì24ìNëë¬¼ìë£ì¼í°</td>
					<td id="dTel">02-919-0075</td>
					<td id="dAddr">ìì¸ ë¸ìêµ¬ ë¸ìë¡ 456 ë°±ìë¹ë©</td>
				</tr>
				<tr>
					<td id="e" class="name">ì¼ì°ëë¬¼ìë£ì</td>
					<td id="eTel">031-924-7582</td>
					<td id="eAddr">ê²½ê¸° ê³ ìì ì¼ì°ìêµ¬ ëíë¡ 407</td>
				</tr>
				<tr>
					<td id="f" class="name">ì¶©ë¨ëíêµë¶ìëë¬¼ë³ì</td>
					<td id="fTel">042-821-6704</td>
					<td id="fAddr">ëì  ì ì±êµ¬ ëíë¡ 99</td>
				</tr>
				<tr>
					<td id="g" class="name">ë¶ì°ë¤ìëë¬¼ë©ëì»¬ì¼í°</td>
					<td id="gTel">051-632-7580</td>
					<td id="gAddr">ë¶ì° ë¨êµ¬ ììë¡13ë²ê¸¸ 3</td>
				</tr>
				<tr>
					<td id="h" class="name">ëêµ¬íì¤ëë¬¼ë©ëì»¬ì¼í°</td>
					<td id="hTel">053-637-7501</td>
					<td id="hAddr">ëêµ¬ ë¬ìêµ¬ ìê³¡ë¡ 291 ìì¸ì¤ìíì´</td>
				</tr>
			</table>
		</div>
		<div class="hospitalmap" id="map" style="width: 100%; height: 400px;"></div>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="../js/hospital.js"></script>
	</div>
</body>
</html>
