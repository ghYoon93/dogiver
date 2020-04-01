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
	<form id="admin_contactForm" method="post">
		<div class="wrap">
			<div class="container" style="width: 1100px; margin: 0 auto; margin-top: 150px;">
				<h1>contact 관리자 페이지</h1>
				<table id="admin_contactTable" border="1" cellpadding="5" frame="hsides " rules="rows">
					<tr height="70">
						<th width="50" style="font-size: 15px; border: 1px solid black;">번호</th>
						<th width="50" style="font-size: 15px; border: 1px solid black;">이름</th>
						<th width="140" style="font-size: 15px; border: 1px solid black;">이메일</th>
						<th width="150" style="font-size: 15px; border: 1px solid black;">핸드폰번호</th>
						<th width="100" style="font-size: 15px; border: 1px solid black;">주제</th>
						<th width="300" style="font-size: 15px; border: 1px solid black;">내용</th>
						<th width="60" style="font-size: 15px; border: 1px solid black;">비밀번호</th>
						<th width="100" style="font-size: 15px; border: 1px solid black;">작성시간</th>
						<th width="100" style="font-size: 15px; border: 1px solid black;">데이터 삭제</th>
					</tr>
				</table>
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
			$.each(data.list, function(index, items){
				 $('<tr/>').append($('<td/>',{
					style:'font-size: 15px; height:70px; border:1px solid black;',
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.name
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.email
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.phone
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.subject
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.content
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.password
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.logtime
				})).append($('<td/>',{
					align : 'center'
				}).append($('<input/>',{
					type: 'button',
					value:'삭제',
					class:'deleteBtn', 
					id:items.seq,
					style:'height:30px; width:80px; border: 1px solid black;',
					align: 'center',
					}))).appendTo($('#admin_contactTable'));
			});// each 
			
			
			$(document).on('click', '.deleteBtn', function(){
				let seq= $(this).attr('id');
				alert(seq);
				 $.ajax({
		               type : 'post',
		               url : '/dogiver/contact/admin_contect_delete',
		               data : {'seq':seq},
		               success : function(data) {
		            	   alert('성공');
		            	   $('#admin_contactTable td').remove();
		            	   $.ajax({
		            			type : 'post',
		            			url : '/dogiver/contact/contactList',
		            			dataType : 'json',
		            			success : function(data){
		            				$.each(data.list, function(index, items){
		            					 $('<tr/>').append($('<td/>',{
		            						style:'font-size: 15px; height:70px; border:1px solid black;',
		            						align : 'center',
		            						text : items.seq
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.name
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.email
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.phone
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.subject
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.content
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.password
		            					})).append($('<td/>',{
		            						style:'font-size: 15px; height:70px;  border: 1px solid black;',
		            						align : 'center',
		            						text : items.logtime
		            					})).append($('<td/>',{
		            						align : 'center'
		            					}).append($('<input/>',{
		            						type: 'button',
		            						value:'삭제',
		            						class:'deleteBtn', 
		            						id:items.seq,
		            						style:'height:30px; width:80px; border: 1px solid black;',
		            						align: 'center',
		            						}))).appendTo($('#admin_contactTable'));
		            				});// each 
		            			}
		            	   });
		            	   
		               }
				}); 
			});
		}
	});
}); 
</script>
</html>