let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
let rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
	
	
	$('#contact_button').click(function() {
		if ($('#text_name').val() == '') {
			alert("이름을 입력해주세요");
			$('#text_name').focus();
			
		} else if ($('#text_email').val() == '') {
			alert("메일을 입력해주세요");
			$('#text_email').focus();
			
		}else if(exptext.test($('#text_email').val()) == false){
			alert("이메일 형식이 올바르지 않습니다.")
			$('#text_email').focus();
			
		}else if ($('#text_phone').val() == '') {
			alert("핸드폰 번호를 입력해주세요");
			$('#text_phone').focus();
			
		}else if(rgEx.test($('#text_phone').val())==false){
			alert("핸드폰 번호가 올바르지 않습니다.");
			$('#text_phone').focus();
			
		}else if ($('#text_subject').val() == '') {
			alert("주제를  입력해주세요");
			$('#text_subject').focus();
			
		} else if ($('#contact_textarea').val() == '') {
			alert("내용를  입력해주세요");
			$('#contact_textarea').focus();
			
		} else if ($('#text_password').val() == '') {
			alert("비밀번호 4자리를 입력해주세요");
			$('#text_password').focus();
		} else {
			$.ajax({
				type : 'post',
				url : '/dogiver/contact/contactWrite',
				data : $('#contactForm').serialize(),
				success : function(data) {
					alert("작성 완료되었습니다.");
					$('#text_name').val('');
					$('#text_email').val('');
					$('#text_phone').val('');
					$('#text_subject').val('');
					$('#contact_textarea').val('');
					$('#text_password').val('');
					location.href="/dogiver/main/index"
				}
			});
		}
	});

