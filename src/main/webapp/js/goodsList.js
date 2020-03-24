/************ goodsList.jsp ************/
//장바구니 모달
$(document).on('click', '.btn_basket_cart', function(){
	$('#option-view').show();
	$('body').css('overflow','hidden');
});
  
$('.close, .cancle').click(function(){	
	$('#option-view').hide();
	$('body').css('overflow','auto');
	//초기화
	amt = 1; 
	$('#quantity').val(1);
	calc_tot_price(price, amt);
});



//
$(document).ready(function(){

	$.ajax({
		type: 'post',
		url: '/dogiver/goods/getGoodsList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(data.pg);
			//alert(JSON.stringify(data));
			
			var tag = "";
			$.each(data.list, function(index, items){
				//$('#goods_name').text(items.goods_name);
				//alert(items.goods_id);
				
				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="../image/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" href="#">'
				               + '<img src="../image/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" >'
				               + '<img src="../image/search.png" />'
				             + '</button>'
				           + '</div>'
				         + '</div>'
				         + '<div class="goods-content">'
				           + '<a href="javascript:void(0)" onclick="" >'
				             + '<h1 id="goods_name">'+ items.goods_name + '</h1>'
				             + '<span id="goods_price">' + items.goods_price + '</span>원'
				           + '</a>'
				         + '</div>'
				      + '</div>';
				
				$('.goods-boxs a').attr('id', items.goods_id);
				
			});//each	
			
			
			$('.goods-frame').append(tag);
			
//			$('.goods-boxs a').click(function(){
//				alert($(this).attr('id'));
//				location.href="goodsDetail";
//			});
			
			
		}
	});
	
});

//버튼 클릭시 해당상품 상세 페이지로 이동 ...안된당....
$(document).on('click', '.btn_detail_link, .goods-boxs a', function(){
	//alert($(this).attr('id'));
	location.href="goodsDetail";
	
	$.ajax({	
		type: 'post',
		url: '/dogiver/goods/getGoodsDetail',
		data: 'goods_id='+$(this).attr('id'),
		dataType: 'json',
		success: function(data){
			alert(data.goodsDTO.goods_id);
		},
		error: function(error){
			alert("error:"+error);
		}
		
	});
});