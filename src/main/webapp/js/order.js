/**
 * 
 */
$(document).ready(function(){
  let checkGoodsArr = $('input[name=checkGoods]');
  let orderList = new Array();
  for(let i = 0; i < checkGoodsArr.length; i++){
	  orderList.push(checkGoodsArr[i].value);
  }
  let url;
  let dataType;
  let data;
  if(checkGoodsArr[0].value == 0){
	  url = '/dogiver/goods/getGoodsDetail';
      data = 'goods_id='+$('#goods_id').val();
      console.log(data);	
  }else{
	  url = '/dogiver/order/getOrderList';
	  data = '{orderList:'+orderList+'}';	
  }
    $.ajax({
      type: 'POST',
      url: url,
      traditional: true,
      data: data,
      dataType: 'json',
      success: function(data){
//    	alert(JSON.stringify(data));
    	  let list;
    	  let tbody = $('.order_table_type tbody:eq(0)');
    	  let tag;
    	  let goodsCount = 0;
    	  let priceSum = 0;
    	  let partner_user_id;
    	  console.log('success');
    	  if(checkGoodsArr[0].value == 0){
    		  let quantity = $('#quantity').val()
    		  list =[
    			  {goods_id: $('#goods_id').val(),  
    			   cart_cnt: quantity,
    			   goods_price: data.goodsDTO.goods_price,
    			   total_price: data.goodsDTO.goods_price*quantity,
    			   goods_name: data.goodsDTO.goods_name,
    			   goods_thumbnail: data.goodsDTO.goods_thumbnail}
    		  ];
    	  }else{
    		  list = data.list;
    	  }
    	  $.each(list, function(index, items){
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
					 + '<td><strong>'+ cashFormat(items.goods_price) + '원</strong></td>'
					 + '<td><strong>'+ cashFormat(items.total_price) + '원</strong></td>'
				   + '</tr>'
		      goodsCount++;
    		  priceSum += items.total_price;	 
    	  }); //each
    	  tbody.append(tag);
    	  console.log(goodsCount);
    	  console.log(priceSum);
    	  $('#form-order tr').eq(1).append(
					'<td rowspan="' + goodsCount
							+ '">배송비<br>2,500원</td>');
    	  let deliveryCharge = 2500;
    	  let totalGoodsPrice = priceSum;
    	  let totalSettlePrice = priceSum+deliveryCharge;
    	  
    	  $('#totalGoodsCnt').text(goodsCount);
    	  $('#totalGoodsPrice').text(cashFormat(totalGoodsPrice));
    	  $('#totalSettlePrice').text(cashFormat(totalSettlePrice));
    	  $('.totalSettlePrice').text(cashFormat(totalSettlePrice));
    	  $('.order_payment_sum').text(cashFormat(totalGoodsPrice)+'원');
    	  $('.totalDeliveryCharge').text(cashFormat(deliveryCharge));
    	  $('input[name=settlePrice]').val(cashFormat(totalSettlePrice));
    	  $('#totalSettlePriceView').text(cashFormat(totalSettlePrice));
    	  
    	  //카카오페이
    	  if(goodsCount>1) item_name +=' 외 '+(goodsCount-1)+'건';
    	  $('input[name=item_name]').val(item_name);
    	  $('input[name=total_amount]').val(priceSum+deliveryCharge);
    	  $('input[name=quantity]').val(goodsCount);
      } //success
    }); // ajax
  
}); //주문 상품 테이블

function cashFormat(number){
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
function numberFormat(cash){
  return Number(cash.replace(/[^0-9]/g, ''));
};

$('#payment_noBook').click(function(){
	$('input[name="order_pay"').val('bank');
});
$('#payment_kakao').click(function(){
	$('input[name="order_pay"').val('kakao');
});


$('.order-buy').on('click', function(){
	if($('#orderName').val() == ''){
		alert('받으실 분 성함을 적어주세요.');
		$('#orderName').focus();
	}else if($('#zipcode').val() ==''){
		alert('받으실 곳 주소를 적어주세요.');
		$('#zipcode').focus();
	}else if($('#mobileNum').val() ==''){
		alert('연락처를 적어주세요.');
		$('#mobileNum').focus();
	}else if($('#member_email').val() ==''){
	alert('연락 받을 이메일을 적어주세요.');
	$('#member_email').focus();
	}else if($('#order_pay').val() ==''){
		alert('결제 방식을 선택해주세요.');
	}else if($('#order_pay').val() == 'bank'){
		if($('#bankSender').val() == ''){
			alert('입금자 명을 적어주세요.');
			$('#bankSender').focus();
		}else if($('#inputState').val() == ''){
			alert('입금하실 은행을 선택해주세요.');
		}
	}else if($('#termAgree_orderCheck').is(":checked")==false){
		alert('청약의사 재확인을 동의해 주셔야 주문을 진행할 수 있습니다.')
	}else{
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
	}
});

$('input[name="email"]').on('focusout', function(){
	$('input[name="partner_user_id"]').val($(this).val());
});

//주문하기
function getNow(){
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	var hour = new String(date.getHours()); 
	var minute = new String(date.getMinutes()); 
	var second = new String(date.getSeconds()); 
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
	return new String(year+month+day+hour+minute+second);
}
function getRandom(){
	var num1 = Math.floor(Math.random() * 9) + 1;
	var num2 = Math.floor(Math.random() * 9) + 1;
	var num3 = Math.floor(Math.random() * 9) + 1;
	var num4 = Math.floor(Math.random() * 9) + 1;
	var randomNum = num1*1000 + num2*100 + num3*10 + num4;
	return new String(randomNum);
}

/** 주소 * */
//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById("layer");

function closeDaumPostcode() {
	element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = ''; 
			var extraAddr = ''; 
			if (data.userSelectedType === 'R') { 
				addr = data.roadAddress;
			} else { 
				addr = data.jibunAddress;
			}
			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("addr").value = extraAddr;

			} else {
				document.getElementById("addr").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById("addr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr_Detail").focus();

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			element_layer.style.display = 'none';
		},
		width : '100%',
		height : '100%',
		maxSuggestItems : 5
	}).embed(element_layer);

	// iframe을 넣은 element를 보이게 한다.
	// element_layer.style.display = 'block';
	$('#layer').toggle();

	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}
//var aa = (document.body.scrollTop + (window.innerHeight/2)) ;
//
//var x = (window.innerWidth - wWwidth) / 2 ;
//var y = (aa - (height / 2));
function initLayerPosition() {
	var width = 400; // 우편번호서비스가 들어갈 element의 width
	var height = 500; // 우편번호서비스가 들어갈 element의 height
	var borderWidth = 4; // 샘플에서 사용하는 border의 두께

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
			+ 'px';
	// element_layer.style.top = (((window.innerHeight ||
	// document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	element_layer.style.top = '60%';
}
/** 주소 * */

