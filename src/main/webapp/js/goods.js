/**goodsDetail.jsp**/
$('nav ul li').click(function(){
	if($(this).index()=='0'){
		$('.discription div').html('<h3>상세내용</h3>');		
	}else if($(this).index()=='1'){
		$('.discription div').load('review.html');
	}else if($(this).index()=='2'){
		$('.discription div').load('delivery_info.html');	
	}
});

let price = $('#goods_price').html();
let amt = $('#quantity').val();
$(document).ready(function(){	
	
	let num = numberFormat(price);
	$('#goods_price').html(num);

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

	// var price = $('#goods_price').html();
	// var amt = $('#quantity').val();
	// var totalPrice = numberFormat(price*amt);
	// $('#tot_price').html(totalPrice).append(' 원');
}

// $('.count').on({
// 	click: function(){
// 		var num = $('#quantity').val();
// 		num++;
// 		$('#quantity').val(num);

// 		var price = $('#goods_price').html();
// 		var num = $('#quantity').val();
// 		var totalPrice = numberFormat(price*num);
// 		$('#tot_price').html(totalPrice);
// 	},
// 	change: function(){
// 		var price = $('#goods_price').html();
// 		var num = $('#quantity').val();
// 		var totalPrice = numberFormat(price*num);
// 		$('#tot_price').html(totalPrice);
// 	}
// }, 'button');

//콤마 찍기
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 }

/************ goodsList.jsp ************/
//장바구니 모달
$('.btn_basket_cart').click(function(){
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

// 버튼 클릭시 해당상품 상세 페이지로 이동
$('.btn_detail_link, .goods-boxs a').click(function(){
	alert('url');
	location.href="goodsDetail.jsp";
});

//
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/dogiver/goods/getGoodsList',
		data: 'pg=${pg}',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
		}
	});
});









	