package com.spare.dogiver.cart.dto;

import com.spare.dogiver.domain.CartItem;
import com.spare.dogiver.domain.Goods;

import lombok.Getter;

@Getter
public class CartResponseDto {
    private Long id;
    private Long goodsId;
    private String name;
    private String thumbnail;
    private int price;
    private int quantity;
    private int totalPrice;
    
    public CartResponseDto(CartItem cartItem) {
    	this.id = cartItem.getId();
    	this.quantity = cartItem.getQuantity();
    	this.goodsId = cartItem.getGoods().getId();
    	this.thumbnail = cartItem.getGoods().getThumbnail();
    	this.name = cartItem.getGoods().getName();
    	this.price = cartItem.getGoods().getPrice();
    	this.totalPrice = quantity * price;
    }    
}

