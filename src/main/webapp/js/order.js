/**
 * 
 */
$(document).ready(function(){
  let checkGoodsArr = $('input[name=checkGoods]');
  console.log(checkGoodsArr[0].value);
  if(checkGoodsArr[0].value == 'buyNow'){

  }else{
	  let orderList = new Array();
	  for(let i = 0; i < checkGoodsArr.length; i++){
		  orderList.push(checkGoodsArr[i].value);
	  }
    $.ajax({
      type: 'POST',
      url: '/dogiver/order/getOrderList',
      traditional: true,
      data: {
        'orderList' : orderList
      },
      dataType: 'json',
      success: function(data){
    	  let tbody = $('.order_table_type tbody:eq(0)');
    	  let tag;
    	  let goodsCount = 0;
    	  let priceSum = 0;
    	  let partner_user_id;
    	  $.each(data.list, function(index, items){
    		  if(index == 0) item_name = items.goods_name;
    		  tag += '<tr>'
                     + '<td class="td_left">'
                       + '<input type="hidden" name="goods_id" value="'+items.goods_id+'">'
                       + '<input type="hidden" name="cart_cnt" value="'+items.cart_cnt+'">'
                       + '<input type="hidden" name="total_price" value="'+items.total_price+'">'
                       + '<div class="cart_goods_cont">'
                         + '<span class="cart_goods_image">'
                           +' <a href="#">'
                             + '<img src="../image/goods/'+items.goods_thumbnail+'"'
                             + 'class="middle" alt="'+ items.goods_name+ '" title="'+ items.goods_name+ '">'
                           + '</a>'
                         + '</span>'
                         + '<div class="cart_goods_info">'
                           + '<em><a href="#">'+ items.goods_name+ '</a></em>'
						 + '</div>'
					   + '</div>'
					 + '</td>'
					 + '<td class=td_order_amount>'
					   + '<div class="cart_goods_num">'
					     + '<strong>'+ items.cart_cnt+ '</strong><font>개</font>'
					   + '</div>'
					 + '</td>'
					 + '<td><strong>'+ items.goods_price+ '원</strong></td>'
					 + '<td><strong>'+ items.total_price+ '원</strong></td>'
				   + '</tr>'
		      goodsCount++;
    		  priceSum += items.total_price;	 
    	  }); //each
    	  console.log(goodsCount);
    	  console.log(priceSum);
    	  tbody.append(tag);
    	  $('#form-cart tr').eq(1).append(
					'<td rowspan="' + goodsCount
							+ '">배송비<br>2,500원</td>');
    	  let deliveryCharge = 2500;
    	  let totalGoodsPrice = numberFormat(priceSum);
    	  let totalSettlePrice = numberFormat(priceSum+deliveryCharge);
    	  
    	  $('#totalGoodsCnt').text(goodsCount);
    	  $('#totalGoodsPrice').text(totalGoodsPrice);
    	  $('#totalSettlePrice').text(totalSettlePrice);
    	  $('.totalSettlePrice').text(totalSettlePrice);
    	  $('.order_payment_sum').text(totalGoodsPrice+'원');
    	  $('.totalDeliveryCharge').text(numberFormat(deliveryCharge));
    	  $('input[name=settlePrice]').val(totalSettlePrice.replace(/[^0-9]/g, ''));
    	  $('#totalSettlePriceView').text(totalSettlePrice);
    	  
    	  //카카오페이
    	  if(goodsCount>1) item_name +=' 외 '+goodsCount+'건';
    	  $('input[name=item_name]').val(item_name);
    	  $('input[name=total_amount]').val(priceSum+deliveryCharge);
    	  $('input[name=quantity]').val(goodsCount);
      } //success
    }); // ajax
  }
}); //주문 상품 테이블

//콤마 찍기
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$('#payment_noBook').click(function(){
	$('input[name="order_pay"').val('bank');
});
$('#payment_kakao').click(function(){
	$('input[name="order_pay"').val('kakao');
});


$('.order-buy').on('click', function(){
	let partner_order_id= getNow()+getRandom();
	console.log(partner_order_id);
    $('input[name=partner_order_id]').val(getNow()+getRandom());
    let popupWidth = 650;
    let popupHeight = 770;
    let popupX = (window.screen.width/2) - (popupWidth/2);
    let popupY = (window.screen.height/2) - (popupHeight/2);
    window.open('','viewer', 'width='+popupWidth+', height='+popupHeight+',  left='+ popupX + ', top='+ popupY);
    let form = document.getElementById('form-order');
    form.target='viewer';
    form.action = 'kakaoPay';
    form.submit();
});
//주문하기
function getNow(){
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	var hour = date.getHours(); 
	var minute = date.getMinutes(); 
	var second = date.getSeconds(); 
	if(month.length == 1){ 
	    month = "0" + month; 
	} 
	if(day.length == 1){ 
	    day = "0" + day; 
	} 
	if(hour.length == 1){ 
		hour = "0" + hour; 
	}
	if(minute.length == 1){ 
		minute = "0" + minute; 
	}
	if(second.length == 1){ 
		second = "0" + second; 
	} 
	return String(year+month+day+hour+minute+second);
}
function getRandom(){
	var num1 = Math.floor(Math.random() * 9) + 1;
	var num2 = Math.floor(Math.random() * 9) + 1;
	var num3 = Math.floor(Math.random() * 9) + 1;
	var num4 = Math.floor(Math.random() * 9) + 1;
	var randomNum = num1*1000 + num2*100 + num3*10 + num4;
	return String(randomNum);
}