<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<link rel="favicon" href="../image/favicon.ico" />
<link rel="shortcut icon" href="../image/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="../image/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>admin</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/admin.css" />
<link rel="stylesheet" href="../css/sign.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/main.js"></script>
<script type="text/javascript" src="../js/admin.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>admin</h2>
		<p>관리자 페이지 입니다.</p>
	</div>
	<div id="wrap">
		<input type="hidden" id="pg" name="pg" value="${pg }">
		<div class="admin-page">
			<div class="admin-nav">
				<ol>
					<li class="on"><a href="../admin/admin">회원관리</a></li>
					<li><a href="../admin/admin_blood">헌혈견 관리</a></li>
					<li><a href="">상품 관리</a></li>
					<li><a href="../admin/admin_board">게시글 관리</a></li>
					<li><a href="../admin/admin_contact">문의 관리</a></li>
				</ol>
			</div>
			<div class="article">
				<div class="member">

					<div class="panel panel-default">
						<div class="panel-heading">회원 명단 출력</div>
						<div class="panel-body">
							<%--테이블 태그 --%>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>이메일</th>
										<th>이름</th>
										<th>닉네임</th>
										<th>권한</th>
									</tr>
								</thead>
								<tbody id="memberList">
									<!-- <tr>
										<td>1</td>
										<td>john@example.com</td>
										<td>John</td>
										<td>Doe</td>
									</tr>
									<tr>
										<td>2</td>
										<td>mary@example.com</td>
										<td>Mary</td>
										<td>Moe</td>
									</tr> -->
								</tbody>
							</table>
							
							<div id="memberPagingDiv"></div>
	
							<form method="post" class="form-inline">
								<div class="form-group">
									<select class="form-control" name="skey" id="skey">
										<option value="seq">seq</option>
										<option value="email">이메일</option>
										<option value="name">이름</option>
										<option value="nickName">닉네임</option>
									</select>
								</div>

								<div class="form-group">
									<input type="text" class="form-control" id="svalue"
										name="svalue">
								</div>

								<button type="submit" class="btn btn-default">검색</button>

							</form>
						</div>
					</div>
					<!-- 구분 -->
					<div class="panel panel-default" id="look">
						<div class="panel-heading">회원 정보 수정</div>

						<div class="panel-body">
							<form>
								<div class="form-group">
									<label for="email">이메일:</label> 
									<input type="text" class="form-control" id="email" name="email" >
								</div>
								<div class="form-group">
									<label for="name">이름:</label> 
									<input type="text" class="form-control" id="name" name="name" >
								</div>
								<div class="form-group">
									<label for="nickName">닉네임:</label> 
									<input type="text" class="form-control" id="nickName" name="nickName" >
								</div>
								<div class="form-group">
									<label for="pwd">비밀번호:</label> 
									<input type="text" class="form-control" id="pwd" name="pwd" >
								</div>
								<div class="form-group">
									<label for="phone">전화번호:</label> 
									<input type="text" class="form-control" id="phone" name="phone" >
								</div>
								<div class="form-group">
									<label>주소:</label>
									<input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="우편번호" readonly />
									<button type="button" class="btn btn-default" id="btn_2" onclick="sample2_execDaumPostcode()">우편번호검색</button> <br />
									<input type="text" class="form-control" name="addr" id="addr" placeholder="주소" readonly /> <br /> 
									<input type="text" class="form-control" name="addr_Detail" id="addr_Detail" placeholder="상세주소" />
								</div>
								<div class="form-group">
									<label for="regist_Date">가입일:</label> 
									<input type="text" class="form-control" id="regist_Date" name="regist_Date">
								</div>
								<div class="form-group"  style="display:none">
									<label for="drop_Date">탈퇴일:</label> 
									<input type="text" class="form-control" id="drop_Date" name="drop_Date">
								</div>
								<div class="form-group">
									<label for="drop_Yn">탈퇴:</label>
									<div class="form-sort">
										<input type="checkbox" name="drop_Yn" id="dropY" value="Y"/> <label for="dropY">Y</label>
										<input type="checkbox" name="drop_Yn" id="dropN" value="N"  checked="checked"/> <label for="dropN">N</label>
									</div>
								</div>
								<div class="form-group">
									<label for="role">권한:</label> 
									<div class="form-sort">
										<input type="checkbox" name="role" id="roleM" value="member"/> <label for="roleM">member</label>
										<input type="checkbox" name="role" id="roleA" value="admin" /> <label for="roleA">admin</label>
									</div>
								</div>
								<div class="form-group">
									<label for="email_Yn">이메일 수신:</label>
									<div class="form-sort">
										<input type="checkbox" name="email_Yn" id="emailY" value="Y"/> <label for="emailY">Y</label>
										<input type="checkbox" name="email_Yn" id="emailN" value="N" /> <label for="emailN">N</label>
									</div> 
								</div>

								<button type="button" class="btn btn-default" id="admin-btn">수정</button>
								<!-- <button type="button" class="btn btn-default">강퇴</button> -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footerDiv"></div>
</body>
</html>