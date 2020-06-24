package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartSaveRequestDto {
    private int goodsId;
    
    private Member member;
    private Goods goods;
    
    private int cartCnt;
    
    @Builder
    public CartSaveRequestDto(Member member, Goods goods, int cartCnt) {
    	this.member  = member;
    	this.goods = goods;
    	this.cartCnt = cartCnt;
    }
    
    public Cart toEntity() {
    	return Cart.builder()
    			.member(member)
    			.goods(goods)
    			.cartCnt(cartCnt)
    			.build();			
    }
}
