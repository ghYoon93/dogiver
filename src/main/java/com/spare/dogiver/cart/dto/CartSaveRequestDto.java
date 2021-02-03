package com.spare.dogiver.cart.dto;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.member.domain.Member;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartSaveRequestDto {
    private int goodsId;
    
    private Goods goods;
    
    private int cartCnt;
    
    @Builder
    public CartSaveRequestDto(Goods goods, int cartCnt) {
    	this.goods = goods;
    	this.cartCnt = cartCnt;
    }
    
    public Cart toEntity(Member member) {
    	return Cart.builder()
    			.build();			
    }
}
