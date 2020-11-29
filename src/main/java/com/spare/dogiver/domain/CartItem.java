package com.spare.dogiver.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartItem {
	private Long id;
	private Long goodsId;
	private Long cartId;
	private int cartCnt;
	private Date createdDate;
	private Date modifedDate;
	
	@Builder
	public CartItem(Long id, Long goodsId, int cartCnt) {
		this.id = id;
		this.goodsId = goodsId;
		this.cartCnt = cartCnt;
	}
	
}
