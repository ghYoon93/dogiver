package com.spare.dogiver.cartItem.dto;

import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.domain.Goods;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartItemSaveRequestDto {
	private Long goodsId;
	private int quantity;
	
    @Builder
    public CartItemSaveRequestDto(Long goodsId, int quantity) {
    	this.goodsId = goodsId;
    	this.quantity = quantity;
    }

	public CartItem toEntity(Long cartId) {
		return CartItem.builder()
				.cartId(cartId)
				.goods(Goods.builder().id(goodsId).build())
				.quantity(quantity).build();
	}
    
}
