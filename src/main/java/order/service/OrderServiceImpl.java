package order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.bean.CartDTO;
import order.dao.OrderDAO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public void insertCart(Map<String, String> map) {
		orderDAO.insertCart(map);
		
	}
	@Override
	public List<CartDTO> getCart(String memEmail) {
		List<CartDTO> list = orderDAO.getCart(memEmail);
		return list;
	}
	@Override
	public void updateCart(Map<String, String> map) {
		orderDAO.updateCart(map);
	}
	@Override
	public void deleteCart(Map<String, String[]> map) {
		orderDAO.deleteCart(map);
		
	}
	@Override
	public CartDTO searchCart(Map<String, String> map) {
		CartDTO cartDTO = new CartDTO(); 
		cartDTO = orderDAO.searchCart(map);
		return cartDTO;
	}
	

}
