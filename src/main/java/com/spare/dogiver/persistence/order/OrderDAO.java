package com.spare.dogiver.persistence.order;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.web.dto.CartDTO;
import com.spare.dogiver.web.dto.KakaoPayApprovalDTO;
import com.spare.dogiver.web.dto.OrderDTO;
import com.spare.dogiver.web.dto.OrderDetailDTO;
import com.spare.dogiver.web.dto.OrderListDTO;
import com.spare.dogiver.web.dto.OrderStatusDTO;

public interface OrderDAO {

	public List<CartDTO> getCart(String memEmail);
	
	public void insertCart(Map<String, String> map);
	public void updateCart(Map<String, String> map);
	public void deleteCart(Map<String, String[]> map);
	public CartDTO searchCart(Map<String, String> map);

	public List<CartDTO> getOrderList(Map<String, String[]> map);

	public void insertOrder(OrderDTO orderDTO);

	public void insertOrderDetail(OrderDetailDTO orderDetailDTO);

	public List<OrderListDTO> getMyOrder(String memEmail);

	public List<OrderStatusDTO> getStatus(String memEmail);

	public void cancelOrder(String order_id);

	public int chkOrder(Map<String, String> map);

	

	





	

}
