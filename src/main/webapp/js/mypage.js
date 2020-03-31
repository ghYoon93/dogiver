$('#pre-modi-btn')
		.click(
				function() {
					if ($('#pre-pwd').val() == '') {
						$('#modi-message-header').text('경고');
						$('#modi-message').text('비밀번호를 입력하세요.');
						$('#modiModal').css('display', 'block');
						window.onclick = function(event) {
							if (event.target == document
									.getElementById('modiModal')) {
								document.getElementById('modiModal').style.display = "none";
							}
						};
					} else {
						$
								.ajax({
									type : "post",
									url : "../my/modiPermit",
									data : "email=" + $('#email').val()
											+ "&pwd=" + $('#pre-pwd').val(),
									dataType : 'json',
									success : function(data) {
										var e = $.Event('keypress');
										e.which = 13; // Enter
										if (data.chkPwd == 'true') {
											$('#pre-pwd-li').hide('slow');
											$('#after').show('fast');
											$('#pre-modi-btn').hide('slow');
											$('#modi-btn').show('fast');
											$('#name').val(data.memberDTO.name);
											$('#nickName').val(
													data.memberDTO.nickName);
											$('#pre-phone').val(
													data.memberDTO.phone);
											$('#pre-phone').trigger("focus")
													.trigger('keyup');
											$('#zipcode').val(
													data.memberDTO.zipcode);
											$('#addr').val(data.memberDTO.addr);
											$('#addr_Detail').val(
													data.memberDTO.addr_Detail);
										} else{
											$('#modi-message-header')
													.text('경고');
											$('#modi-message').text(
													'비밀번호가 맞지 않습니다.');
											$('#modiModal').css('display',
													'block');
											window.onclick = function(event) {
												if (event.target == document
														.getElementById('modiModal')) {
													document
															.getElementById('modiModal').style.display = "none";
												}
											};
										}

									},
									error : function(data) {
										console.log(data);
									}
								});
					}

				});
// 닉네임
$('#nickName')
		.blur(
				function() {
					var nickname = document.getElementById('nickName').value;
					var nickLength = 0;
					var engCheck = /[a-z]/;
					var numCheck = /[0-9]/;
					var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

					for (var i = 0; i < nickname.length; i++) {
						nick = nickname.charAt(i);
						if (escape(nick).length > 4) {
							nickLength += 2;
						} else {
							nickLength += 1;
						}
					}

					if (nickname == null || nickname == "") {
						$('#nickNameDiv').text('닉네임을 입력하세요.').css('color',
								'red').show('fast');
					} else if (nickname.search(/\s/) != -1) {
						$('#nickNameDiv').text('닉네임에 공백이 있습니다.').css('color',
								'red').show('fast');
					} else if (nickLength < 2 || nickLength > 20) {
						$('#nickNameDiv').text(
								'닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.').css(
								'color', 'red').show('fast');
					} else if (specialCheck.test(nickname)) {
						$('#nickNameDiv').text('닉네임에 특수문자가 있습니다.').css('color',
								'red').show('fast');
					} else {
						$
								.ajax({
									type : 'POST',
									url : "../sign_up/chkNickName",
									data : "nickName=" + nickname,
									contentType : "application/x-www-form-urlencoded; charset=UTF-8",
									dataType : 'text',
									success : function(data) {
										if (data == "non_exist") {
											$('#nickNameDiv').text('사용가능.')
													.css('color', 'blue').show(
															'fast');
											setTimeout(function() {
												$("#nickNameDiv").hide(1000);
											}, 1000);
										} else {
											if (data == nickname) {
												return;
											} else {
												$('#nickNameDiv').text(
														'중복된 닉네임입니다.').css(
														'color', 'red').show(
														'fast');
											}
										}
									},
									error : function(err) {
										alert("실행중 오류가 발생하였습니다.");
									}
								});
					}
				});
// 비밀번호 & 재확인
$('#pwd').blur(
		function() {
			var pw = $("#pwd").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if (pw.length < 8 || pw.length > 20) {
				$('#pwdDiv').text('비밀 번호 길이는 8~20자리입니다.').css('color', 'red')
						.show('fast');
				return false;
			} else if (pw.search(/\s/) != -1) {
				$('#pwdDiv').text('비밀번호는 공백 없이 입력해주세요.').css('color', 'red')
						.show('fast');
				return false;
			} else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
					|| (spe < 0 && num < 0)) {
				$('#pwdDiv').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.").css(
						'color', 'red').show('fast');
				return false;
			} else {
				$('#pwdDiv').hide('slow');
			}
		});

$('#rePwd').blur(
		function() {
			var pw = $("#pwd").val();
			var rpw = $("#rePwd").val();
			if (rpw == '') {
				$('#rePwdDiv').text('비밀번호 재확인을 해주세요.').css('color', 'red')
						.show('fast');
				return false;
			} else if (rpw != pw) {
				$('#rePwdDiv').text('비밀번호가 다릅니다.').css('color', 'red').show(
						'fast');
				return false;
			} else {
				$('#rePwdDiv').hide('slow');
			}
		});
// 전화번호
$(function() {
	$('#pre-phone').on('keyup', function(event) {
		var value = $(this).val().replace(/[^0-9]/g, ""), addValue = [];
		value = value.replace(/-/gi, '');

		if (value.length >= 3) {
			if (value.substring(0, 2) == '02') { // 서울 번호를 체크하기 위한 조건
				addValue.push(value.substring(0, 2));
				if (value.length >= 3) {
					var endKey = (value.length >= 10 ? 6 : 5); // 00-000-000,
					// 00-0000-0000
					// 처리
					addValue.push(value.substring(2, endKey));
					if (value.length >= 6) {
						if (value.length >= 10) { // 10자리 이상 입력 방지
							value = value.substring(0, 10);
						}
						addValue.push(value.substring(endKey, value.length));
					}
				}
			} else {
				addValue.push(value.substring(0, 3));
				if (value.length >= 4) {
					var endKey = (value.length >= 11 ? 7 : 6); // 000-000-0000,
					// 000-0000-0000
					// 처리
					addValue.push(value.substring(3, endKey));
					if (value.length >= 7) {
						if (value.length >= 11) { // 11자리 이상 입력 방지
							value = value.substring(0, 11);
						}
						addValue.push(value.substring(endKey, value.length));
					}
				}
			}
			$(this).val(addValue.join('-'));
		}
	});
});
// 전화번호 재 변환
$('#pre-phone').blur(function() {
	var phone = document.getElementById('pre-phone').value.replace(/-/gi, "");
	console.log("변경 " + phone);
	$('#phone').val(phone);
});
// 주소
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById("layer");

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("addr").value = extraAddr;

			} else {
				document.getElementById("addr").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById("addr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr_Detail").focus();

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			element_layer.style.display = 'none';
		},
		width : '100%',
		height : '100%',
		maxSuggestItems : 5
	}).embed(element_layer);

	// iframe을 넣은 element를 보이게 한다.
	// element_layer.style.display = 'block';
	$('#layer').toggle();

	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition() {
	var width = 400; // 우편번호서비스가 들어갈 element의 width
	var height = 500; // 우편번호서비스가 들어갈 element의 height
	var borderWidth = 4; // 샘플에서 사용하는 border의 두께

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
			+ 'px';
	// element_layer.style.top = (((window.innerHeight ||
	// document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	element_layer.style.top = '60%';
}
/** 주소 * */
// 수정
$('#modi-btn')
		.click(
				function() {
					// alert('');
					if ($('#name').val() == '' || $('#id').val() == ''
							|| $('#pwd').val() == '' || $('#rePwd').val() == '') {
						$('#modi-message-header').text('실패');
						$('#modi-message').text('필수 정보를 입력해주세요')
						$('#modiModal').css('display', 'block');
						window.onclick = function(event) {
							if (event.target == document
									.getElementById('modiModal')) {
								document.getElementById('modiModal').style.display = "none";
							}
						};
					} else {
						$
								.ajax({
									type : "post",
									url : "../my/modi",
									data : $('#modi-form').serialize(),
									dataType : 'text',
									success : function(data) {
										if (data == "complete") {
											$('#modi-message-header').text(
													'수정 성공');
											$('#modi-message').text(
													'회원정보를 수정하였습니다.')
											$('#modiModal').css('display',
													'block');
											setTimeout(function() {
												location.reload();
											}, 1000);
										} else {
											$('#modi-message-header').text(
													'수정 실패');
											$('#modi-message').text(
													'다시 시도해 주세요.')
											$('#modiModal').css('display',
													'block');
										}
										window.onclick = function(event) {
											if (event.target == document
													.getElementById('modiModal')) {
												document
														.getElementById('modiModal').style.display = "none";
											}
										};
									},
									error : function(data) {
										alert("에러가 발생했습니다.");
									}
								});
					}
				});
