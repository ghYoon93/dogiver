$(document).ready(function() {
    //체크박스
	$('input[type="checkbox"][name="drop_Yn"]').click(function(){
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="drop_Yn"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
    
    $('input[type="checkbox"][name="role"]').click(function(){
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="role"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
    
    $('input[type="checkbox"][name="email_Yn"]').click(function(){
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="email_Yn"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
    //체크박스끝
    
    //리스트
    $.ajax({
    	type: 'post',
    	url: '../admin/getMemberList',
    	data: 'pg='+$('#pg').val(),
    	dataType: 'json',
    	success: function(data){
    		//alert(JSON.stringify(data));
    		$.each(data.list, function(index, items){
    			$('<tr/>').append($('<td/>', {
					text: items.seq
				})).append($('<td/>', {
				}).append($('<a/>',{
					text: items.email,
					class: items.email+''
				}))).append($('<td/>', {
					text: items.name
				})).append($('<td/>', {
					text: items.nickName
				})).appendTo($('#memberList'))
    		});
    		
    		//페이징 처리
			$('#memberPagingDiv').html(data.memberPaging.pagingHTML);
			
			$('#memberList a').click(function(){
				$('#look').slideToggle('fast');
				
				var id=$(this).attr('class');
				
				$.each(data.list, function(index, items){
					if(items.email+''==id){
						$('#email').val(items.email);
						$('#name').val(items.name);
						$('#nickName').val(items.nickName);
						$('#pwd').val(items.pwd);
						$('#phone').val(items.phone);
						$('#zipcode').val(items.zipcode);
						$('#addr').val(items.addr);
						$('#addr_Detail').val(items.addr_Detail);
						$('#regist_Date').val(items.regist_Date);
						$('#drop_Date').val(items.drop_Date);
						if(items.drop_Yn == 'N')
							$("input:checkbox[id='dropN']").prop("checked", true)
						else
							$("input:checkbox[id='dropY']").prop("checked", true)
						if(items.role == 'member')
							$("input:checkbox[id='roleM']").prop("checked", true)
						else
							$("input:checkbox[id='roleA']").prop("checked", true)
						if(items.email_Yn == 'N')
							$("input:checkbox[id='emailN']").prop("checked", true)
						else
							$("input:checkbox[id='emailY']").prop("checked", true)
					}
				});
				
			});
    	}
    });
    
    $('#admin-btn').click(function(){
    	var result = confirm('정말로 변경/삭제하시겠습니까?');
    	
    	if(result) { 
    		$.ajax({
    			type: 'post',
    			url: '../admin/change',
    			data: $('#look form').serialize(),
    			success: function(data){
    				alert(data);
    				location.reload();
    			},
    			error: function(data){
    				console.log(data);
    			}
    		});
    	} else { 
    		return false;
    	}

    });
});