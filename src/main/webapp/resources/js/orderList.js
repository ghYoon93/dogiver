$(document).ready(function(){
  $.ajax({
    type : 'POST',
    url : '/dogiver/my/getMyOrder',
    dataType : 'json',
    success : function(data) {
      let tbody = $('.mypage_table_type tbody');
      let tag;
      let orderIdChk = 0;
      $.each(data.list,function(index, items) {
    	  let orderDate = items.order_date;
    	  new Date(Date.parse(orderDate.replace(/-/g, '/')));
    	  let order_day_num = '';
    	  let orderId = items.order_id;
    	  let order_status = items.order_status;
    	  console.log('orderId: '+orderId);
    	  console.log(order_status)
    	  let orderAmount = 0;
    	  if(orderId != orderIdChk){
    		  orderIdChk = orderId;
    		  orderAmount = items.order_amount;
    		  console.log('orderAmount: '+orderAmount);
    		  let orderCancelBtn =  '';
    		  if(order_status != '주문취소') {
    			  orderCancelBtn=  '<div class="btn_claim">'
                                   + '<span class="btn_gray_list">'
                                     + '<a href="#" class="btn_gray_small js_btn_order_cancel" data-order_id='+items.order_id+'>'
                                       + '<span>주문취소</span>'
                                     + '</a>'
                                   + '</span>'
                                 + '</div>';
    		  }
    		  order_day_num='<td rowspan="'+orderAmount+'" class="order_day_num">'
                            + '<em>'+orderDate+'</em><br>'
                            + '<a href="'+'../my/orderView?order_id='+items.order_id+'" target="_blank"'
                               + 'class="order_num_link"><span>'+items.order_id+'</span></a>'
                               + orderCancelBtn
                          + '</td>';  
    	  }
          tag += '<tr class="row_line">'
                 + order_day_num  
                 + '<td class="td_left">'
                   + '<div class="pick_add_cont">'
                     + '<span class="pick_add_img">'
                       + '<a href="../goods/goodsDetail?goods_id='+items.goods_id+'">'
                         + '<img src="${pageContext.request.contextPath}/resources/img/goods/'+items.goods_thumbnail+'" width="50"'
                              + 'alt="'+items.goods_name+'"'
                              + 'title="'+items.goods_name+'" class="middle">'
                       + '</a>'
                     + '</span>'
                     + '<div class="pick_add_info">'
                       + '<a href="../goods/goodsDetail?goods_id='+items.goods_id+'">'
                         + '<em>'+items.goods_name+'</em></a>'
                     + '</div>'
                   + '</div>'
                 + '</td>'
                 + '<td><strong>'+items.goods_count +'</strong>개</td>'
                 + '<td><strong>'+numberFormat(items.total_price) +'원</strong></td>'
                 + '<td>'
                   + '<em>'
                     + items.order_status
                   + '</em>'
                 + '</td>'
               + '</tr>'
      }); // each
          tbody.append(tag);
    }
  });
});
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$(document).on('click','.js_btn_order_cancel', function(){
	console.log(this.dataset.order_id);
	let cancelOrder = confirm('주문 취소 처리를 하시겠습니까?');
	if(cancelOrder){
		$.ajax({
			type: 'post',
			url: '/dogiver/order/cancelOrder',
			data: 'order_id='+this.dataset.order_id,
			success: function(){
				alert('주문이 정상적으로 취소되었습니다.');
			}
			
		});
	}
});