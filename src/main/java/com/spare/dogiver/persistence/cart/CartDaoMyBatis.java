package com.spare.dogiver.persistence.cart;

import java.util.List;

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
		long cartId = sqlSession.insert("CartMapper.save", cart); 
		return sqlSession.selectOne("CartMapper.findById", cartId);
	}
	@Override
	public List<Cart> findAll() {
		return sqlSession.selectList("CartMapper.findAll");
	}
	@Override
	public List<Cart> findAllDesc() {
		return sqlSession.selectList("CartMapper.findAllDesc");
	}
	@Override
	public List<Cart> findAllByEmailDesc() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Cart findById(Long cartId) {
		return sqlSession.selectOne("CartMapper.findById", cartId);
	}
	@Override
	public void update(Cart cart) {
		sqlSession.update("CartMapper.update", cart);
	}
	
	
	

}
