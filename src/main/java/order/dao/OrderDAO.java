package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.CartDTO;

public interface OrderDAO {

	public List<CartDTO> getCart(String memEmail);

	public void updateCart(Map<String, String> map);

}
