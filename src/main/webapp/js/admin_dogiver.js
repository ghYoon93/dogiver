$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/admin/getDogiver',
		dataType: 'json',
		success: function(data){
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
			
			//상세보기
			$('a').click(function() {
				$('#admin_dogiverView').css('display', 'block');
				let id=$(this).attr('class');
				$.each(data.list, function(index, items){
					if(items.dog_id+''==id){
						$('#dog_image').attr('src', '/dogiver/dogiverImage/'+items.dog_image);
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
			});
		}//success
	});//ajax
	$('#admin_dogiverModifyBtn').click(function() {
		$.ajax({
			type: 'post',
			url: '/dogiver/admin/adminDogiverModify',
			data: {'apply_status': $('#apply_status').val(), 'blood_cc':$('#blood_cc').val(), 'donation_date': $('#donation_date').val()},
			dataType: 'text',
			success: function(data){
				
			}
		});
	});
});