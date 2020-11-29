package com.spare.dogiver.persistence.cartItem;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spare.dogiver.domain.CartItem;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CartItemMyBatis implements CartItemDao {
	private final SqlSession sqlSession;

	@Override
	public List<CartItem> findAllByCartId(Long cartId) {
		return sqlSession.selectList("CartItemMapper.findAllByCartId", cartId);
	}

}
