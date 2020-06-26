package com.spare.dogiver.service.cart;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.web.dto.CartListResponseDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService {
	private final CartDao cartDao;
	
	@Transactional
	@Override
	public Long save(CartSaveRequestDto requestDto) {
		return cartDao.save(requestDto.toEntity()).getCartId();
	}
    
	@Transactional
	@Override
	public List<Cart> findAllDesc() {
		return cartDao.findAllDesc();
	}
    
	@Transactional
	@Override
	public Long update(long cartId, CartUpdateRequestDto requestDto) {
		Cart cart = cartDao.findById(cartId);
		cart.update(requestDto.getCartCnt());
		cartDao.update(cart);
		return cartId;
	}
    
	@Transactional(readOnly = true)
	@Override
	public List<CartListResponseDto> findAllByEmailDesc(String email) {
		return cartDao.findAllByEmailDesc(email).stream()
				.map(CartListResponseDto::new)
				.collect(Collectors.toList());
	}

	@Override
	public Cart findById(long cartId) {
		// TODO Auto-generated method stub
		return null;
	}

}
