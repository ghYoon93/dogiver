package com.spare.dogiver.order.dto;

import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.member.domain.Member;

import lombok.Getter;

@Getter
public class CheckoutResponseDto {
	private Goods goods;
	private int quantity;
	private Member member;
	
	public CheckoutResponseDto(Goods goods, Member member, int quantity) {
		this.goods = Goods.builder()
				.id(goods.getId())
				.thumbnail(goods.getThumbnail())
				.name(goods.getName())
				.price(goods.getPrice())
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
