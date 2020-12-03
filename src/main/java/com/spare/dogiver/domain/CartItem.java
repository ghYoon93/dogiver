package com.spare.dogiver.domain;

import java.util.Date;

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
	public CartItem(Long id, Goods goods, int quantity) {
		this.id = id;
		this.goods = goods;
		this.quantity = quantity;
	}
	
}
