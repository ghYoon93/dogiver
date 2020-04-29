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
				let del = confirm('정말로 삭제하시겠습니까?');
				if(del){
				 $.ajax({
		               type : 'post',
		               url : '/dogiver/contact/admin_contect_delete',
		               data : {'seq':seq},
		               success : function(data) {
		            	   alert('문의가 삭제되었습니다.');
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
				}
			});
		}
	});
}); 