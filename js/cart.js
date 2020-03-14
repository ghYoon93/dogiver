/*
페이지 이동 시 상품 선택 초기 값은 전체 선택
*/
$(document).ready(checkAll());

function checkAll(){
  $('#check-all').prop('checked', true);
  $('input[name=checkGoods]').prop('checked', true);
}
function uncheckAll(){
  $('#check-all').prop('checked', false);
  $('input[name=checkGoods]').prop('checked', false);
}

$('#check-all').click(function(){
  var chk = $(this).is(":checked");
  if(chk) checkAll();
  else uncheckAll();
});
$('.btn_option_view').click(function(){
  $('#option-view').show();
  $('body').css('overflow','hidden');
});
$('.close').click(function(){
  $('#option-view').hide();
  $('body').css('overflow','auto');
});
  
$('input:checkbox[name=checkGoods]').click(function(){
  let goodsCnt = $('input:checkbox[name=checkGoods]').length;
  let checked = $('input:checkbox[name=checkGoods]:checked').length;
  if(goodsCnt==checked) $('#check-all').prop('checked', true);
  else $('#check-all').prop('checked', false);
});