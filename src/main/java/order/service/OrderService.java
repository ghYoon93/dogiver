package order.service;

import java.util.List;
import java.util.Map;

import order.bean.CartDTO;
import order.bean.KakaoPayApprovalDTO;
import order.bean.OrderDTO;
import order.bean.OrderDetailDTO;
import order.bean.OrderListDTO;
import order.bean.OrderStatusDTO;

public interface OrderService {

	public List<CartDTO> getCart(String memEmail);

	public void insertCart(Map<String, String> map);
	
	public void updateCart(Map<String, String> map);

	public void deleteCart(Map<String, String[]> map);

	public CartDTO searchCart(Map<String, String> map);

	public List<CartDTO> getOrderList(Map<String, String[]> map);

	public String kakaoPayReady(OrderDTO orderDTO);

	public KakaoPayApprovalDTO kakaoPayInfo(String pg_token);

	public void insertOrderDetail(OrderDetailDTO orderDetailDTO);

	public void insertOrder(OrderDTO orderDTO);

	public List<OrderListDTO> getMyOrder(String memEmail);

	public List<OrderStatusDTO> getStatus(String memEmail);

	public void cancelOrder(String order_id);

	public int chkOrder(Map<String, String> map);



}
