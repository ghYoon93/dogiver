<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 헌혈견관리</title>
<link rel="stylesheet" href="../css/admin.css" >
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/admin_dogiver.js"></script>
</head>
<body>
<div>
	<input type="hidden" id="pg" name="pg" value="${pg }">
	<table class="admin_dogiverTable" border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<th width="50">ID</th>
			<th width="100">이름</th>
			<th width="70">나이</th>
			<th width="200">견종</th>
			<th width="100">회원이름</th>
			<th width="100">진행상태</th>
		</tr>
	</table>
	
	<div id="admin_dogiverPagingDiv"></div>
	
	<form action="#" id="admin_dogiverViewForm">
	<div id="admin_dogiverView">
		<input type="hidden" name="dog_id" id="dog_id" value="">
		
		<div id="dog_imageViewDiv" class="admin_dogiverViewDiv">
			<img id="dog_imageView" width="300" height="300" alt="헌혈 완료후 사진등록 해주세요" src="">
		</div>
		<div id="dog_nameDiv" class="admin_dogiverViewDiv">
			<label>이름</label><br>
			<input type="text" id="dog_name" name="dog_name">
		</div>
		<div id="dog_ageDiv" class="admin_dogiverViewDiv">
			<label>나이</label><br>
			<input type="text" id="dog_age" name="dog_age">
		</div>
		<div id="dog_weightDiv" class="admin_dogiverViewDiv">
			<label>몸무게(kg)</label><br>
			<input type="text" id="dog_weight" name="dog_weight">
		</div>
		<div id="dog_breedDiv" class="admin_dogiverViewDiv">
			<label>견종</label><br>
			<input type="text" id="dog_breed" name="dog_breed">
		</div>
		<div id="dog_bloodtypeDiv" class="admin_dogiverViewDiv">
			<label>혈액형</label><br>
			<input type="text" id="dog_bloodtype" name="dog_bloodtype">
		</div>
		<div id="apply_statusDiv" class="admin_dogiverViewDiv">
			<label>진행상태</label><br> 
			<select id="apply_status" name="apply_status">
				<option value="신청완료">신청완료</option>
				<option value="검사대기중">검사대기중</option>
				<option value="헌혈불가">헌혈불가</option>
				<option value="헌혈완료">헌혈완료</option>
			</select>
		</div>
		<div id="blood_ccDiv" class="admin_dogiverViewDiv">
			<label>헌혈량</label><br>
			<input type="text" id="blood_cc" name="blood_cc">
		</div>
		<div id="donation_dateDiv" class="admin_dogiverViewDiv">
			<label>최근 헌혈 날짜</label><br>
			<input type="text" id="donation_date" name="donation_date">
		</div>
		<div id="nameDiv" class="admin_dogiverViewDiv">
			<label>회원이름</label><br>
			<input type="text" id="name" name="name">
		</div>
		<div id="phoneDiv" class="admin_dogiverViewDiv">
			<label>회원연락처</label><br>
			<input type="text" id="phone" name="phone">
		</div>
		<div id="emailDiv" class="admin_dogiverViewDiv">
			<label>회원메일</label><br>
			<input type="text" id="email" name="email">
		</div>
		<div id="dog_imageDiv">
			<label>사진 파일</label><br>
			<input type="file" name="dog_image" id="dog_image">
		</div>
		<div id="descriptionDiv">
			<textarea rows="5" cols="150" id="description" name="description" placeholder="메모"></textarea>
		</div>
		<div id="modifyBtnDiv">
			<div class="btnDiv">
				<button id="admin_dogiverModifyBtn">정보 변경하기</button>
			</div>
			<div class="btnDiv">
				<button id="admin_dogiverBtn">명예의전당 등록</button>
			</div>
		</div>
		</div>
	</form>
</div>
</body>
</html>