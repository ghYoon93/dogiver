package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.CartItem;
import com.spare.dogiver.domain.Goods;

import lombok.Getter;

@Getter
public class CartResponseDto {
    private Long id;
    private Long goodsId;
    private String goodsName;
    private String thumbnail;
    private int goodsPrice;
    private int cartCnt;
    private int totalPrice;
    
    public CartResponseDto(CartItem cartItem, Goods goods) {
    	this.id = cartItem.getId();
    	this.cartCnt = cartItem.getCartCnt();
    	this.goodsId = goods.getGoodsId();
    	this.goodsName = goods.getGoodsName();
    	this.goodsPrice = goods.getGoodsPrice();
    }
}
