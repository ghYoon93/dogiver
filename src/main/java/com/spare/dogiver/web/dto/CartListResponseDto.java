package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;

import lombok.Getter;

@Getter
public class CartListResponseDto {
    private long cartId;
    
    private Member member;
    private Goods goods;
    
    private int cartCnt;
    
    public CartListResponseDto(Cart entity) {
    	this.cartId = entity.getCartId();
    	this.member = entity.getMember();
    	this.goods = entity.getGoods();
    	this.cartCnt = entity.getCartCnt();
    }
    
    
}
