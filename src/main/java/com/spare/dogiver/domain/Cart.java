package com.spare.dogiver.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Cart {
	
	private Long id;
//	private Member member;
//	private Goods goods;
	private String email;
	private int cartCnt;
	private Date createdDate;
	private Date modifedDate;
	
	@Builder
	public Cart(Long id, String email) {
		this.id = id;
		this.email = email;
	}
//	@Builder
//	public Cart(Member member, Goods goods, int cartCnt) {
//		this.member = member;
//		this.goods = goods;
//		this.cartCnt = cartCnt;
//	}
	
	public void update(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	
//	public int getTotalPrice() {
//		return this.cartCnt * this.goods.getGoodsPrice(); 
//	}
	
	public boolean hasCartId() {
		return this.id != 0L ? true : false;
	}
}
