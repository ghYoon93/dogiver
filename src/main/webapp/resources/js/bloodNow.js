$(document).ready(function() {
	$('#first-content').fadeIn(2000);

	var content1 = 380; // 100% 투명할때의 스크롤 값
	var content2 = 1430;
	var content3 = 2130;
	var content4 = 2970;
	$(window).scroll(function() {
		var scrollPX = $(this).scrollTop();
		if (scrollPX < content1)
			$("#content1").hide();
		else
			$("#content1").show(2000);
		if (scrollPX < content2)
			$("#content2").hide();
		else
			$("#content2").show(2000);
		if (scrollPX < content3)
			$("#content3").hide();
		else
			$("#content3").show(2000);
		if (scrollPX < content4)
			$("#content4").hide();
		else
			$("#content4").show(2000);
	});
});

$(document).on('click', '#bloodNowBtn', function() {

	if ($('#memEmail').val() == '') {
		location.href = '/dogiver/login/login';

	} else {
		location.href = '/dogiver/blood/dogJoin';
	}

});
