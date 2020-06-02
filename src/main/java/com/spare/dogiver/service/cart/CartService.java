package com.spare.dogiver.service.cart;

import java.util.List;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

public interface CartService {
	public Long save(CartSaveRequestDto requestDto);
	public List<Cart> findAllDesc();
	public List<Cart> findAllByEmailDesc(String email);
	public Cart findById(Long cartId);
	public Long update(CartUpdateRequestDto requestDto);
}
