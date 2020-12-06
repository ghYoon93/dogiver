package com.spare.dogiver.persistence.cart;

import java.util.List;
import java.util.Optional;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.CartItem;

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
