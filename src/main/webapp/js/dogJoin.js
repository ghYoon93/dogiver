
$(document).on('click', '.dogJoinBtn', function(){
  //로그인이 되어있을대 등록
  $('#dogNameDiv').empty();
  $('#dogAgeDiv').empty();
  $('#dogBreedDiv').empty();
  $('#dogWeightDiv').empty();
  
  if($('#dog_name').val()==''){
	  $('#dogNameDiv').text("이름을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
	  
  }else if($('#dog_age').val()==''){
	  $('#dogAgeDiv').text("나이를 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
	  
  }else if($('#dog_breed').val()==''){
	  $('#dogBreedDiv').text("종을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
	  
  }else if($('#dog_weight').val()==''){
	  $('#dogWeightDiv').text("몸무게을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
  }else{
	  $.ajax({
		  type:'post',
		  url: '/dogiver/blood/dogInsert',
		  data: $('#dogJoinForm').serialize(),
		  dataType: 'text',
		  success: function(data){
			  if(data=='1'){
				  alert('등록완료')
				  location.href='/dogiver/blood/dogJoin';
			  }else{
				  alert('다시 등록해주세요')
			  }
		  }
	  });
  }

  //로그인이 안되어있을때 회원가입 요청 팝업
});
