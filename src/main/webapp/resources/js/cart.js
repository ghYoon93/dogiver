/*
페이지 이동 시 상품 선택 초기 값은 전체 선택
 */
$(document).ready(function() {
	let body = $('body');
	let tbody = $('#cart-table tbody');
	showList();
	
	function showList() {	
		cartService.getList(function(list){
			
			let html = [];
			let h = -1;
			for(let cart, i = -1; cart = list[++i];){
				html[++h] = '<tr>';
				html[++h] = '<td class="td_check">';
				html[++h] = '<input type="checkbox" id="'+cart.cartId+'" name="checkGoods" value="'+cart.cartId+'">';
				html[++h] = '<label for="'+cart.cartId+'">';
				html[++h] = '</td>';
				html[++h] = '<td class="td_left">';
				html[++h] = '<div class="cart_goods_cont">'; 
				html[++h] =  '<span class="cart_goods_image">';
				html[++h] =  '<a href="'+cart.goods.goodsId+'">';
				html[++h] = '<img src="../resources/img/goods/'+cart.goods.goodsThumbnail+'" class="middle" alt="${cart.goods.goodsName }" title="'+cart.goods.goodsName+'">';
				html[++h] = '</a>';
				html[++h] = '</span>';
				html[++h] = '<div class="cart_goods_info">';
				html[++h] = '<em><a href="../goods/goodsDetail?goods_id='+cart.goods.goodsId+'">'+cart.goods.goodsName+'</a></em>';
				html[++h] = '</div>';
				html[++h] = '</div>';
				html[++h] = '</td>';
				html[++h] = '<td class=td_order_amount>';
				html[++h] = '<div class="cart_goods_num">';
				html[++h] = '<strong>'+cart.cartCnt+'</strong><font>개</font>';
				html[++h] = '<div class="btn_option">';
				html[++h] = '<button type="button" class="btn_option_view"';
				html[++h] = 'data-cartId="'+cart.cartId+'"';
				html[++h] = 'data-id="'+cart.goods.goodsId+'"';
				html[++h] = 'data-img="'+cart.goods.goodsThumbnail+'"';
				html[++h] = 'data-name="'+cart.goods.goodsName+'"';
				html[++h] = 'data-cnt="'+cart.cartCnt+'"';
				html[++h] = 'data-price="'+cart.goods.goodsPrice+'"';
				html[++h] = 'data-total_price="'+cart.totalPrice+'">';
				html[++h] = '수량 변경</button>';
				html[++h] = '</div>';
				html[++h] = '</div>';
				html[++h] = '</td>';
				html[++h] = '<td><strong>'+ cashFormat(cart.goods.goodsPrice)+'원</strong></td>';
				html[++h] = '<td><strong>'+ cashFormat(cart.totalPrice)+'원</strong></td>';
				html[++h] = '</tr>';
			}
			tbody.html(html.join(' '));
			
			checkAll();
		});
		
	} // showList()
	
	$(document).on('click','input:checkbox[name=checkGoods]', function() {
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
		if(checkedCnt == 0) deliveryCharge = 0;
		let totalSettlePrice = total + deliveryCharge;
		$('#totalGoodsCnt').html(cashFormat(checkedCnt));
		$('#totalGoodsPrice').html(cashFormat(total));
		$('#totalSettlePrice').html(cashFormat(totalSettlePrice));
		$('#totalDeliveryCharge').html(cashFormat(deliveryCharge));
    });  // checkbox event

	$('#check-all').on('click', function() {
		let isChecked = $(this).is(":checked");
		if (isChecked)
			checkAll();
		else
			uncheckAll();
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
		$('#totalSettlePrice').html(cashFormat(totalSettlePrice));
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
    $(document).on('click','.btn_option_view', function(e) {
    	let optionView = $('#option-view');
    	
	    let goods = this;
	    let cartId = Number(goods.dataset.cartid);
	    let goodsPrice;
	    let quantity;
	    
	    let optionViewInputCartId = optionView.find("input[name='cart_id']");
	    let optionViewImg = optionView.find('img');
	    let optionViewStrongGoodsName = optionView.find('.goods_name');
	    let optionViewInputQuantity = optionView.find('#quantity');
	    let optionViewStrongTotalPrice = optionView.find('#tot_price');
		
		cartService.get(cartId, function(cart) {
			goodsPrice = cart.goods.goodsPrice;
			quantity = cart.cartCnt;
			optionViewInputCartId.val(cart.cartId);
			optionViewImg.attr({
				src : '/resources/img/goods/'+cart.goods.goodsThumbnail,
				alt : cart.goods.goodsName,
				title : cart.goods.goodsName,
				
			});
			optionViewStrongGoodsName.text(cart.goods.goodsName);
			optionViewInputQuantity.val(quantity);
			optionViewStrongTotalPrice.text(cashFormat(cart.totalPrice)+'원');
		});
		
	    optionView.show();
	    body.css('overflow', 'hidden');
	    
	    $('.close').on('click', function(e) {
	    	optionView.hide();
	    	body.css('overflow', 'auto');
	    });
	    
	    optionViewInputQuantity.on('change', function(e){
	    	quantity = optionViewInputQuantity.val();
	    	if(quantity < 1){
				quantity = 1;
				optionViewInputQuantity.val(quantity);
			}
			let totalPrice = quantity * goodsPrice;
			optionViewStrongTotalPrice.text(cashFormat(totalPrice)+'원');
	    });
	    
	    $('#minus').off().on('click', function(e){
	    	quantity--;
			if(quantity < 1){
				quantity = 1;
			}
			optionViewInputQuantity.val(quantity);
			let totalPrice = quantity * goodsPrice;
			optionViewStrongTotalPrice.text(cashFormat(totalPrice)+'원');
//				calcPrice();
		}); // minus event
	    
	    $('#plus').off().on('click', function(e) {
	    	quantity++;
	    	optionViewInputQuantity.val(quantity);
	    	let totalPrice = quantity * goodsPrice;
			optionViewStrongTotalPrice.text(cashFormat(totalPrice)+'원');
	    }); // plus event
	    
	    $('.cancel').on('click', function(e) {
	    	optionView.hide();
	    	body.css('overflow', 'auto');
	    }); // cancel event
	    
	    $('.changeCnt').on('click', function(e) {
	    	let cart = {
	    			cartId: cartId,
	    			cartCnt: quantity
	    	}
	    	cartService.update(cart, function(result) {
	    		optionView.hide();
	    		body.css('overflow', 'auto');
	    		showList();
	    	});
	    }) // changeCnt event

	    
	
	
});	
//$(document).on('change', '#quantity', calcPrice);
//	
//function calcPrice(){
//	let cnt = $('#quantity').val();
//	if(cnt < 1){
//		alert('최소 변경 가능 수량은 1개입니다.');
//		$('#quantity').val(1);
//	}
//	let total_price = $('#quantity').val() * goodsPrice;
//	$('#tot_price').text(cashFormat(total_price)+'원');
//}
function closeModal(){
	$('#option-view').hide();
	$('body').css('overflow', 'auto');
};
	
	/** 장바구니 선택 프로세스 **/
	function gd_cart_process(command){
		let count = $('input[name=checkGoods]:checked').length;
		let form = $('#form-cart');
		if (count == 0){
			alert('선택하신 상품이 없습니다. 상품을 선택해주세요.');
			return false;
		}
		if(command == 'cartDelete'){
			let deleteCart = confirm('선택하신 '+count+'개의 상품을 삭제하시겠습니까?');
			if(deleteCart){
				form.attr('action','deleteCart');
				form.submit();
			}
			
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
	}
	function numberFormat(cash){
	  return Number(cash.replace(/[^0-9]/g, ''));
	}

  $(document).on('keyup','#quantity', function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
  });  //
	
	


});