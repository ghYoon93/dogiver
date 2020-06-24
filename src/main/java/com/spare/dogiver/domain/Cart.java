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
	
	private long cartCnt;
	
	private Date createdDate;
	private Date modifedDate;
	
	@Builder
	public Cart(Member member, Goods goods, long cartCnt) {
		this.member = member;
		this.goods = goods;
		this.cartCnt = cartCnt;
	}
	
	public void update(long cartCnt) {
		this.cartCnt = cartCnt;
	}
}
