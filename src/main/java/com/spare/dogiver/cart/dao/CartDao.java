package com.spare.dogiver.cart.dao;

import java.util.List;
import java.util.Optional;

import com.spare.dogiver.cart.domain.Cart;

public interface CartDao {
	public Cart save(Cart cart);
	public Optional<Cart> findByEmail(String email);
	public List<Cart> findAll();
	public List<Cart> findAllDesc();
//	public Cart findAllByEmailDesc(String email);
	public Cart findById(Long cartId);
	public Long update(Cart cart);
	public void deleteAll();
	public void delete(Long cartId);
	public void deleteByIdIn(List<Long> cartIds);
	public Cart findByEmailAndGoodsId(Cart cart);
	
}
