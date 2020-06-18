package com.spare.dogiver.domain;

import java.util.Date;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Cart {
	private long cartId;
	private String email;
	private long goodsId;
	private long cartCnt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date createdDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date modifedDate;
	
	@Builder
	public Cart(String email, long goodsId, long cartCnt) {
		this.email = email;
		this.goodsId = goodsId;
		this.cartCnt = cartCnt;
	}
	
	public void update(long cartCnt) {
		this.cartCnt = cartCnt;
	}
}
