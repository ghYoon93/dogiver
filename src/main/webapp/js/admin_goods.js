$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/getGoodsList',
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td>',{
					text: items.goods_id
				})).append($('<td>',{
					text: items.category_code
				})).append($('<td>',{
					
				}).append($('<a/>',{
					text: items.goods_name,
					class: 'goodsView',
					id: items.goods_id+""
				}))).append($('<td>',{
					text: items.goods_price
				})).append($('<td>',{
					text: items.goods_date
				})).append($('<td>',{
					text: items.goods_thumbnail
				})).append($('<td>',{
					text: items.goods_amt
				})).append($('<td>',{
					text: items.goods_detail
				})).appendTo('#adminGoodsListTable')
			});//each		
		}//success
	});//ajax
	
	//상세보기
	$(document).on('click', '.goodsView', function(){
		let goods_id = $(this).attr('id');
		$('#goods_id').attr('readonly', 'readonly');
		$.ajax({
			type: 'post',
			url: '/dogiver/goods/getGoodsDetail',
			data: {'goods_id': goods_id},
			dataType: 'json',
			success: function(data){
				$('#goods_id').val(data.goodsDTO.goods_id);
				$('#category_code').val(data.goodsDTO.category_code);
				$('#goods_name').val(data.goodsDTO.goods_name);
				$('#goods_price').val(data.goodsDTO.goods_price);
				$('#goods_date').val(data.goodsDTO.goods_date);
				$('#goods_amt').val(data.goodsDTO.goods_amt);
				$('#goods_thumbnail').html(data.goodsDTO.goods_thumbnail);
				$('#goods_detail').html(data.goodsDTO.goods_detail);
				
			}
		});
	});
	
	//수정하기
	$(document).on('click', '#goodsModify', function(){
		let formData = new FormData($('#goodsForm')[0]);
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/dogiver/goods/goodsModify',
			data: formData,
			dataType: 'json',
			success: function(data){
				$('#goods_id').val(data.goodsDTO.goods_id);
				$('#category_code').val(data.goodsDTO.category_code);
				$('#goods_name').val(data.goodsDTO.goods_name);
				$('#goods_price').val(data.goodsDTO.goods_price);
				$('#goods_date').val(data.goodsDTO.goods_date);
				$('#goods_amt').val(data.goodsDTO.goods_amt);
				$('#goods_thumbnail').html(data.goodsDTO.goods_thumbnail);
				$('#goods_detail').html(data.goodsDTO.goods_detail);
			}		
		});
	});
	
	//새로고침
	$(document).on('click', '#re', function(){
		location.reload();
	});
	
	//등록하기
	$(document).on('click', '#goodsInsert', function(){
		let formData = new FormData($('#goodsForm')[0]);
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/dogiver/goods/goodsInsert',
			data: formData,
			dataType: 'text',
			success: function(data){
				if(data=='success'){
					alert("등록완료");
					location.reload();
				}else{
					alert("등록실패");
				}
			},
			error: function(e){
				alert("error:"+e);
			}
		});
	});
	
	
	
});