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
			<th width="70">혈액형</th>
			<th width="100">회원이름</th>
			<th width="100">진행상태</th>
		</tr>
	</table>
	
	<div id="admin_dogiverPagingDiv"></div>
	
	<div id="admin_dogiverView">
	<form action="#" id="admin_dogiverViewForm">
		<input type="hidden" name="dog_id" id="dog_id" value="">
		<table >
			<tr>
				<td rowspan="3" width="300" height="400" >
					<img id="dog_imageView" width="300" height="300" alt="헌혈 완료후 사진등록 해주세요" src="">
				</td>
				<td width="110" class="subject">이름 : </td>
				<td>
					<div id="dog_name"></div>
				</td>
				<td width="110" class="subject">나이 : </td>
				<td>
					<div id="dog_age"></div>
				</td>
				<td width="110" class="subject">몸무게 : </td>
				<td>
					<div id="dog_weight"></div>
				</td>
			</tr>
			<tr>
				<td class="subject">견종 : </td>
				<td>
					<div id="dog_breed"></div>
				</td>
				<td class="subject">혈액형 : </td>
				<td>
					<div id="dog_bloodtype"></div>
				</td>
				<td class="subject">진행상태 : </td>
				<td>
					<select id="apply_status" name="apply_status">
						<option value="신청완료">신청완료</option>
						<option value="검사대기중">검사대기중</option>
						<option value="헌혈완료">헌혈완료</option>
						<option value="헌혈불가">헌혈불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="subject">헌혈량 : </td>
				<td>
					<input type="text" id="blood_cc" name="blood_cc">
				</td>
				<td class="subject">헌혈 날짜 : </td>
				<td>
					<input type="text" id="donation_date" name="donation_date">
				</td>
				<td class="subject">회원이름 : </td>
				<td>
					<div id="name"></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" name="dog_image" id="dog_image">
				</td>
				<td class="subject">회원연락처 : </td>
				<td>
					<div id="phone"></div>
				</td>
				<td class="subject">회원 이메일 : </td>
				<td colspan="3">
					<div id="email"></div>
				</td>
			</tr>
			<tr>
				<td colspan="5" valign="middle"> 
					<textarea rows="5" cols="150" name="description" id="description" placeholder="메모"></textarea>
				</td>
				<td align="center" colspan="2">
					<div>
						<button id="admin_dogiverModifyBtn">정보 변경하기</button>
					</div>
					<div>
						<button id="admin_dogiverBtn">명예의전당 등록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>