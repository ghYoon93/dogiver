package com.spare.dogiver.persistence.cartItem;

import java.util.List;

import com.spare.dogiver.domain.CartItem;

public interface CartItemDao {
//    List<CartItem> findAllByCartId(Long cartId);

	List<CartItem> findAllByCartIdDesc(long cartId);

	CartItem save(CartItem cartItem);
}
