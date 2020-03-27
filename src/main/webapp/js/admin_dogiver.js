$(document).ready(function() {
	$.ajax({
		type: 'get',
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
					text: items.dog_weight
				})).append($('<td/>', {
					text: items.dog_breed
				})).append($('<td/>', {
					text: items.dog_bloodtype
				})).append($('<td/>', {
					text: items.name
				})).append($('<td/>', {
					text: items.email
				})).append($('<td/>', {
					text: items.phone
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
						$('#dog_name').text(items.dog_name);
						$('#dog_age').text(items.dog_age);
						$('#dog_weight').text(items.dog_weight);
						$('#dog_breed').text(items.dog_breed);
						$('#dog_bloodtype').text(items.dog_bloodtype);
						$('#apply_status').val(items.apply_status);
						$('#blood_cc').val(items.blood_cc);
						$('#donation_date').val(items.donation_date);
						$('#name').text(items.name);
						$('#phone').text(items.phone);
						$('#email').text(items.email);
						$('#description').val(items.description);
					}
				});//each
				
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
							if(data!='0'){
								alert("헌혈견 정보 수정 완료")
								location.reload();
							}
						}
							   
					});//ajax
				});//정보변경
			});//상세보기
		}//success
	});//ajax

});