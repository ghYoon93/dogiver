package com.spare.dogiver.cartItem.service;

import com.spare.dogiver.cartItem.dto.CartItemSaveRequestDto;

public interface CartItemService {
	Long addCartItem(String email, CartItemSaveRequestDto cartItemSaveRequestDto);
}
