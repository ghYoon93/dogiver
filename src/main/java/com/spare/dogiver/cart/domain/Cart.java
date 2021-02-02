package com.spare.dogiver.cart.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.spare.dogiver.cartItem.domain.CartItem;

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
	
	List<CartItem> cartItems = new ArrayList<CartItem>();
	
	@Builder
	public Cart(Long id, String email) {
		this.id = id;
		this.email = email;
	}
	
	public void update(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	
	
	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
	public boolean hasCartId() {
		return this.id != 0L ? true : false;
	}
	public Optional<CartItem> getCartItem(Long goodsId) {
		return cartItems.stream()
				.filter(cartItem -> cartItem.getGoods().getId().equals(goodsId))
				.findFirst();
	}
}
