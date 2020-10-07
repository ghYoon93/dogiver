package com.spare.dogiver.web.dto;

import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;

import lombok.Getter;

@Getter
public class CheckoutResponseDto {
	private Goods goods;
	private int quantity;
	private Member member;
	
	public CheckoutResponseDto(Goods goods, Member member, int quantity) {
		this.goods = Goods.builder()
				.goodsId(goods.getGoodsId())
				.goodsThumbnail(goods.getGoodsThumbnail())
				.goodsName(goods.getGoodsName())
				.goodsPrice(goods.getGoodsPrice())
				.build();
		
		this.member = Member.builder()
				.email(member.getEmail())
				.addr(member.getAddr())
				.addrDetail(member.getAddrDetail())
				.phone(member.getPhone())
				.build();
		
		this.quantity = quantity;
	}
}
