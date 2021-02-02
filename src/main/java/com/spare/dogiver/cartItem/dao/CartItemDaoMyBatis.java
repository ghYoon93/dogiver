package com.spare.dogiver.cartItem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spare.dogiver.cartItem.domain.CartItem;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CartItemDaoMyBatis implements CartItemDao {
	private final SqlSession sqlSession;

//	@Override
//	public List<CartItem> findAllByCartId(Long cartId) {
//		return sqlSession.selectList("CartItemMapper.findAllByCartId", cartId);
//	}

	@Override
	public List<CartItem> findAllByCartIdDesc(long cartId) {
		return sqlSession.selectList("CartItemMapper.findAllByCartIdDesc", cartId);
	}
	
	@Override
	public CartItem save(CartItem cartItem) {
		sqlSession.insert("CartItemMapper.save", cartItem);
		return cartItem;
	}

}
