/*$('.goods-image').mouseover(function(){
	$('.tooltip').append('<img src="">')

});*/
/*
$(document).ready(function(){
	$('#detailPage').click(function(){
		$(location).attr('href', 'goodsDetail.jsp')
	});
});*/
$('nav ul li').click(function(){
	if($(this).index()=='0'){
		$('.discription div').html('<h3>상세내용</h3>');		
	}else if($(this).index()=='1'){
		$('.discription div').load('review.html');
	}else if($(this).index()=='2'){
		$('.discription div').load('delivery_info.html');	
	}
});


$('#quantity').change(function(){
	var price = $('#goods_price').html();
	var num = $('#quantity').val();
	var totalPrice = numberFormat(price*num);
	$('#tot_price').html(totalPrice).append(' 원');	
});

$('#plus').click(function(){
	var num = $('#quantity').val();
	num++;
	$('#quantity').val(num);

	var price = $('#goods_price').html();
	var num = $('#quantity').val();
	var totalPrice = numberFormat(price*num);
	$('#tot_price').html(totalPrice).append(' 원');
	
});
$('#minus').click(function(){
	var num = $('#quantity').val();
	num--;
	if(num<0)
		$('#quantity').attr('value', '0');	
		//return;
	else 
		$('#quantity').val(num);

	var price = $('#goods_price').html();
	var num = $('#quantity').val();
	var totalPrice = numberFormat(price*num);
	$('#tot_price').html(totalPrice).append(' 원');

});

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




	