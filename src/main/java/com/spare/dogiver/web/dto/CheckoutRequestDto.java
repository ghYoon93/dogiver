package com.spare.dogiver.web.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CheckoutRequestDto {
	private long goodsId;
	private int quantity;
	
	@Builder
	public CheckoutRequestDto(long goodsId, int quantity) {
		this.goodsId = goodsId;
		this.quantity = quantity;
	}
}
