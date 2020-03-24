/*
페이지 이동 시 상품 선택 초기 값은 전체 선택
*/
$(document).ready(function(){
	$.ajax({
		type: 'POST',
		url: '/dogiver/order/getCart',
		dataType:'json',
		success: function(data){
			let tbody = $('#form-cart tbody');
			let tag;
			$.each(data.list, function(index, items){
				tag += '<tr>'
					     +'<td class="td_check"><input type="checkbox" id="'+items.cart_id+'" name="checkGoods" value="'+items.cart_id+'"></td>'
					     +'<td class="td_left">'
				           +'<div class="cart_goods_cont">'
				             +'<span class="cart_goods_image">'
				               +'<a href="#">'
				                 +'<img src="../image/goods/'+items.goods_thumbnail+'" class="middle" alt="'+items.goods_name+'" title="'+items.goods_name+'">'
                               +'</a>'
                             +'</span>'
                             +'<div class="cart_goods_info">'
                               +'<em><a href="#">'+items.goods_name+'</a></em>'
                             +'</div>'
                           +'</div>'
                         +'</td>'
                         +'<td class=td_order_amount>'
                             +'<div class="cart_goods_num">'
                               +'<strong>'+items.cart_cnt+'</strong><font>개</font>'
                               +'<div class="btn_option">'
                                 +'<button type="button" class="btn_option_view">수량 변경</button>'
                               +'</div>'
                             +'</div>'
                         +'</td>'
                         +'<td><strong>'+items.goods_price+'원</strong></td>'
                         +'<td><strong>'+items.total_price+'원</strong></td>'
                      +'</tr>'
			}); //each
			tbody.append(tag);
			let count = Object.keys(data).length;
			$('#form-cart tr').eq(1).append('<td rowspan="'+count+'">qwe</td>');
			checkAll();
			let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
			let checkedCnt = checkedGoods.length;
			let total = calcTot(checkedGoods);
			$('#totalGoodsCnt').html(checkedCnt);
			$('#totalGoodsPrice').html(total);
		} //success
	}); // ajax
	
  
});

function checkAll(){
    $('#check-all').prop('checked', true);
    $('input[name=checkGoods]').prop('checked', true);
  
}
function uncheckAll(){
  $('#check-all').prop('checked', false);
  $('input[name=checkGoods]').prop('checked', false);
}

$(document).on('click','#check-all', function(){
  var chk = $(this).is(":checked");
  if(chk) checkAll();
  else uncheckAll();
});
$(document).on('click','input:checkbox[name=checkGoods]',function(){
	alert('checkGoods')
	let goodsCnt = $('input:checkbox[name=checkGoods]').length;
	  let checkedGoods = $('input:checkbox[name=checkGoods]:checked');
	  let checkedCnt = checkedGoods.length;
	  if(goodsCnt==checkedCnt) {
	    $('#check-all').prop('checked', true);
	  }else {
	    $('#check-all').prop('checked', false);
	  }
	  $('#totalGoodsCnt').html(checkedCnt);
	  let total = calcTot(checkedGoods);
	  $('#totalGoodsPrice').html(total);
});
function calcTot(checkedGoods){
  let total = 0;
  checkedGoods.each(function(i){
    let tr = checkedGoods.parent().parent().eq(i);
    let td = tr.children();
    let price = td.eq(4).text().replace(/[^0-9]/g,'');
    total += Number(price);
  });
    total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
    return total;
}

$(document).on('click', '.btn_option_view',function(){
  $('#option-view').show();
  $('body').css('overflow','hidden');
});

$(document).on('click', '.close', function(){
  $('#option-view').hide();
  $('body').css('overflow','auto');
});
  


/**주소 **/
function sample4_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
          
          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          if(roadAddr !== ''){
              document.getElementById("sample4_extraAddress").value = extraRoadAddr;
          } else {
              document.getElementById("sample4_extraAddress").value = '';
          }

          var guideTextBox = document.getElementById("guide");
          // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          if(data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
              guideTextBox.style.display = 'block';

          } else if(data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
              guideTextBox.style.display = 'block';
          } else {
              guideTextBox.innerHTML = '';
              guideTextBox.style.display = 'none';
          }
      }
  }).open();
}
/** 주소 **/