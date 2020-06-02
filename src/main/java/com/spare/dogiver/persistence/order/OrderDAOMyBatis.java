package com.spare.dogiver.persistence.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.web.dto.CartDTO;
import com.spare.dogiver.web.dto.KakaoPayApprovalDTO;
import com.spare.dogiver.web.dto.OrderDTO;
import com.spare.dogiver.web.dto.OrderDetailDTO;
import com.spare.dogiver.web.dto.OrderListDTO;
import com.spare.dogiver.web.dto.OrderStatusDTO;

@Repository
@Transactional
public class OrderDAOMyBatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insertCart(Map<String, String> map) {
		sqlSession.insert("orderSQL.insertCart", map);
	}
	@Override
	public List<CartDTO> getCart(String memEmail) {
		List<CartDTO> list = sqlSession.selectList("orderSQL.getCart", memEmail);
		return list;
	}
	@Override
	public void updateCart(Map<String, String> map) {
		sqlSession.update("orderSQL.updateCart", map);
		
	} 
	@Override
	public void deleteCart(Map<String, String[]> map) {
		sqlSession.delete("orderSQL.deleteCart", map);
		
	}
	@Override
	public CartDTO searchCart(Map<String, String> map) {
		CartDTO cartDTO = sqlSession.selectOne("orderSQL.searchCart", map);
		System.out.println(cartDTO);
		return cartDTO;
		
	}
	@Override
	public List<CartDTO> getOrderList(Map<String, String[]> map) {
		System.out.println("orderdao:"+map.get("array")[0]);
		return sqlSession.selectList("orderSQL.getOrderList",map);
	}
	@Override
	public void insertOrder(OrderDTO orderDTO) {
		System.out.println(orderDTO);
		sqlSession.insert("orderSQL.insertOrder", orderDTO);
		
	}
	@Override
	public void insertOrderDetail(OrderDetailDTO orderDetailDTO) {
		sqlSession.insert("orderSQL.insertOrderDetail",orderDetailDTO);
		
	}
	@Override
	public List<OrderListDTO> getMyOrder(String memEmail) {
		return sqlSession.selectList("orderSQL.getMyOrder",memEmail);
	}
	@Override
	public List<OrderStatusDTO> getStatus(String memEmail) {
		return sqlSession.selectList("orderSQL.getStatus", memEmail);
	}
	@Override
	public void cancelOrder(String order_id) {
		sqlSession.update("orderSQL.cancelOrder", order_id);
	}
	@Override
	public int chkOrder(Map<String, String> map) {
		return sqlSession.selectOne("orderSQL.chkOrder",map);
	}

}
