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