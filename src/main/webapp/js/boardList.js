$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/dogiver/board/getBoardList',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					style:'height:80px',
					style:'font-size: 20px',
					text : items.brd_seq
				})).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_category
				})).append($('<td/>',{
						style:'font-size: 20px',
						align : 'center'
					}).append($('<a/>',{
						style:'font-size: 20px',
						href : '#',
						style:'color:#ab2328',
						text : items.brd_title,
						id : 'titleA',
						class : items.brd_seq+''
					}))
				).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_id
				})).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_logtime
				})).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_hit
				})).appendTo($('#boardListTable'));
				
			});//each
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			$('#titleA').click(function(){
					let brd_seq = $(this).attr('class');
					let pg = data.pg;
					location.href='/dogiver/board/boardView?brd_seq='+brd_seq+'&pg='+pg;        
			});
		}
	});
});
			
$('#boardSearchBtn').click(function(event, str){
	if(str!='trigger') $('input[name=pg]').val(1);
	
	if($('input[name=keyword]').val()==''){
		alert('검색어를 입력하세요');
	}else {
		$('#boardListTable tr:gt(0)').remove();
		$.ajax({
			type : 'post',
			url : '/dogiver/board/getBoardSearch',
			data : $('#boardListForm').serialize(), //submit이나, serialize에는  항상 name 속성만 전달된다.
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_seq
					})).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_category
					})).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
							align : 'center',
						}).append($('<a/>',{
							style:'height:80px',
							style:'font-size: 20px',
							href : '#',
							text : items.brd_title,
							id : 'titleA',
							class : items.brd_seq+''
						}))
					).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_id
					})).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_logtime
					})).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_hit
					})).appendTo($('#boardListTable'));
					
				});//each
				
				//페이징처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			}
			
		});
		
	}
});