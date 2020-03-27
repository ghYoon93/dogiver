//아이디 자동완성
$(function() {
	var hosts = [ "gmail.com", "naver.com", "nate.com", "hanmail.net" ];

	$("#email").autocomplete({
		autoFocus : true,
		minLength : 1, // 1글자부터 작동
		source : function setAutocompleteSource(request, response) {
			var term = request.term
			var atIndex = term.indexOf("@")
			var name = term
			var host = ""
			var result = []
			// 현재 입력한 문자열 추가
			result.push(term)

			if (atIndex > -1) {
				name = term.slice(0, atIndex)
				host = term.slice(atIndex + 1)
			}

			if (name) {
				var findedHosts = hosts.filter(function(item) {
					return item.indexOf(host) > -1;
				})
				var findedResults = findedHosts.map(function(host) {
					return name + "@" + host;
				});
				result = result.concat(findedResults)
				// 중복 제거: 사용자가 입력한 문자열과 자동완성된 문자열이 동일한 경우 제거
				// 예: pcjpcj2@gmail.com 을 끝까지 입력한 상태에서
				// 자동완성 문자열에 pcjpcj2@gmail.com이 두개 나올 수 있음
				result = result.filter(function(element, position) {
					return result.indexOf(element) === position
				})
			}
			response(result);
		}
	});
});
// 아이디 저장
$("#email").val(Cookies.get('key'));
if ($("#email").val() != "") {
	$("#chk_email").attr("checked", true);
}

$("#chk_email").change(function() {
	if ($("#chk_email").is(":checked")) {
		Cookies.set('key', $("#email").val(), {
			expires : 7
		});
	} else {
		Cookies.remove('key');
	}
});

$("#email").keyup(function() {
	if ($("#chk_email").is(":checked")) {
		Cookies.set('key', $("#email").val(), {
			expires : 7
		});
	}
});
// 그냥 로그인
$(document).ready(function() {
	$('#login_btn').click(function() {
		if($('#email').val()==''){
			$('.loginMessage').text('이메일을 입력하세요').fadeIn("slow").css("color","red");
		}else if($('#pwd').val()==''){
			$('.loginMessage').text('비밀번호를 입력하세요').fadeIn("slow").css("color","red");
		}else{
			$('.loginMessage').fadeOut("slow");
			$.ajax({
				type : "post",
				url : "../login/log",
				data : $('#login-form').serialize(),
				dataType: 'text',
				success : function(data) {
					if (data == "true") {
						location.href="../main/index";
					} else {
						$('.loginMessage').text('로그인 실패~ㅋ').fadeIn("slow").css("color","red");
					}
				},
				error : function(data) {
					alert("에러가 발생했습니다.");
				}
			});
		}
		
	});
});
