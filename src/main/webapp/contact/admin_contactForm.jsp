<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<style type="text/css">

</style>
</head>
<body>
	<div id="headerDiv"></div>
	<div class="page-title">
	</div>
	<form id="admin_contactForm">
	
		<div class="wrap">
			<div class="container" style="width: 1100px; margin: 0 auto; margin-top: 150px;">
				<h1>contact 관리자 페이지</h1>
				<table id="admin_contactTable" border="1" cellpadding="5"
					frame="hsides " rules="rows">
					<tr height="70">
						<th width="50" style="font-size: 15px;">번호</th>
						<th width="50" style="font-size: 15px;">이름</th>
						<th width="150" style="font-size: 15px;">이메일</th>
						<th width="150" style="font-size: 15px;">핸드폰번호</th>
						<th width="150" style="font-size: 15px;">주제</th>
						<th width="450" style="font-size: 15px;">내용</th>
						<th width="100" style="font-size: 15px;">작성시간</th>
					</tr>
				</table>
				
<!-- 				<table id="admin_content" border="1" cellpadding="5"
					frame="hsides " rules="rows">
					
				</table>
 -->					
			</div>
		</div>
	</form>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/dogiver/contact/contactList',
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data)); 
			$.each(data.list, function(index, items){
				 $('<tr/>').append($('<td/>',{
					style:'height:50px',
					style:'font-size: 15px',
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.name
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.email
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.phone
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.subject
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.content
				})).append($('<td/>',{
					style:'font-size: 15px',
					align : 'center',
					text : items.logtime
				})).appendTo($('#admin_contactTable'));
			/* .append($('<td/>',{
			style:'font-size: 20px',
			align : 'center'
		}).append($('<a/>',{
			style:'font-size: 20px',
			href : '#',
			style:'color:#ab2328',
			text : items.brd_title,
			id : 'titleA',
			class : items.brd_seq+''
		})) */
			});// each */
		}
	});
}); 
</script>
</html>