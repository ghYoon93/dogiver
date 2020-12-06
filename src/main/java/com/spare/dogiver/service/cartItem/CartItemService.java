package com.spare.dogiver.service.cartItem;

import com.spare.dogiver.web.dto.CartItemSaveRequestDto;

public interface CartItemService {
	Long addCartItem(String email, CartItemSaveRequestDto cartItemSaveRequestDto);
}
