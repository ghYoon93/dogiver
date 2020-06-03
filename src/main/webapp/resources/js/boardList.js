$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/dogiver/board/getBoardList',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				if(items.brd_category=='공지'){
				$('<tr/>',{
					style:'background-color:#FFEBF0',
				}).append($('<td/>',{
					align : 'center',
					style:'height:80px',
					style:'font-size: 20px; font-weight:bold; color: red;',
					colspan:'2',
					text : items.brd_category
				})).append($('<td/>',{
						style:'font-size: 20px',
						align : 'center'
					}).append($('<a/>',{
						style:'font-size: 20px',
						href : '#',
						style:'color:#ab2328',
						text : items.brd_title,
						class : 'titleA',
						id : items.brd_seq+''
					}))
				).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_nickname
				})).append($('<td/>',{
					style:'font-size: 20px',
					align : 'center',
					text : items.brd_logtime
				})).appendTo($('#boardListTable'));
				}//if 
			});// each
			
			$.each(data.list, function(index, items){
				if(items.brd_category!='공지'){
				$('<tr/>').append($('<td/>',{
					text : items.brd_seq
				})).append($('<td/>',{
					text : items.brd_category
				})).append($('<td/>').append($('<a/>',{
						text : items.brd_title,
						class : 'titleA',
						id : items.brd_seq+''
					}))
				).append($('<td/>',{
					align : 'center',
					text : items.brd_nickname
				})).append($('<td/>',{
					text : items.brd_logtime
				})).appendTo($('#boardListTable'));
				}//if 
			});// each
			
			// 페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			// 로그인 여부
			$('#boardListTable').on('click', '.titleA', function(){
				if(data.memEmail == null){
					alert('먼저 로그인하세요');
				location.href="/dogiver/login/login"
				}else{
					let seq = $(this).attr('id');
					let pg = data.pg;
					location.href='/dogiver/board/boardView?brd_seq='+seq+'&pg='+pg;        
				}
			});
			
			// 삭제 기능
			$.each(data.list, function(index, items) {
				if(data.memNickName != $('.'+items.re_writer).attr('class')){
					$('.'+items.re_writer).hide();
				}
						
			});
			
			if ((data.memEmail == data.boardDTO.brd_email) || (data.role=='admin')){
				$('#board_member_addBtn').show();}
				else{
				$('#board_member_addBtn').hide();
				}
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
			data : $('#boardListForm').serialize(), // submit이나, serialize에는 항상
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
							class : 'titleA',
							id : items.brd_seq+''
						}))
					).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_nickname
					})).append($('<td/>',{
						style:'height:80px',
						style:'font-size: 20px',
						align : 'center',
						text : items.brd_logtime
					})).appendTo($('#boardListTable'));
				});// each
				
				// 페이징처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				
				// 검색후 뷰 접근
				$('#boardListTable').on('click', '.titleA', function(){
						let seq = $(this).attr('id');
						let pg = data.pg;
						location.href='/dogiver/board/boardView?brd_seq='+seq+'&pg='+pg;        
					
				});
				
				// 삭제 기능
				$.each(data.list, function(index, items) {
					if(data.memNickName != $('.'+items.re_writer).attr('class')){
						$('.'+items.re_writer).hide();
					}
							
				});
				
				if ((data.memEmail == data.boardDTO.brd_email) || (data.role=='admin')){
					$('#board_member_addBtn').show();}
					else{
					$('#board_member_addBtn').hide();
					}
			}
			
		});
		
		
		
	}
});
