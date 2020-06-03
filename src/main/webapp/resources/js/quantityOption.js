/**
 * 상품 옵션 변경 모달
 */

/** 수량 변경*/
function increaseQTY(){
	let quantity = Number($('#quantity').val());
	$('#quantity').val(++quantity);
	calcPrice();
}

function decreaseQTY(){
	let quantity = Number($('#quantity').val());
	if(quantity>1){
		$('#quantity').val(--quantity);		
	}
	calcPrice();
}
function calcPrice(){
	let quantity = $('#quantity').val();
	let totalPrice = quantity * price;
	$('#tot_price').text(total_price);
}