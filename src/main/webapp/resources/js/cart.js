jQuery(document).ready(function(){
  /* variable */
  let cartItems;
  let cartItem;
  let totalPrice;
  let totalCount;
  let deliveryCharge;

  /* utility method */
  function checkCartCnt() {
    if(cartItem.quantity < 1) {
      cartItem.quantity = 1;
    }
    jQuery('#quantity').val(cartItem.quantity);
  }

  function cashFormat(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  /* DOM method */
  function calcTot() {
    jQuery('#tot_price').text(cashFormat(cartItem.quantity * cartItem.price)+'원');
  }

  function closeModal() {
    jQuery('#option-view').hide();
    jQuery('body').css('overflow','auto');
  }

  function showList() {
    totalPrice = 0;
    totalCount = 0;
    cartService.getList(function(list) {
      cartItems = list;
      let html = [];
      let h = -1;
      for(let cartItem, i = -1; cartItem = cartItems[++i];){
        html[++h] = '<tr>';
        html[++h] = '<td class="td_check">';
        html[++h] = '<input type="checkbox" id="'+cartItem.id+'" name="goods" value="'+cartItem.id+'">';
        html[++h] = '<label for="'+cartItem.id+'"/>';
        html[++h] = '</td>';
        html[++h] = '<td class="td_left">';
        html[++h] = '<div class="cart_goods_cont">'; 
        html[++h] =  '<span class="cart_goods_image">';
        html[++h] =  '<a href="'+cartItem.goodsId+'">';
        html[++h] = '<img src="../resources/img/goods/'+cartItem.thumbnail+'" class="middle" alt="'+cartItem.name +'" title="'+cartItem.name+'">';
        html[++h] = '</a>';
        html[++h] = '</span>';
        html[++h] = '<div class="cart_goods_info">';
        html[++h] = '<em><a href="../goods/goodsDetail?goods_id='+cartItem.goodsId+'">'+cartItem.name+'</a></em>';
        html[++h] = '</div>';
        html[++h] = '</div>';
        html[++h] = '</td>';
        html[++h] = '<td class=td_order_amount>';
        html[++h] = '<div class="cart_goods_num">';
        html[++h] = '<strong>'+cashFormat(cartItem.quantity)+'</strong><font>개</font>';
        html[++h] = '<div class="btn_option">';
        html[++h] = '<button type="button" class="btn_option_view"';
        html[++h] = 'data-cartId="'+cartItem.id+'"';
        html[++h] = 'data-id="'+cartItem.goodsId+'"';
        html[++h] = 'data-img="'+cartItem.thumbnail+'"';
        html[++h] = 'data-name="'+cartItem.name+'"';
        html[++h] = 'data-cnt="'+cartItem.quantity+'"';
        html[++h] = 'data-price="'+cartItem.price+'"';
        html[++h] = 'data-total_price="'+cartItem.totalPrice+'">';
        html[++h] = '수량 변경</button>';
        html[++h] = '</div>';
        html[++h] = '</div>';
        html[++h] = '</td>';
        html[++h] = '<td><strong>'+ cashFormat(cartItem.price)+'원</strong></td>';
        html[++h] = '<td><strong>'+ cashFormat(cartItem.totalPrice)+'원</strong></td>';
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
    cartItem = cartItems[idx];
  
    if(this.checked) {
      totalPrice += parseInt(cartItem.totalPrice);
      totalCount++;
      deliveryCharge = 2500;

      if(totalCount == cartItems.length) {
        jQuery('#check-all').prop('checked', true);
      }
    }else {
      totalPrice -= parseInt(cartItem.totalPrice);
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
      jQuery('#option-view').find('input:checkbox[name="cart_id"]').val(cartItem.id);
      jQuery('#option-view').find('img').attr({
        src : '/resources/img/goods/'+cartItem.thumbnail,
        alt : cartItem.name,
        title : cartItem.name
      });
      jQuery('#option-view').find('.goods_name').text(cartItem.name);
      jQuery('#quantity').val(cartItem.quantity);
      jQuery('#tot_price').text(cashFormat(cartItem.totalPrice)+'원');
    });

    jQuery('#option-view').show();
    jQuery('body').css('overflow', 'hidden');
  });

  jQuery('.close').on('click', function(e){
    closeModal();
  });

  jQuery('#quantity').on('change', function(e){
    cartItem.quantity = jQuery(this).val();
    checkCartCnt();
    calcTot();
    });

  jQuery('#minus').on('click', function(e){
    cartItem.quantity--;
    checkCartCnt();
    calcTot();
  });

  jQuery('#plus').on('click', function(e) {
    cartItem.quantity++;
    checkCartCnt();
    calcTot();
  });

  jQuery('.cancel').on('click', function(e){
    closeModal();
  });

  jQuery('.changeCnt').click(function(e) {
    cartService.update(cartItem);
    closeModal();
    showList();
  });

  jQuery('#btnDelete').on('click', function(e) {
		const checkGoods = jQuery('input[name=goods]:checked');
		const count = checkGoods.length;
		if (count == 0) {
			alert('선택하신 상품이 없습니다. 상품을 선택해주세요.');
			return false;
		}

		if(confirm('선택하신 '+count+'개의 상품을 삭제하시겠습니까?')) {
			let cartIds = [];
			checkGoods.each(function() {
				cartIds.push(this.value);
			});
			console.log(cartIds);
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