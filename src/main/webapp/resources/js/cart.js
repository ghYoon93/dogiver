jQuery(document).ready(function(){
  /* variable */
  let carts;
  let cart;
  let totalPrice;
  let totalCount;
  let deliveryCharge;

  /* utility method */
  function checkCartCnt() {
    if(cart.cartCnt < 1) {
      cart.cartCnt = 1;
    }
    jQuery('#quantity').val(cart.cartCnt);
  }

  function cashFormat(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  /* DOM method */
  function calcTot() {
    jQuery('#tot_price').text(cashFormat(cart.cartCnt * cart.goods.goodsPrice)+'원');
  }

  function closeModal() {
    jQuery('#option-view').hide();
    jQuery('body').css('overflow','auto');
  }

  function showList() {
    totalPrice = 0;
    totalCount = 0;
    cartService.getList(function(list) {
      carts = list;
      let html = [];
      let h = -1;
      for(let cart, i = -1; cart = carts[++i];){
        html[++h] = '<tr>';
        html[++h] = '<td class="td_check">';
        html[++h] = '<input type="checkbox" id="'+cart.cartId+'" name="goods" value="'+cart.cartId+'">';
        html[++h] = '<label for="'+cart.cartId+'"/>';
        html[++h] = '</td>';
        html[++h] = '<td class="td_left">';
        html[++h] = '<div class="cart_goods_cont">'; 
        html[++h] =  '<span class="cart_goods_image">';
        html[++h] =  '<a href="'+cart.goods.goodsId+'">';
        html[++h] = '<img src="../resources/img/goods/'+cart.goods.goodsThumbnail+'" class="middle" alt="'+cart.goods.goodsName +'" title="'+cart.goods.goodsName+'">';
        html[++h] = '</a>';
        html[++h] = '</span>';
        html[++h] = '<div class="cart_goods_info">';
        html[++h] = '<em><a href="../goods/goodsDetail?goods_id='+cart.goods.goodsId+'">'+cart.goods.goodsName+'</a></em>';
        html[++h] = '</div>';
        html[++h] = '</div>';
        html[++h] = '</td>';
        html[++h] = '<td class=td_order_amount>';
        html[++h] = '<div class="cart_goods_num">';
        html[++h] = '<strong>'+cashFormat(cart.cartCnt)+'</strong><font>개</font>';
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
      jQuery('#cart-table tbody').html(html.join(' '));
      jQuery('#check-all').prop('checked', true).trigger('change');
    });
  }

  function priceSum() {
    let totalSettlePrice = totalPrice + deliveryCharge;
    jQuery('#totalGoodsCnt').html(cashFormat(totalCount));
    jQuery('#totalGoodsPrice').html(cashFormat(totalPrice));
    jQuery('#totalSettlePrice').html(cashFormat(totalSettlePrice));
    jQuery('#totalDeliveryCharge').html(cashFormat(deliveryCharge)); 
  }


  /* event handler */ 
  jQuery('#check-all').change(function() {
    jQuery('input:checkbox[name = "goods"]').prop('checked', this.checked).trigger('change');
  });

  jQuery(document).on('change', 'input:checkbox[name="goods"]', function() {
    let idx = jQuery('input:checkbox[name = "goods"]').index(this);
    cart = carts[idx];
  
    if(this.checked) {
      totalPrice += parseInt(cart.totalPrice);
      totalCount++;
      deliveryCharge = 2500;

      if(totalCount == carts.length) {
        jQuery('#check-all').prop('checked', true);
      }
    }else {
      totalPrice -= parseInt(cart.totalPrice);
      totalCount--;
      jQuery('#check-all').prop('checked', false);

      if(totalCount == 0) {
        deliveryCharge = 0;
      }
    }
    priceSum();
  });

  jQuery(document).on('click','.btn_option_view', function(e) {
    cartService.get(parseInt(this.dataset.cartid), function(result) {
      cart = result;
      jQuery('#option-view').find('input:checkbox[name="cart_id"]').val(cart.cartId);
      jQuery('#option-view').find('img').attr({
        src : '/resources/img/goods/'+cart.goods.goodsThumbnail,
        alt : cart.goods.goodsName,
        title : cart.goods.goodsName
      });
      jQuery('#option-view').find('.goods_name').text(cart.goods.goodsName);
      jQuery('#quantity').val(cart.cartCnt);
      jQuery('#tot_price').text(cashFormat(cart.totalPrice)+'원');
    });

    jQuery('#option-view').show();
    jQuery('body').css('overflow', 'hidden');
  });

  jQuery('.close').on('click', function(e){
    closeModal();
  });

  jQuery('#quantity').on('change', function(e){
    cart.cartCnt = jQuery(this).val();
    checkCartCnt();
    calcTot();
    });

  jQuery('#minus').on('click', function(e){
    cart.cartCnt--;
    checkCartCnt();
    calcTot();
  });

  jQuery('#plus').on('click', function(e) {
    cart.cartCnt++;
    checkCartCnt();
    calcTot();
  });

  jQuery('.cancel').on('click', function(e){
    closeModal();
  });

  jQuery('.changeCnt').click(function(e) {
    cartService.update(cart);
    closeModal();
    showList();
  });

  jQuery('#btnDelete').on('click', function(e) {
		let count = jQuery('input[name=goods]:checked').length;
		if (count == 0) {
			alert('선택하신 상품이 없습니다. 상품을 선택해주세요.');
			return false;
		}

		if(confirm('선택하신 '+count+'개의 상품을 삭제하시겠습니까?')) {
			alert('cartService.delete');
			let checkGoods = jQuery('input[name=goods]:checked');
			let cartIds = [];
			checkGoods.each(function(e) {
			  cartIds.push(parseInt(this.value));
			});
			cartService.remove(cartIds, function(e){
			  showList();
			});
		}
	}); // delete Cart

	jQuery('#btnLinkShopping').on('click', function(e){
		jQuery(location).attr('href', '/goods/goodsList');
	});  // link shopping

  jQuery('#btnOrderSelected').on('click', function(e){
    alert('order chosen goods');
	}); // order chosen cart

	jQuery('#btnOrderWhole').on('click', function(e){
		alert('order whole goods');
	});
/* public method */
  showList();
});