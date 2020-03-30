$('#contact_button').click(function() {
		if ($('#text_name').val() == '') {
			alert("plase insert your Name");
			$('#text_name').focus();

		} else if ($('#text_email').val() == '') {
			alert("plase insert your Email");
			$('#text_email').focus();

		} else if ($('#text_phone').val() == '') {
			alert("plase insert your Phone");
			$('#text_phone').focus();

		} else if ($('#text_subject').val() == '') {
			alert("plase insert your Subject");
			$('#text_subject').focus();

		} else if ($('#contact_textarea').val() == '') {
			alert("plase insert your Content");
			$('#contact_textarea').focus();
		}else{
			$.ajax({
				type : 'post',
				url : '/dogiver/contact/contactWrite',
				data : $('#contactForm').serialize(),
				dataType : 'text',
				success : function(data){
					
					alert("작성 완료되었습니다.")
					
					$('#text_name').val('');
					$('#text_email').val('');
					$('#text_phone').val('');
					$('#text_subject').val('');
					$('#contact_textarea').val('');
					
				}
			});
		}
	});