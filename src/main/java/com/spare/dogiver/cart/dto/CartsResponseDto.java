package com.spare.dogiver.cart.dto;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;

import lombok.Getter;

@Getter
public class CartsResponseDto {
    
	private long cartId;
	private Member member;
    private Goods goods;
    private int cartCnt;
    private int totalPrice;
    
    public CartsResponseDto(Cart entity) {
    	this.cartId = entity.getId();
    	this.cartCnt = entity.getCartCnt();
    }
    
    
}
