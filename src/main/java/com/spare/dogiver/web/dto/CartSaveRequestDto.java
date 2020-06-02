package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.Cart;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartSaveRequestDto {
    private int goodsId;
    private String email;
    private int cartCnt;
    
    @Builder
    public CartSaveRequestDto(int goodsId, String email, int cartCnt) {
    	this.goodsId = goodsId;
    	this.email  = email;
    	this.cartCnt = cartCnt;
    }
    
    public Cart toEntity() {
    	return Cart.builder()
    			.goodsId(goodsId)
    			.email(email)
    			.cartCnt(cartCnt)
    			.build();
    			
    }
}
