$(function() {
  var breed = ["그레이트 피레니즈",
                "리트리버",
                "말라뮤트",
                "사모예드",
                "진돗개",
                "허스키",
                "저먼 세퍼트 도그",
                "하운드",
                "달마시안",
                "콜리",
                "쉽독",
                "올드 잉글리시 쉽독"];

  $("#dogBreed").autocomplete({
    source: breed,
    select: function(event, ui) {
      console.log(ui.item);
    },
    focus: function(event, ui) {
      return false;
    }
  });
});

$('#dogJoinBtn').click(function( ){
  //로그인이 되어있을대 등록
  $('#dogNameDiv').empty();
  $('#dogAgeDiv').empty();
  $('##dogBreedDiv').empty();
  $('#dogWeightDiv').empty();

  if($('#dogName').val()==''){
	  $('#dogNameDiv').text("이름을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
  }else if($('#dogAge').val()==''){
	  $('#dogAgeDiv').text("나이를 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
  }else if($('#dogBreed').val()==''){
	  $('#dogBreedDiv').text("종을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
  }else if($('#dogWeight').val()==''){
	  $('#dogWeightDiv').text("몸무게을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
  }else{
	  document.dogJoinForm.submit();
  }


  //로그인이 안되어있을때 회원가입 요청 팝업
});
