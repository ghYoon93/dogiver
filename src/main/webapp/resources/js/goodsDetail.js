//$('nav ul li').click(function(){
//	if($(this).index()=='0'){
//		$('.discription div').html(detail_image).css('text-align', 'center');		
//	}else if($(this).index()=='1'){
//		//$('.discription div').load('review');
//		$('.discription div').load('qna?goods_id='+$('#goods_id').val());
//	}else if($(this).index()=='2'){
//		$('.discription div').load('review?goods_id='+$('#goods_id').val());	
//	}else if($(this).index()=='3'){
//		$('.discription div').load('../etc/delivery_info.html').css('text-align', 'left');	
//	}
//});
function getContentTab(index){
	let url;
	if(index==1){
		url = $('.discription div').html(detail_image).css('text-align', 'center');	
	}
	else if(index==2){
		url='qna?goods_id='+$('#goods_id').val();
	}
	else if(index==3){
		url='review?goods_id='+$('#goods_id').val();
	}
	else if(index==4){
		url=$('.discription div').load('../static/delivery_info.html').css('text-align', 'left');
	}

	$.get(url, null, function(result){
		$('.discription div').empty();
		console.log(result);
		$('.discription div').append(result); //해당 div에 결과가 나타남
	});
}

let price="";
var amt = "";
var detail_image = "";
$(document).ready(function(){	
	//해당 상품 Detail페이지 뿌려주기
	//alert($('#goods_id').val());
	var tag="";
	$.ajax({	
		type: 'post',
		url: '/goods/getGoodsDetail',
		data: 'goods_id='+$('#goods_id').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));

			tag += '<div class="overview-image"><img src="/resources/img/goods/'+ data.goodsDTO.thumbnail +'"></div>'
					+ '<div class="overview-content">'
						+'<h1 id="goods_name" >'+ data.goodsDTO.name +'</h1>'			
						+'<div>'
							+'<span>판매가</span>'
							+'<span id="goods_price">'+ data.goodsDTO.price +'</span>'	
						+'</div>'
						
						+'<div class="delivery-fee" style="margin:20px 0; text-align: right">'
							+'<span>배송비</span>'
							+'<span>2500원</span>'
						+'</div>'
						
						+'<div class="option-wrap">'
							+'<span class="goods-name">'+ data.goodsDTO.name +'<br><br></span>'
							+'<div class="amount-wrap">'
								+'<div class="count">'
									+'<button id="minus">-</button>'
									+'<input type="text" id="quantity" value="1" size="4" >'
									+'<button id="plus">+</button>'
								+'</div>'
								+'<strong id="tot_price" title="총합계금액"></strong>'
							+'</div>'
						+'</div>'
						
						+'<div class="btn_form">'
							+'<button id="btn-cart">장바구니</button>'
							+'<button id="btn-order">구매하기</button>'
						+'</div>'
					+'</div>';
			
			detail_image = '<img src="/resources/img/goods/'+ data.goodsDTO.detail +'" >'; 
			
			$('.overview').append(tag);
			$('.discription div').append(detail_image).css('text-align', 'center');
			
			
			price = data.goodsDTO.price;
			amt = $('#quantity').val();
			
			let num = numberFormat(price);
			$('#goods_price').html(num);

			calc_tot_price(price, amt);
			
		},
		error: function(error){
			alert("error:"+error);
		}
		
	});
	
});


$(document).on('change', '#quantity', function(){
	amt = $('#quantity').val();
	calc_tot_price(price, amt);
});
$(document).on('click', '#plus', function(){
	amt++;
	$('#quantity').val(amt);
	calc_tot_price(price, amt);
});
$(document).on('click', '#minus', function(){
	if(amt<=1){
		$('#quantity').attr('value', '1');	
	}else {
		amt--;
		$('#quantity').val(amt);
	}
	calc_tot_price(price, amt);
});

/*바로 구매하기*/
$(document).on('click','#btn-order', function(){
	
	let goods_id = $('#goods_id').val();
	let quantity = $('#quantity').val();
	console.log($('#goods_id').val());
	console.log($('#quantity').val());
	location.href='../order/order?goods_id='+goods_id+'&quantity='+quantity;
});

/*장바구니 추가하기*/
$(document).on('click','#btn-cart', function(){
	
	let goodsId = $('#goods_id').val();
	let quantity = $('#quantity').val();
	
	let cartItem = {
			"goodsId":goodsId,
			"quantity":quantity
	};
	
	cartItemService.add(cartItem, function(id) {
		
		let msg = '상품을 장바구니에 담았습니다.\n확인하시겠습니까?';
		if(id == 0) {
			msg = '동일한 상품이 장바구니에 존재합니다.\n확인하시겠습니까?';
		}
		let result = confirm(msg);
		
		if(result) {
			location.href='../cart';
		}
		
		closeModal();
	});
});
//$('#quantity').change(function(){
//	amt = $('#quantity').val();
//	calc_tot_price(price, amt);
//});
//$('#plus').click(function(){
//	amt++;
//	$('#quantity').val(amt);
//	calc_tot_price(price, amt);
//});
//$('#minus').click(function(){
//	if(amt<=1){
//		$('#quantity').attr('value', '1');	
//	}else {
//		amt--;
//		$('#quantity').val(amt);
//	}
//	calc_tot_price(price, amt);
//});

function calc_tot_price(price, amt){
	var totalPrice = numberFormat(price*amt);
	$('#tot_price').html(totalPrice).append(' 원');
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



//상품후기 창 띄우기
function reviewWriteWin(goods_id){
	$.ajax({
		type : 'POST',
		url : "../order/chkOrder",
		data : "goods_id=" + $('#goods_id').val(),
		success : function(data) {
			if (data == 0) {
				alert('상품을 구매한 회원만 작성 가능합니다');
			} else {
				window.open('/dogiver/goods/reviewWriteWin?goods_id='+goods_id, '', 'width=700 height=400 scrollbars=yes');
			}
		}
	});
	
}





	