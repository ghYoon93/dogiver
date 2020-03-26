package order.dao;

import java.util.List;

import order.bean.CartDTO;

public interface OrderDAO {

	public List<CartDTO> getCart(String memEmail);

}
