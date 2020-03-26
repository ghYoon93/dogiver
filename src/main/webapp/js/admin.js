$(document).ready(function() {
	$('li').mouseover(function() {
		$(this).css('color', 'red').css('font-weight', 'bold');
	}).mouseout(function() {
		$(this).css('color', 'black').css('font-weight', 'normal');
	})
	
	$('#dog').click(function() {
		location.href='../admin/admin_dogiver';
	});
});