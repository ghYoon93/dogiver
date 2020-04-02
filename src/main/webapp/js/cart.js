/*
페이지 이동 시 상품 선택 초기 값은 전체 선택
 */
$(document).ready(function() {
					$.ajax({
							type : 'POST',
							url : '/dogiver/order/getCart',
							dataType : 'json',
							success : function(data) {
								if(data.memEmail == null){
									$('.order_wrap').hide();
									$('.need_login').show();
								}else{
									$('.order_wrap').show();
									$('.need_login').hide();
									let tbody = $('#form-cart tbody');
									let tag;
									let trCount = 0;
									$.each(data.list,function(index, items) {
										tag += '<tr>'
											+ '<td class="td_check">'
											+ '<input type="checkbox" id="'+ items.cart_id+ '" name="checkGoods" value="'+ items.cart_id+ '">'
											+ '<label for="'+ items.cart_id+ '">'
											+ '</td>'
											+ '<td class="td_left">'
											+ '<div class="cart_goods_cont">'
											+ '<span class="cart_goods_image">'
											+ '<a href="../goods/goodsDetail?goods_id='+items.goods_id+'">'
											+ '<img src="../image/goods/'+ items.goods_thumbnail+ '" class="middle" alt="'+ items.goods_name+ '" title="'+ items.goods_name+ '">'
											+ '</a>'
											+ '</span>'
											+ '<div class="cart_goods_info">'
											+ '<em><a href="../goods/goodsDetail?goods_id='+items.goods_id+'">'+ items.goods_name+ '</a></em>'
											+ '</div>'
											+ '</div>'
											+ '</td>'
											+ '<td class=td_order_amount>'
											+ '<div class="cart_goods_num">'
											+ '<strong>'+ items.cart_cnt+ '</strong><font>개</font>'
											+ '<div class="btn_option">'
											+ '<button type="button" class="btn_option_view"'
											+ 'data-cartId="'+items.cart_id
											+ '" data-id="'+items.goods_id
											+ '" data-img="'+items.goods_thumbnail
											+ '" data-name="'+items.goods_name
											+ '" data-cnt="'+items.cart_cnt
											+ '" data-price="'+items.goods_price
											+ '" data-total_price="'+items.total_price
											+'">수량 변경</button>'
											+ '</div>'
											+ '</div>'
											+ '</td>'
											+ '<td><strong>'+ cashFormat(items.goods_price)+ '원</strong></td>'
											+ '<td><strong>'+ cashFormat(items.total_price)+ '원</strong></td>'
											+ '</tr>'
											trCount++;
									}); // each
									tbody.append(tag);
									console.log(trCount);
									$('#form-cart tr').eq(1).append('<td rowspan="' + trCount + '" >배송비<br>2,500원</td>');
									checkAll();
									
								}
								} // success
						}); // ajax

			});

function checkAll() {
		$('#check-all').prop('checked', true);
		$('input[name=checkGoods]').prop('checked', true);
		let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
		let checkedCnt = checkedGoods.length;
		let deliveryCharge = 2500;
		console.log('checkedCnt'+checkedCnt);
		if(checkedCnt==0) deliveryCharge = 0;
		let total = calcTot(checkedGoods);
		let totalSettlePrice = total + deliveryCharge;
		$('#totalGoodsCnt').html(cashFormat(checkedCnt));
		$('#totalGoodsPrice').html(cashFormat(total));
		$('#totalSettlePrice').html(cashFormat(total));
		$('#totalDeliveryCharge').html(cashFormat(deliveryCharge));
}
function uncheckAll() {
		$('#check-all').prop('checked', false);
		$('input[name=checkGoods]').prop('checked', false);
		let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
		let checkedCnt = checkedGoods.length;
		let deliveryCharge = 2500;
		if(checkedCnt==0) deliveryCharge = 0;
		let total = calcTot(checkedGoods);
		let totalSettlePrice = total + deliveryCharge;
		$('#totalGoodsCnt').html(cashFormat(checkedCnt));
		$('#totalGoodsPrice').html(cashFormat(total));
		$('#totalSettlePrice').html(cashFormat(total));
		$('#totalDeliveryCharge').html(cashFormat(deliveryCharge));
}

$(document).on('click', '#check-all', function() {
		var chk = $(this).is(":checked");
		if (chk)
			checkAll();
		else
		uncheckAll();
});

$(document).on('click', 'input:checkbox[name=checkGoods]', function() {
		let goodsCnt = $('input:checkbox[name=checkGoods]').length;
		let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
		let checkedCnt = checkedGoods.length;
		if (goodsCnt == checkedCnt) {
			$('#check-all').prop('checked', true);
		} else {
				$('#check-all').prop('checked', false);
		}
		let total = calcTot(checkedGoods);
		let deliveryCharge = 2500;
		let totalSettlePrice = total + deliveryCharge;
		$('#totalGoodsCnt').html(cashFormat(checkedCnt));
		$('#totalGoodsPrice').html(cashFormat(total));
		$('#totalSettlePrice').html(cashFormat(total));
		$('#totalDeliveryCharge').html(cashFormat(deliveryCharge));
});

function calcTot(checkedGoods) {
		let total = 0;
		checkedGoods.each(function(i) {
				let tr = checkedGoods.parent().parent().eq(i);
				let td = tr.children();
				let price = numberFormat(td.eq(4).text());
				total += price;
		});
		return total;
}

/** 수량 변경 **/
$(document).on('click', '.btn_option_view', function() {
		let goods = this;
		let cartId = Number(goods.dataset.cartid);
		let name = goods.dataset.name;
		let img = goods.dataset.img;
		let cnt = Number(goods.dataset.cnt);
		let price = Number(goods.dataset.price);
		let total_price = Number(goods.dataset.total_price);
		console.log(total_price);
		let box = $('#option-view .option_tit_box');
		box.empty();
		//
		let cont = '<form action="updateCart" method="get">' 
			         + '<dl>'
	               + '<dt>'
	                 + '<input type="hidden" name="cart_id" value="'+cartId+'">' 
                   + '<img src="../image/goods/'+img+'" alt="'+name+'" title="'+name+'" class="middle">'
                 + '</dt>'
                 + '<dd>'
                   + '<strong>'+name+'</strong>'
                 + '</dd>'
                 + '<dd>'
                   + '<div class="count">'
                     + '<button type="button" id="minus">-</button>'
                     + '<input type="text" id="quantity" name="cnt" value="'+cnt+'" size="4" />'
                     + '<button type="button" id="plus">+</button>'
                   + '</div>'
                   + '<strong id="tot_price" title="총합계금액">'+total_price+'</strong>'
                 + '</dd>'
                 + '<dd>'
                   + '<button type="button" class="cancel">취소</button>'
                   + '<button type="submit" class="changeCnt">확인</button>'
                 + '</dd>'
               + '</dl>'
               +  '</form>'
               
	box.append(cont);
	$('#option-view').show();
	$('body').css('overflow', 'hidden');
	$(document).on('click', '.close, cancel', closeModal);
	$(document).on('click', '#plus', function(){
		$('#quantity').val(++cnt);
		console.log($('#quantity').val());
		calcPrice();
	});
	
	$(document).on('click', '#minus', function(){
		if($('#quantity').val()>=1){
			$('#quantity').val(--cnt);
			console.log($('#quantity').val());
			calcPrice();
		}
	});
	/*$('#plus').on('click', increaseQTY);
	$('#minus').on('click', decreaseQTY);*/
	$(document).on('change', '#quantity', calcPrice);
	function calcPrice(){
		cnt = $('#quantity').val();
		let total_price = $('#quantity').val() * price;
		console.log(total_price);
		$('#tot_price').text(total_price);
	}
	function closeModal(){
		$('#option-view').hide();
		$('body').css('overflow', 'auto');
	};
	
});

/** 장바구니 선택 프로세스 **/
function gd_cart_process(command){
	let count = $('input[name=checkGoods]:checked').length;
	let form = $('#form-cart');
	if (count == 0){
		alert('선택하신 상품이 없습니다. 상품을 선택해주세요.');
		return false;
	}
	if(command == 'cartDelete'){
		form.attr('action','deleteCart');
		form.submit();
		
	}else if(command == 'orderSelect'){
		let orderGoods = confirm('선택하신 '+count+'개의 상품을 주문하시겠습니까?');
		if(orderGoods){
			form.attr('action','order');
			form.submit();
		}
		
	}
}
function gd_order_all(){
	let form = $('#form-cart');
	checkAll();
	form.attr('action', 'order');
	form.submit();
}
function cashFormat(number){
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
function numberFormat(cash){
  return Number(cash.replace(/[^0-9]/g, ''));
};
