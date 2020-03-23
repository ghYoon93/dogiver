// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
	modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
// if (event.target == modal) {
// modal.style.display = "none";
// }
// };
// 타이머
function $ComTimer(){
    // prototype extend
}

$ComTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은
																						// 시간
																						// 계산
        this.comSecond--;					// 1초씩 감소
        this.domId.innerText = m;
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            $("#result-div").text("인증시간이 초과되었습니다.").css("color", "red");
        }
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
// [출처] [javascript] 인증번호 입력 타이머 기능 쉽게 만들기~!|작성자 온이파파
}

// 이메일 버튼 클릭 이벤트
$("#email-btn").click(function() {
			let $email = $("#email");
			let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if ($email.val() == "") {
				$("#result-div").text("이메일을 입력해주세요.").css("display", "block")
						.css("color", "red");
				email.focus();
			} else if (exptext.test($email.val()) == false) {
				// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
				$("#result-div").text("이메일 형식이 올바르지 않습니다.").css("display",
						"block").css("color", "red");
				email.focus();
				return false;
			} else {
				$.ajax({
					type : "post",
					url : "../sign_up/checkEmail",
					data : "email=" + $email.val(),
					dataType : "text",
					success : function(data) {
						if(data == "non_exist"){  
							  // 이메일 발송
								$('#email').toggle('slow');
								$('#email-btn').toggle('slow');
								$('#auth-number').toggle('slow');
								$('#auth-btn').toggle('slow');
							 	$.ajax({
								  type: "get",
								  url: "../mail/signMail",
								  data:"to=" + $email.val(),
								  dataType:"text",
								  success : function(data){
										$('#timer-div').css('display','block').css('color','red');
										  var AuthTimer = new $ComTimer()
										  AuthTimer.comSecond = 180;
										  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
										  AuthTimer.domId = document.getElementById("timer-div");
										  $("#result-div").text("이메일이 발송되었습니다.").css("display",
										  "block").css("color", "green");
										  $('#hidden').text(data);
								  }
							  });
						}else{
							$("#result-div").text("가입된 이메일입니다.").css("display",
							"block").css("color", "red");
						}	
					}
				});

			}
		});

$('#auth-btn').click(function(){
	$('#auth-number').val();
	if($("#result-div").text()=='인증시간이 초과되었습니다.'){
		AuthTimer.set
	}else if($('#auth-number').val()==''){
		$("#result-div").text("인증번호를 입력하세요.").css("color", "red");
	}else if($('#auth-number').val()!=$('#hidden').text()){
		$("#result-div").text("인증번호가 옳지 않습니다.").css("color", "red");
	}else if($('#auth-number').val()==$('#hidden').text()){
		$.ajax({
			type: 'get',
			url: '../sign_up/step2',
			data: "auth="+$('#auth-number').val(),
			success: function(){
				$("#result-div").text("인증완료!").css("color", "blue");
			}
		});
	}
});










