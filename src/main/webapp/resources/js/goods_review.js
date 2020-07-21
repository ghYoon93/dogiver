$('textarea').keydown(function(){
	var length = $(this).val().length;
	
	$('.writeArea').html(length+'/500'); //선택한 요소 안의 내용을 가져오거나 다른 내용으로 바꿈
	if(length>500)
		$('.writeArea').css('color', 'red');
	else
		$('.writeArea').css('color', 'blue');
});

$('#reviewWriteBtn').click(function(){
	$('.reviewTextDiv').empty();
	
	if($('.text_content').val()==''){
		$('.reviewTextDiv').text('리뷰를 작성해 주세요').css('color', 'red').css('font-size', '10pt').css('font-weight', 'bold');
	}else{
		//document.forms[0].submit();
		var formData = new FormData($('#reviewWriteForm')[0]);
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/goods/reviewWrite',
			data: formData,
			success: function(){
//				alert('리뷰 등록 완료');
				//$('#reviewList tr:gt(0)', opener.document).remove();

				
				$.ajax({	
					type: 'post',
					url: '/goods/getGoodsReviewList',
					data: 'goods_id='+$('#goods_id').val(),
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",

					success: function(data){ 	
						//alert(JSON.stringify(data));
						
						var tag = "";
						$.each(data.list, function(index, items){
							tag += '<tr>'
								+ '<td class="reviewView" width="65%" style="cursor: pointer;" onclick="reviewViewWin('+ items.bo_seq +')">'+ items.text_content+'</td>'
								+ '<td width="10%" style="text-align:center;">'+items.nickname+'</td>'
								+ '<td width="25%" style="text-align:center;">'+ items.board_date+'</td>'
								+ '</tr>';
						});//each
						
						//부모창에 데이터 뿌려주기
						$('#reviewList tr:gt(0)', opener.document).remove();
						$('#reviewList', opener.document).append(tag);
						
						window.self.close();
					}
				});
			}
		
		});
	}
});

$(document).ready(function(){
	$.ajax({	
		type: 'post',
		url: '/goods/getGoodsReviewList',
		data: 'goods_id='+$('#goods_id').val(),
		dataType: 'json',
		success: function(data){ 	
			//alert(JSON.stringify(data));
			
			var tag = "";
			$.each(data.list, function(index, items){
				tag += '<tr>'
			        	+ '<td class="reviewView" width="65%" style="cursor: pointer;" onclick="reviewViewWin('+ items.bo_seq +')">'+ items.text_content+'</td>'
			        	+ '<td width="10%" style="text-align:center;">'+items.nickname+'</td>'
			        	+ '<td width="25%" style="text-align:center;">'+ items.board_date+'</td>'
			         + '</tr>';
			});//each
			
			$('.reviewList').append(tag);
		}
	});
});

//작성된 상품후기 창 띄우기
function reviewViewWin(bo_seq){
	window.open('/dogiver/goods/reviewViewWin?bo_seq='+bo_seq, '', 'width=700 height=400 scrollbars=yes');
}


