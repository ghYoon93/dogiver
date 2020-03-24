package order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.bean.CartDTO;
import order.dao.OrderDAO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	@Override
	public List<CartDTO> getCart(String memEmail) {
		List<CartDTO> list = orderDAO.getCart(memEmail);
		System.out.println("service:" +list.size());
		return list;
	}

}
