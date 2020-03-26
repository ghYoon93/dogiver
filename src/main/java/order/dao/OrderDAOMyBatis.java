package order.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import order.bean.CartDTO;

@Repository
@Transactional
public class OrderDAOMyBatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
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
		return sqlSession.selectOne("orderSQL.searchCart", map);
		
	}
	@Override
	public CartDTO insertCart(Map<String, String> map) {
		
		return null;
	}

}
