$(document).ready(function() {
	//리스트 뿌려주기
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/getGoodsList',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td>',{
					text: items.category_code 
				})).append($('<td>',{
					text: items.goods_id
				})).append($('<td>',{
					
					}).append($('<a/>',{
						text: items.goods_name,
						class: 'goodsView',
						id: items.goods_id+""
					}))
				).append($('<td>',{
					text: items.goods_price
				})).append($('<td>',{
					text: items.goods_amt
				})).append($('<td>',{
					text: items.goods_cum_sales
				})).append($('<td>',{
					text: items.goods_date
				})).append($('<td>',{
					text: items.sales_yn
				})).appendTo('#adminGoodsListTable')
			});//each		
		}//success
	});//ajax
	
	//상세보기
	$(document).on('click', '.goodsView', function(){
		let goods_id = $(this).attr('id');
//		$('#goods_id').attr('readonly', 'readonly');
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
				$('#goods_amt').val(data.goodsDTO.goods_amt);
				if(data.goodsDTO.sales_yn == 'Y'){
					$('#sales_y').attr('checked', true);
					$('#sales_n').attr('checked', false);
				}else if(data.goodsDTO.sales_yn == 'N'){
					$('#sales_y').attr('checked', false);
					$('#sales_n').attr('checked', true);
				}
				$('#inputsales_yn').val(data.goodsDTO.sales_yn);
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
				$('#goods_amt').val(data.goodsDTO.goods_amt);
				$('#goods_thumbnail').html(data.goodsDTO.goods_thumbnail);
				$('#goods_detail').html(data.goodsDTO.goods_detail);
				if(data.goodsDTO.sales_yn == 'Y'){
					$('#sales_y').attr('checked', true);
					$('#sales_n').attr('checked', false);
				}else if(data.goodsDTO.sales_yn == 'N'){
					$('#sales_y').attr('checked', false);
					$('#sales_n').attr('checked', true);
				}
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

//체크박스 하나만 선택하게
function oneCheckBox(a){
	var check = document.getElementsByName("sales_yn");
	for(var i=0; i<check.length; i++){
		if(check[i] != a)
			check[i].checked = false;
	}
}