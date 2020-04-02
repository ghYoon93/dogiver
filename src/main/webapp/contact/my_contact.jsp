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
	<div class="page-title"></div>
	<div id="my-write" style="width: 1100px; margin: 0 auto;  margin-top:100px; margin-bottom: 80px; border: 1px solid red;">
		<form id="myContactForm">
			<div class="mycon-container"
				style="width: 1100px; margin: 0 auto; text-align: center;">
				<table id="my_contactTable" border="1" cellpadding="5" frame="hsides " rules="rows">
					<tr height="70">
						<th width="200" style="font-size: 15px; border: 1px solid black;">번호</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">주제</th>
						<th width="300" style="font-size: 15px; border: 1px solid black;">내용</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">작성날짜</th>
						<th width="200" style="font-size: 15px; border: 1px solid black;">삭제</th>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div id="footerDiv"></div>
</body>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		$.ajax({ 
			type : 'POST',
			url : '/dogiver/contact/getInfo',
			dataType : 'json',
			success : function(data) {
				alert('a');
				$('#my_contactTable td').remove();
				$.each(data.list, function(index, items) {
					$('<tr/>').append($('<td/>', {
						style:'height:100px; font-size:17px;',
						align : 'center',
						text : items.seq
					})).append($('<td/>', {
						style:'height:100px; font-size:17px;',
						align : 'center',
						text : items.subject
					})).append($('<td/>', {
						style:'height:100px; font-size:17px;',
						align : 'center',
						text : items.content
					})).append($('<td/>', {
						style:'height:100px; font-size:17px;',
						align : 'center',
						text : items.logtime
					})).append($('<td/>', {
						style:'height:100px; font-size:17px;',
						align : 'center'
						}).append($('<input/>',{
							type:'button',
							value:'삭제',
							style:'width:80px; height:30px;',
							id:items.seq+'',
							class:'delete'
					}))).appendTo($('#my_contactTable'));
				});//each
			}
		});
		
		 $(document).on('click', '.delete', function(){
			let seq = $(this).attr('id');
			 $.ajax({
	               type : 'post',
	               url : '/dogiver/contact/my_contect_delete',
	               data : {'seq':seq},
	               success : function(data) {
	            	   alert('삭제완료');
	            	   $.ajax({ 
	           			type : 'POST',
	           			url : '/dogiver/contact/getInfo',
	           			dataType : 'json',
	           			success : function(data) {
	           				alert('a');
	           				$('#my_contactTable td').remove();
	           				$.each(data.list, function(index, items) {
	           					$('<tr/>').append($('<td/>', {
	           						style:'height:100px;',
	           						align : 'center',
	           						text : items.seq
	           					})).append($('<td/>', {
	           						style:'height:100px;',
	           						align : 'center',
	           						text : items.subject
	           					})).append($('<td/>', {
	           						style:'height:100px;',
	           						align : 'center',
	           						text : items.content
	           					})).append($('<td/>', {
	           						style:'height:100px;',
	           						align : 'center',
	           						text : items.logtime
	           					})).append($('<td/>', {
	           						style:'height:100px;',align : 'center'
	           						}).append($('<input/>',{
	           							type:'button',
	           							value:'삭제',
	           							id:items.seq+'',
	           							class:'delete'
	           					}))).appendTo($('#my_contactTable'));
	           				});//each
	           			}
	           		});
	               }
			 }); 	  
		 });   	    
	});
</script>

</html>