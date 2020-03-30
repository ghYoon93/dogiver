/*
페이지 이동 시 상품 선택 초기 값은 전체 선택
 */
$(document).ready(function() {
					$.ajax({
							type : 'POST',
							url : '/dogiver/order/getCart',
							dataType : 'json',
							success : function(data) {
								let tbody = $('#form-cart tbody');
								let tag;
								let trCount = 0;
								$.each(data.list,function(index, items) {
													tag += '<tr>'
															/*+ '<input type=hidden class="goods_id" value="'+ items.goods_id+ '">'*/
															+ '<td class="td_check">'
															  + '<input type="checkbox" id="'+ items.cart_id+ '" name="checkGoods" value="'+ items.cart_id+ '">'
															+ '</td>'
															+ '<td class="td_left">'
															  + '<div class="cart_goods_cont">'
															    + '<span class="cart_goods_image">'
															      + '<a href="#">'
															        + '<img src="../image/goods/'+ items.goods_thumbnail+ '" class="middle" alt="'+ items.goods_name+ '" title="'+ items.goods_name+ '">'
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
															+ '<td><strong>'+ items.goods_price+ '원</strong></td>'
															+ '<td><strong>'+ items.total_price+ '원</strong></td>'
															+ '</tr>'
												trCount++;
												}); // each
									tbody.append(tag);
									console.log(trCount);
								$('#form-cart tr').eq(1).append(
										'<td rowspan="' + trCount
												+ '" >배송비<br>2,500원</td>');
								checkAll();
								} // success
						}); // ajax

			});

function checkAll() {
	$('#check-all').prop('checked', true);
	$('input[name=checkGoods]').prop('checked', true);
	let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
	let checkedCnt = checkedGoods.length;
	let total = calcTot(checkedGoods);
	$('#totalGoodsCnt').html(checkedCnt);
	$('#totalGoodsPrice').html(total);

}
function uncheckAll() {
	$('#check-all').prop('checked', false);
	$('input[name=checkGoods]').prop('checked', false);
	let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
	let checkedCnt = checkedGoods.length;
	let total = calcTot(checkedGoods);
	$('#totalGoodsCnt').html(checkedCnt);
	$('#totalGoodsPrice').html(total);
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
	$('#totalGoodsCnt').html(checkedCnt);
	let total = calcTot(checkedGoods);
	$('#totalGoodsPrice').html(total);
});

function calcTot(checkedGoods) {
	let total = 0;
	checkedGoods.each(function(i) {
		let tr = checkedGoods.parent().parent().eq(i);
		let td = tr.children();
		let price = td.eq(4).text().replace(/[^0-9]/g, '');
		total += Number(price);
	});
	total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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

/** 주소 * */
function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
								+ ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr
								+ ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
				}
			}).open();
}
/** 주소 * */