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
$(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='email']").val(userInputId); 
     
    if($("input[name='email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#chk_email").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#chk_email").change(function(){ // 체크박스에 변화가 발생시
        if($("#chk_email").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#chk_email").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
// 그냥 로그인
$(document).ready(function() {
	$('#login_btn').click(function() {
		if($('#email').val()==''){
			$('.loginMessage').text('이메일을 입력하세요').show("fast").css("color","red");
			setTimeout(function() {
				$(".loginMessage").hide(1000);
			}, 1000);
		}else if($('#pwd').val()==''){
			$('.loginMessage').text('비밀번호를 입력하세요').show("fast").css("color","red");
			setTimeout(function() {
				$(".loginMessage").hide(1000);
			}, 1000);
		}else{
			$.ajax({
				type : "post",
				url : "../login/log",
				data : $('#login-form').serialize(),
				dataType: 'text',
				success : function(data) {
					if (data == "true") {
				        location.reload();
					} else {
						$('.loginMessage').text('로그인 실패~ㅋ').show("slow").css("color","red");
						setTimeout(function() {
							$(".loginMessage").hide(1000);
						}, 1000);
					}
				},
				error : function(data) {
					alert("에러가 발생했습니다.");
				}
			});
		}
		
	});
});
//아이디 비밀번호 찾기 모달
document.getElementById("find-btn")[0].click();

function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.classList.add("w3-light-grey");
}
