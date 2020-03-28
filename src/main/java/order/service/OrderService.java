package order.service;

import java.util.List;
import java.util.Map;

import order.bean.CartDTO;

public interface OrderService {

	public List<CartDTO> getCart(String memEmail);

	public void insertCart(Map<String, String> map);
	
	public void updateCart(Map<String, String> map);

	public void deleteCart(Map<String, String[]> map);

	public CartDTO searchCart(Map<String, String> map);


}
