package com.spare.dogiver.service.cart;

import java.util.List;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.web.dto.CartListResponseDto;
import com.spare.dogiver.web.dto.CartResponseDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

public interface CartService {
	public Long save(String email, CartSaveRequestDto requestDto);
	public List<Cart> findAllDesc();
	public List<CartListResponseDto> findAllByEmailDesc(String email);
	public CartResponseDto findById(long cartId);
	public Long update(long cartId, CartUpdateRequestDto requestDto);
	public void delete(long cartId);
}
