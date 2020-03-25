package order.service;

import java.util.List;
import java.util.Map;

import order.bean.CartDTO;

public interface OrderService {

	public List<CartDTO> getCart(String memEmail);

	public void updateCart(Map<String, String> map);

}
