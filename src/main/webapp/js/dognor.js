$('img').mouseover(function(){
	$(this).css('width', '280px').css('height','350px').css('margin-left','-20%');
	$(this).parent().next().hide();
}).mouseout(function(){
	$(this).css('width', '200px').css('height','200px').css('margin-left','0');
	$('.dognorContent').show();
});
