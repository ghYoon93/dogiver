//import {cartSerivce}


var idx = new Array();
var g_id = new Array();
var g_price = new Array();
var g_name = new Array();
var g_img = new Array();
$(document).ready(function(){

	$.ajax({
		type: 'post',
		url: '/goods/getGoodsList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(data.pg);
			//alert(JSON.stringify(data));
			
			var tag = "";
			$.each(data.list, function(index, items){
				//$('#goods_name').text(items.goods_name);
				//alert(items.goods_detail);
				console.log(items.on_sale);
				let goods_price='<span id="goods_price">' + items.price + '</span>원';
				if(items.on_sale=='N') price = '<span id="goods_price">판매가 일시 중지된 상품입니다.</span>';
				if(items.quantity ==0) price = '<span id="goods_price">품절된 상품입니다.</span>';
				
					tag += '<div class="goods-boxs" >'
						+ '<div class="goods-image" >'
						+ '<a href="javascript:void(0)" id="'+items.id+'">'
						+ '<img class="image" src="/resources/img/goods/'+ items.thumbnail +'"/>'
						+ '</a>'
						+ '<div class="hover_bar">'
						+ '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
						+ '<img src="/resources/img/shopping_bucket.png" />'
						+ '</button>'
						+ '<button type="button" class="btn_detail_link" id="'+items.id+'">'
						+ '<img src="/resources/img/search.png" />'
						+ '</button>'
						+ '</div>'
						+ '</div>'
						+ '<div class="goods-content">'
						+ '<a href="javascript:void(0)" onclick="" >'
						+ '<h1 id="goods_name">'+ items.name + '</h1>'
						+ numberFormat(price) 
						+ '</a>'
						+ '</div>'
						+ '</div>';
				
				
				//$('.goods-boxs a').attr('id', items.goods_id);
				//$('.goods-boxs button').attr('id', index);
				//$('.hover_bar .btn_basket_cart').attr('id', index);
				

				idx.push(index);
				g_id.push(items.id);
				g_price.push(items.price);
				g_img.push(items.thumbnail);
				g_name.push(items.name);
				
//				alert(idx[index]);
//				alert(price[index]);
				
			});//each	
			
			$('.goods-frame').append(tag);
	
		}
	});
});

//버튼 클릭시 해당상품 상세 페이지로 이동
$(document).on('click', '.btn_detail_link, .goods-boxs a', function(){
	var id = $(this).attr('id');	
	location.href="goodsDetail?goods_id="+id;
});


/****** 카테고리 정렬 ******/
let category = "";
$('.goods_category li').click(function(){
	category = $(this).attr('value');
	$('.goods-boxs').remove(); //초기화
	
	var tag = "";
	$.ajax({		
		type: 'post',
		url: '/goods/getCategory',
		data: 'category='+category,
		dataType: 'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){

				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="/resources/img/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
				               + '<img src="/resources/img/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" id="'+items.goods_id+'">'
				               + '<img src="/resources/img/search.png" />'
				             + '</button>'
				           + '</div>'
				         + '</div>'
				         + '<div class="goods-content">'
				           + '<a href="javascript:void(0)" onclick="" >'
				             + '<h1 id="goods_name">'+ items.goods_name + '</h1>'
				             + '<span id="goods_price">' + numberFormat(items.goods_price) + '</span>원'
				           + '</a>'
				         + '</div>'
				      + '</div>';
			});//each
			$('.goods-frame').append(tag);
		}
	});
});


/****** 카테고리 정렬 ******/
$('.goods_sort').change(function(){
	//var lineUp = $('.goods_sort option:selected').val();
	var lineUp = $('#goods_sort').val();
	
	$('.goods-boxs').remove(); //초기화
	
	var tag = "";
	/*alert(category+" "+lineUp);*/
	$.ajax({
		type: 'post',
		url: '/goods/goods_lineUp',
		data: {'category' : category,
				'lineUp' : lineUp},		
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){

				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="/resources/img/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
				               + '<img src="/resources/img/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" id="'+items.goods_id+'">'
				               + '<img src="/resources/img/search.png" />'
				             + '</button>'
				           + '</div>'
				         + '</div>'
				         + '<div class="goods-content">'
				           + '<a href="javascript:void(0)" onclick="" >'
				             + '<h1 id="goods_name">'+ items.goods_name + '</h1>'
				             + '<span id="goods_price">' + numberFormat(items.goods_price) + '</span>원'
				           + '</a>'
				         + '</div>'
				      + '</div>';
			});//each
			$('.goods-frame').append(tag);
		}
		
	});
});


/****** 장바구니옵션 모달 ******/
let price="";
let amt = "";
$(document).on('click', '.btn_basket_cart', function(){
	$('#option-view').show();
	$('body').css('overflow','hidden');
	
	let id = $(this).attr('id');
	let goods_id = g_id[id];
	let total = numberFormat(g_price[id]);
	let img = g_img[id];
	let name = g_name[id];
	console.log(img);
	console.log(name);
	
	$('#option-view img').attr('src', '/resources/img/goods/'+img);
	$('#option-view strong').text(name);
	$('#tot_price').text(total).append(' 원');
	
	amt = $('#quantity').val();
	price = total.replace(/[^0-9]/g, '');
	
	$('#confirm').on('click', function(){

		let cart = {
				goods:{goodsId: goods_id},
				cartCnt:amt
		};
		
		cartService.add(cart, function(cartId) {
			
			let msg = '상품을 장바구니에 담았습니다.\n확인하시겠습니까?';
			if(cartId == 0) {
				msg = '동일한 상품이 장바구니에 존재합니다.\n확인하시겠습니까?';
			}
			let result = confirm(msg);
			
			if(result) {
				location.href='../cart';
			}
			
			closeModal();
		});
	}); //장바구니 추가

});
  
$('.close, .cancel').click(closeModal);

$('#quantity').change(function(){
	amt = $('#quantity').val();
	calc_tot_price(price, amt);
});

$('#plus').click(function(){
	amt++;
	$('#quantity').val(amt);
	calc_tot_price(price, amt);
	
});
$('#minus').click(function(){
	if(amt<=1){
		$('#quantity').attr('value', '1');	
	}else {
		amt--;
		$('#quantity').val(amt);
	}
	calc_tot_price(price, amt);
});


function calc_tot_price(price, amt){
	var totalPrice = numberFormat(price*amt);
	$('#tot_price').html(totalPrice).append(' 원');
}

//콤마 찍기
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 }

function closeModal(){
	$('#option-view').hide();
	$('body').css('overflow','auto');
	//초기화
	amt = 1; 
	$('#quantity').val(1);
	calc_tot_price(price, amt);
	$('#confirm').off('click').on('click', function(){
		console.log('confirm');		
	});
} // 모달 닫기

