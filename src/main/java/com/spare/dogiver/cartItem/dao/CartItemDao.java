package com.spare.dogiver.cartItem.dao;

import java.util.List;

import com.spare.dogiver.cartItem.domain.CartItem;

public interface CartItemDao {
//    List<CartItem> findAllByCartId(Long cartId);

	List<CartItem> findAllByCartIdDesc(long cartId);

	CartItem save(CartItem cartItem);
}
