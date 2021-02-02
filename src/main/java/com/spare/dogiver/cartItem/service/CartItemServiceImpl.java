package com.spare.dogiver.cartItem.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.cart.dao.CartDao;
import com.spare.dogiver.cartItem.dao.CartItemDao;
import com.spare.dogiver.cartItem.dto.CartItemSaveRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CartItemServiceImpl implements CartItemService {
	private final CartDao cartDao;
	private final CartItemDao cartItemDao;

	@Transactional
	@Override
	public Long addCartItem(String email, CartItemSaveRequestDto cartItemSaveRequestDto) {
		Cart cart = cartDao.findByEmail(email).orElseGet(()-> cartDao.save(Cart.builder().email(email).build()));
		Long cartId = cart.getId();
		return itemAlreadyExisted(cart, cartItemSaveRequestDto) ? 
				0L : cartItemDao.save(cartItemSaveRequestDto.toEntity(cartId)).getId();
	}
	
	private boolean itemAlreadyExisted(Cart cart, CartItemSaveRequestDto cartItemSaveRequestDto) {
		return cart.getCartItem(cartItemSaveRequestDto.getGoodsId()).isPresent();
	}
}
