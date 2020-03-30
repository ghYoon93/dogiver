$(document).on('click','#bloodNowBtn', function(){

	if($('#memEmail').val()==''){		
		location.href='/dogiver/login/login';
		
	}else{
		location.href='/dogiver/blood/dogJoin';
	}
	
});

