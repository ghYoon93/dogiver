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
					text: items.dog_name+"("+items.dog_age+"살)"
				}).append($('<br>')
							).append(items.dog_weight+'kg').append($('<br>')
									).append(items.dog_breed)
				).appendTo($('.dognorlist'))
			});//each
			
		}
	});
	$(document).on('mouseover', 'img', function(){
		$(this).css('width', '280px').css('height','300px').css('margin-left','-20%');
	});
	$(document).on('mouseout', 'img', function(){
		$(this).css('width', '200px').css('height','200px').css('margin-left','0');
	});
	/*$('img').mouseover(function(){
		$(this).css('width', '280px').css('height','300px').css('margin-left','-20%');
		//$(this).parent().next().hide();
	}).mouseout(function(){
		$(this).css('width', '200px').css('height','200px').css('margin-left','0');
		//$('.dognorContent').show();
	});*/
});
