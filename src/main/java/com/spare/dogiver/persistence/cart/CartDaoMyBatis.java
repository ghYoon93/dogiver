package com.spare.dogiver.persistence.cart;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CartDaoMyBatis implements CartDao {
	private final SqlSession sqlSession;
	
	@Override
	public Cart save(Cart cart) {
		
		Long id = (long) sqlSession.insert("CartMapper.save", cart);
		return sqlSession.selectOne("CartMapper.findById", id);
		
	}
	
	@Override
	public List<Cart> findAll() {
		
		return sqlSession.selectList("CartMapper.findAll");
	}
	
	@Override
	public List<Cart> findAllDesc() {
		return sqlSession.selectList("CartMapper.findAllDesc");
	}
	
//	@Override
//	public List<Cart> findAllByEmailDesc(String email) {
//		return sqlSession.selectList("CartMapper.findAllByEmailDesc", email);
//	}
	
	@Override
	public Cart findById(Long cartId) {
		return sqlSession.selectOne("CartMapper.find", cartId);
	}
	@Override
	public Long update(Cart cart) {
		sqlSession.update("CartMapper.update", cart);
		return cart.getId();
	}

	@Override
	public void deleteAll() {
		sqlSession.delete("CartMapper.deleteAll");
	}

	public void delete(Long cartId) {
		sqlSession.delete("CartMapper.delete", cartId);
		
	}

	@Override
	public Cart findByEmailAndGoodsId(Cart cart) {
		Cart result = sqlSession.selectOne("CartMapper.findByEmailAndGoodsId", cart);
		if(result == null) return cart;
		return result;
	}
	@Override
	public Optional<Cart> findByEmail(String email) {
		Cart cart = sqlSession.selectOne("CartMapper.findByEmail", email);
		return Optional.of(cart);
		
	}

	@Override
	public void deleteByIdIn(List<Long> cartIds) {
		sqlSession.delete("CartMapper.deleteByIdIn", cartIds);
		
	}
}
