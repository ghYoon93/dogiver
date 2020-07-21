$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/blood/getMyblood',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data.dogJoinDTO));
			if(data.dogJoinDTO==null){
				alert("헌혈견을 등록해주세요");
			}else{
				$('#dog_name').val(data.dogJoinDTO.dog_name);
				$('#dog_age').val(data.dogJoinDTO.dog_age);
				$('#dog_breed').val(data.dogJoinDTO.dog_breed);
				$('#dog_weight').val(data.dogJoinDTO.dog_weight);
				$('#dog_bloodType').val(data.dogJoinDTO.dog_bloodType);
				$('#apply_status').val(data.dogJoinDTO.apply_status);
				$('#email').val(data.dogJoinDTO.email);
			}
		}
	});//ajax
	
	$('.dogModifyBtn').on('click', function(){
		  $('#dogNameDiv').empty();
		  $('#dogAgeDiv').empty();
		  $('#dogBreedDiv').empty();
		  $('#dogWeightDiv').empty();
		  $('#dogBloodTypeDiv').empty();
		  
		  if($('#dog_name').val()==''){
			  $('#dogNameDiv').text("이름을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
			  
		  }else if($('#dog_age').val()==''){
			  $('#dogAgeDiv').text("나이를 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
			  
		  }else if($('#dog_breed').val()==''){
			  $('#dogBreedDiv').text("종을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
			  
		  }else if($('#dog_weight').val()==''){
			  $('#dogWeightDiv').text("몸무게을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
		  
		  }else if($('#dog_bloodType').val()==''){
			  $('#dogBloodTypeDiv').text("혈액형을 입력해주세요").css("color","red").css("font-size","10pt").css("font-weight", "bold");
		  
		  }else{
			  
			  document.mybloodForm.submit();
			  alert("반려견 정보 수정완료");
			  location.href='../blood/myblood';
			  
		  }
		
	});
	
	
});