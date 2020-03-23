<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardTable.css">
<link rel="stylesheet" href="../css/style.css" />
<link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
<style type="text/css">
td {
	height: 30px;
}

.writepage-button-box{
	margin: 0 auto; 
	text-align: center;	
}
.writepage-button{
	width: 100px; 
	border: 1px solid black; 
	margin: 10px auto; 
	text-align: center;
}
.paging-area{
	margin: 10px auto; 
	text-align: center;
}
.search_area{
	width: 1100px; 
	margin-left: 2px;
}
.search_list{
	width: 300px; 
	float: left; 
	text-align: center; 
	height: 40px; 
	margin-top: 20px;
}
.search_write{
	width: 490px; 
	float: left; 
	margin: 0 auto; 
	text-align: center; 
	height: 40px; 
	margin-top: 20px;"
}

.search_button{
	width: 300px; 
	float: left; 
	margin: 0 auto; 
	text-align: center; 
	height: 40px; 
	margin-top: 20px;"
}
</style>
</head>
<body>
 <div id="headerDiv"></div>
	<div class="wrap">
		<div class="table-area">
			<table border="1" style="width: 100%">
				<thead>
					<!-- 테이블의 제목부분  -->
					<tr>
						<th id="number" width="100">Number</th>
						<th id="category" width="100">Category</th>
						<th id="title">Title</th>
						<th id="user">User</th>
						<th id="count" width="100">Count</th>
						<th id="date">Date</th>
					</tr>
				</thead>

				<!-- 화면구현단 -->
				<tbody>
					<tr>
						<td align="center">1</td>
						<td align="center">고민</td>
						<td align="center">1번째 글입니다..</td>
						<td align="center">홍길동</td>
						<td align="center">23</td>
						<td align="center">2010-05-04</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">2</td>
						<td align="center">자랑</td>
						<td align="center">2번째 글입니다.</td>
						<td align="center">영어천재</td>
						<td align="center">25</td>
						<td align="center">2010-05-03</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">3</td>
						<td align="center">가입</td>
						<td align="center">3번째 글입니다.</td>
						<td align="center">감나무</td>
						<td align="center">3</td>
						<td align="center">2010-05-02</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">4</td>
						<td align="center">가입</td>
						<td align="center">4번째 글입니다.</td>
						<td align="center">소나무</td>
						<td align="center">13</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">5</td>
						<td align="center">헌혈</td>
						<td align="center">5번째 글입니다.</td>
						<td align="center">참나무</td>
						<td align="center">6</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">5</td>
						<td align="center">헌혈</td>
						<td align="center">6번째 글입니다.</td>
						<td align="center">참나무</td>
						<td align="center">6</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">5</td>
						<td align="center">자랑</td>
						<td align="center">7번째 글입니다.</td>
						<td align="center">참나무</td>
						<td align="center">6</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">5</td>
						<td align="center">헌혈</td>
						<td align="center">8번째 글입니다.</td>
						<td align="center">참나무</td>
						<td align="center">6</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>

				<tbody>
					<tr>
						<td align="center">5</td>
						<td align="center">자랑</td>
						<td align="center">9번째 글입니다.</td>
						<td align="center">참나무</td>
						<td align="center">6</td>
						<td align="center">2010-05-01</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="writepage-button-box">
			<div class="writepage-button">
				<a href="boardWrite.jsp" style="font-size: 20px;">글쓰기</a>
			</div>
		</div>

		<div class="paging-area">
			<span style="font-size: 25px;">이전&emsp;&emsp;1&emsp;&emsp;2&emsp;&emsp;3&emsp;&emsp;4&emsp;&emsp;5&emsp;&emsp;6&emsp;&emsp;8&emsp;&emsp;9&emsp;&emsp;다음
			</span>
		</div>

		<div class="search_area">
			<div class="search_list">
				<select size="1"
					style="width: 100px; height: 30px; text-align-last: center;">
					<option label="분류" selected="selected"></option>
					<option label="제목"></option>
					<option label="내용"></option>
					<option label="종류"></option>
					<option label="제목+내용"></option>
				</select>
			</div>

			<div class="search_write">
				<input type="text" placeholder="Search" style="width: 450px; height: 25px; padding-left: 20px;">
			</div>

			<div class="search_button">
				<input type="button" value="검색" style="width: 100px; height: 30px;">
			</div>
		</div>
	</div>
	 <div id="footerDiv"></div>
</body>
</html>