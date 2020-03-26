$(document).click(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/admin/getDogiver',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
			
		}
	});
});