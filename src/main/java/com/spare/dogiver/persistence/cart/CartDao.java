package com.spare.dogiver.persistence.cart;

import java.util.List;

import com.spare.dogiver.domain.Cart;

public interface CartDao {

	public Cart save(Cart cart);
	public List<Cart> findAll();
	public List<Cart> findAllDesc();
	public List<Cart> findAllByEmailDesc();
	public Cart findById(Long cartId);
	public void update(Cart cart);
	
}
