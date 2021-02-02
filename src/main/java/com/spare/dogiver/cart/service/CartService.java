package com.spare.dogiver.cart.service;

import java.util.List;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.cart.dto.CartResponseDto;
import com.spare.dogiver.cart.dto.CartSaveRequestDto;
import com.spare.dogiver.cart.dto.CartUpdateRequestDto;

public interface CartService {
	public List<CartResponseDto> getCart(String email);
	public Long save(String email, CartSaveRequestDto requestDto);
	public List<Cart> findAllDesc();
	public CartResponseDto findById(Long cartId);
	public Long update(long cartId, CartUpdateRequestDto requestDto);
	public void delete(long cartId);
	public void deleteByIdIn(List<Long> cartIds);

}
