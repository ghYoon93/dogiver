$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/admin/getDogiver',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>', {
					text: items.dog_id
				})).append($('<td/>', {
					
				}).append($('<a/>',{
					href: '#',
					text: items.dog_name,
					class: items.dog_id+''
				}))).append($('<td/>', {
					text: items.dog_age
				})).append($('<td/>', {
					text: items.dog_breed
				})).append($('<td/>', {
					text: items.name
				})).append($('<td/>', {
					text: items.apply_status
				})).appendTo($('.admin_dogiverTable'))
			});//each
			
			//페이징 처리
			$('#admin_dogiverPagingDiv').html(data.admin_dogiverPaging.pagingHTML);
			
			let id;
			//상세보기
			$('.admin_dogiverTable a').click(function() {
				$('#admin_dogiverView').css('display', 'block');
				id=$(this).attr('class');
				
				$.each(data.list, function(index, items){
					if(items.dog_id+''==id){
						$('#dog_id').val(items.dog_id);
						$('#dog_imageView').attr('src', '/dogiver/dogiverImage/'+items.dog_image);
						$('#dog_name').val(items.dog_name);
						$('#dog_age').val(items.dog_age);
						$('#dog_weight').val(items.dog_weight);
						$('#dog_breed').val(items.dog_breed);
						$('#dog_bloodtype').val(items.dog_bloodtype);
						$('#apply_status').val(items.apply_status);
						$('#blood_cc').val(items.blood_cc);
						$('#donation_date').val(items.donation_date);
						$('#name').val(items.name);
						$('#phone').val(items.phone);
						$('#email').val(items.email);
						$('#dog_image').html(items.dog_image);
						$('#description').val(items.description);
					}
				});//each				
			});//상세보기
			
			//헌혈견 정보변경
			$('#admin_dogiverModifyBtn').click(function() {
				let formData = new FormData($('#admin_dogiverViewForm')[0]);
				$.ajax({
					type: 'post',
					enctype: "multipart/form-data",
					processData: false,//데이터를 컨텐트 타입에 맞게 변환 여부
					contentType: false,//요청 컨텐트 타입
					url: '/dogiver/admin/adminDogiverModify',
					data: formData,
					dataType: 'text',
					success: function(data){
						if(data=='success'){
							alert("헌혈견 정보 수정 완료");
							location.reload();
						}else{
							alert("수정 실패 문의해주세요");
						}
					},
					error: function(error){
						alert(error);
					}
					
				});//ajax
			});//정보변경
			
			//명예의 전당 등록
			$('#admin_dogiverBtn').click(function() {
				if($('#dog_image').val()!=""){
					let formData = new FormData($('#admin_dogiverViewForm')[0]);
					$.ajax({
						type: 'post',
						enctype: "multipart/form-data",
						processData: false,//데이터를 컨텐트 타입에 맞게 변환 여부
						contentType: false,//요청 컨텐트 타입
						url: '/dogiver/admin/dogiverInsert',
						data: formData,
						dataType: 'text',
						success: function(data){
							if(data=='success'){
								alert("명예의 전당 등록");
							}else{
								alert("등록 실패 문의하세요");
							}	
						}
					});//ajax
				}else{
					alert("사진파일을 등록해주세요");
				}
			});//등록
			
		}//success
	});//ajax

});