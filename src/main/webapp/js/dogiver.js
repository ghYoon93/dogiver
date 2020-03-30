$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/blood/getDogiver',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<dd/>').append($('<div/>',{
					class: 'dognorImg',
					id: items.dog_id+""
				}).append($('<img/>',{
					src: '../dogiverImage/'+items.dog_image
				}))).append($('<div/>',{
					class: 'dognorContent',
					text: items.dog_name
				})).appendTo($('.dognorlist'))
			});// each
			
			
			// 모달 팝업 활성화
			$(document).on('click','.dognorImg', function(){
				$('#dogiverView').show();
				$('#modalWrap').show();
				let id = $(this).attr('id');
				$.each(data.list, function(index, items){
					if(id==items.dog_id+''){
						$('#image img').attr('src', '../dogiverImage/'+items.dog_image);
						$('#name').text(items.dog_name);
						$('#age').text(items.dog_age+'살');
						$('#weight').text(items.dog_weight+'kg');
						$('#breed').text(items.dog_breed);
						$('#bloodType').text(items.dog_bloodtype);
						$('#donationDate').text(items.donation_date);
						$('#description').text(items.description);
					}
				});
			});
			
			// 모달 제거
			$('#modalWrap').click(function() {
				if (!$(this.target).is('#dogiverView')) {
					$("#dogiverView").hide();
					$('#modalWrap').hide();
				}
			});
			
		}// success
	});// ajax
	
	/*
	 * $(document).on('mouseover', 'dd', function(){ $(this).css('border', '3px
	 * solid').css('border-color','gold'); }); $(document).on('mouseout', 'dd',
	 * function(){ $(this).css('border', '0px').css('border-color','white'); });
	 */
	
	
	
	
});
