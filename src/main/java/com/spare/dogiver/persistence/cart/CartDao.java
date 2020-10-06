package com.spare.dogiver.persistence.cart;

import java.util.List;

import com.spare.dogiver.domain.Cart;

public interface CartDao {

	public Long save(Cart cart);
	public List<Cart> findAll();
	public List<Cart> findAllDesc();
	public List<Cart> findAllByEmailDesc(String email);
	public Cart findById(Long cartId);
	public Long update(Cart cart);
	public void deleteAll();
	public void delete(Long cartId);
	public void deleteByIdIn(List<Long> cartIds);
	public Cart findByEmailAndGoodsId(Cart cart);
	
}
