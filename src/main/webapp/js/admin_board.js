$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/dogiver/board/getBoardList',
		dataType : 'json',
		success : function(data){
			alert('a');
			alert
			$.each(data.list, function(index, items){
				
				 $('<tr/>').append($('<td/>',{
					style:'font-size: 15px; height:70px; border:1px solid black;',
					align : 'center',
					text : items.brd_seq
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.brd_category
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.brd_nickname
				})).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.brd_email
				})).append($('<td/>',{
					align : 'center',
					//제목
				}).append($('<a/>',{
					style:'font-size: 20px',
					href : '#',
					style:'color:black',
					text : items.brd_title,
					class : 'titleA',
					id : items.brd_seq+''
					
				}))).append($('<td/>',{
					style:'font-size: 15px; height:70px;  border: 1px solid black;',
					align : 'center',
					text : items.brd_logtime
					
				})).append($('<td/>',{
					align : 'center'
						
				}).append($('<input/>',{
					type: 'button',
					value:'삭제',
					class:'deleteBtn', 
					id:items.brd_seq,
					style:'height:30px; width:80px; border: 1px solid black;',
					align: 'center',
					
					}))).appendTo($('#admin_boardTable'));
				
				 //내용 태그
				 $('<tr/>').append($('<td/>',{
					 colspan: '7',
					 text: items.brd_content,
					 style:'display:none;',
					 id:items.brd_seq+''
				 })).appendTo($('#admin_boardTable'));
			});// each 
			
			//내용 보이기
			$(document).on('click', '.titleA', function(){
					let content= $(this).attr('id');
					$('#content').css('display','block');
			});
//			//삭제 버튼
//			$(document).on('click', '.deleteBtn', function(){
//				let seq= $(this).attr('id');
//				alert(seq);
//			 $.ajax({
//	               type : 'post',
//	               url : '/dogiver/board/boardDelete',
//	               data : {'brd_seq':seq},
//	               success : function(data) {
//	            	   alert('성공');
//	            	  
//	               }
//			}); 
//		});
			// 페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
		}
	});
}); 