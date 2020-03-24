$('#boardWrite_Btn').click(function() {
	if ($('#board_select').val() == '') {
		alert("plase selecet the Category");
		$('#board_select').focus();
	} else if ($('#insert_text').val() == '') {
		alert("plase insert your Title");
		$('#insert_text').focus();
	} else if ($('.fr-view p').text() == '') {
		alert("plase insert your Content");
		$('#insert_text').focus();
	}
});  
