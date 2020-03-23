package order.service;

import java.util.List;

import order.bean.CartDTO;

public interface OrderService {

	List<CartDTO> getCart();

}
