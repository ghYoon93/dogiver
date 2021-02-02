package com.spare.dogiver.cartItem.domain;

import java.util.Date;

import com.spare.dogiver.domain.Goods;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartItem {
	private Long id;
	private Goods goods;
	private Long cartId;
	private int quantity;
	private Date createdDate;
	private Date modifedDate;
	
	@Builder
	public CartItem(Long id, Long cartId, Goods goods, int quantity) {
		this.id = id;
		this.cartId = cartId;
		this.goods = goods;
		this.quantity = quantity;
	}
	
}
