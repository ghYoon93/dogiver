$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/blood/getDogiver',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<dd/>').append($('<div/>',{
					class: 'dognorImg'
				}).append($('<img/>',{
					src: '../dogiverImage/'+items.dog_image
				}))).append($('<div/>',{
					class: 'dognorContent',
					text: items.dog_name
				})).appendTo($('.dognorlist'))
			});//each
			
		}
	});//ajax
	
	/*$(document).on('mouseover', 'dd', function(){
		$(this).css('border', '3px solid').css('border-color','gold');
	});
	$(document).on('mouseout', 'dd', function(){
		$(this).css('border', '0px').css('border-color','white');
	});*/
	
	
});
