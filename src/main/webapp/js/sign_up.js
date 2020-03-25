$(document).ready(function(){
    $("#chkAll").click(function(){
    	var check = $("#chkAll").prop("checked");
    	$("input[type=checkbox]").prop("checked", check);
    })
    $('#btn_1').click(function(){
    	if($("#chk1-1").is(":checked") == true) {
    		var email_Yn = $('input:checkbox[id="chk1-2"]').is(":checked");
    		$.ajax({
    			type: "get",
    			url: "../sign_up/emailYn",
    			data:"email_Yn=" + email_Yn,
    			success: function(){
    				location.href="../sign_up/step2";
    			}
    		});
    	}else if($("#chk1-1").is(":checked") == false){
    		$('#chkModal').css('display','block');
    		window.onclick = function(event) {
    			if (event.target == document.getElementById('chkModal')) {
    				document.getElementById('chkModal').style.display = "none";
    			}
    		};
    	}
    });
})

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modala
if(btn != null){
btn.onclick = function() {
	modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
};
}

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
        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
        this.comSecond--;
        this.domId.innerText = m;
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            $("#result-div").text("인증시간이 초과되었습니다.").css("color", "red");
            $('#timer-div').toggle('slow');
            setTimeout(function() {
            	  location.href="../sign_up/step2";
            	}, 1000);
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
								  data:"to=" + $email.val()+""+"&random="+$('#random').val()+"",
								  success : function(data){
										$('#timer-div').css('display','block').css('color','red');
										var AuthTimer = new $ComTimer()
										  	AuthTimer.comSecond = 180;
										  	AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
										  	AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
										  	AuthTimer.domId = document.getElementById("timer-div");
										
										$("#result-div").text("이메일이 발송되었습니다.").css("display",
										  "block").css("color", "green");
								  },
								  error: function(data){
									  alert("에러가 발생했습니다.");
									  console.log(data);
									  return false;
									  }
							  });
						}else{
							$("#result-div").text("이미 가입된 이메일입니다.").css("display",
							"block").css("color", "red");
						}	
					},
					  error: function(data){
						  alert("에러가 발생했습니다.");
						  console.log(data);
						  return false;
						  }
				});

			}
		});

$('#auth-btn').click(function(){
	$.ajax({
		type:"get",
		url:"../sign_up/authEmail",
		data:"authCode=" + $('#auth-number').val() + "&random=" + $("#random").val(),
		success:function(data){
			if(data=="complete"){
				$('#timer-div').toggle('slow');
				$("#result-div").text("인증성공!").css("display",
				"block").css("color", "blue");
				setTimeout(function() {
					location.href="../sign_up/step3";
				}, 1000);
			}else if(data == "false"){
				$("#result-div").text("잘못된 인증번호입니다.").css("display",
				"block").css("color", "red");
			}
		},
		error:function(data){
			alert("에러가 발생했습니다.");
			}
	});

});










