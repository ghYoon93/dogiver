package com.spare.dogiver.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Cart {
	private long cartId;
	
	private Member member;
	private Goods goods;
	
	private int cartCnt;
	private int totalPrice;
	
	private Date createdDate;
	private Date modifedDate;
	
	@Builder
	public Cart(Member member, Goods goods, int cartCnt) {
		this.member = member;
		this.goods = goods;
		this.cartCnt = cartCnt;
	}
	
	public void update(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	
	public int getTotalPrice() {
		this.totalPrice = this.cartCnt * this.goods.getGoodsPrice(); 
		return this.totalPrice; 
	}
}
