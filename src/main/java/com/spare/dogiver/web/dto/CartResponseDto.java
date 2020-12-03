package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.CartItem;
import com.spare.dogiver.domain.Goods;

import lombok.Getter;

@Getter
public class CartResponseDto {
    private Long id;
    private Long goodsId;
    private String goodsName;
    private String goodsThumbnail;
    private int goodsPrice;
    private int quantity;
    private int totalPrice;
    
    public CartResponseDto(CartItem cartItem) {
    	this.id = cartItem.getId();
    	this.quantity = cartItem.getQuantity();
    	this.goodsId = cartItem.getGoods().getId();
    	this.goodsThumbnail = cartItem.getGoods().getThumbnail();
    	this.goodsName = cartItem.getGoods().getName();
    	this.goodsPrice = cartItem.getGoods().getPrice();
    	this.totalPrice = quantity * goodsPrice;
    }    
}

