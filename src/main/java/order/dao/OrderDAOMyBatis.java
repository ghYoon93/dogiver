package order.dao;

import java.util.List;

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
		System.out.println("dao: "+list.size());
		return list;
	}

}
