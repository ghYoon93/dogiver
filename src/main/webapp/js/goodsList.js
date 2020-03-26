
var idx = new Array();
var g_price = new Array();
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
				//alert(items.goods_detail);
				
				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="../image/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
				               + '<img src="../image/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" id="'+items.goods_id+'">'
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
				
				
				//$('.goods-boxs a').attr('id', items.goods_id);
				//$('.goods-boxs button').attr('id', index);
				//$('.hover_bar .btn_basket_cart').attr('id', index);
				

				idx.push(index);
				g_price.push(items.goods_price);
				
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
var category = "";
$('.goods_category li').click(function(){
	category = $(this).attr('value');
	$('.goods-boxs').remove(); //초기화
	
	var tag = "";
	$.ajax({		
		type: 'post',
		url: '/dogiver/goods/getCategory',
		data: 'category='+category,
		dataType: 'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){

				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="../image/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
				               + '<img src="../image/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" id="'+items.goods_id+'">'
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
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/goods_lineUp',
		data: 'lineUp='+lineUp,
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){

				tag += '<div class="goods-boxs" >'
				         + '<div class="goods-image" >'
				           + '<a href="javascript:void(0)" id="'+items.goods_id+'">'
				             + '<img class="image" src="../image/goods/'+ items.goods_thumbnail +'"/>'
				           + '</a>'
				           + '<div class="hover_bar">'
				             + '<button type="button" class="btn_basket_cart" id="'+index+'" href="#">'
				               + '<img src="../image/shopping_bucket.png" />'
				             + '</button>'
				             + '<button type="button" class="btn_detail_link" id="'+items.goods_id+'">'
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
	
	var id = $(this).attr('id');
	var total = g_price[id];
	$('#tot_price').text(total).append(' 원');
	
	amt = $('#quantity').val();
	price = total;

});
  
$('.close, .cancle').click(function(){	
	$('#option-view').hide();
	$('body').css('overflow','auto');
	//초기화
	amt = 1; 
	$('#quantity').val(1);
	calc_tot_price(price, amt);
});

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


