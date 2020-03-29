package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.CartDTO;

public interface OrderDAO {

	public List<CartDTO> getCart(String memEmail);
	
	public void insertCart(Map<String, String> map);
	public void updateCart(Map<String, String> map);
	public void deleteCart(Map<String, String[]> map);
	public CartDTO searchCart(Map<String, String> map);

	public List<CartDTO> getOrderList(Map<String, String[]> map);





	

}
