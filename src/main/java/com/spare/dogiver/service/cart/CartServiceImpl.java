package com.spare.dogiver.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cart.dao.CartDao;
import cart.domain.Cart;
import cart.dto.CartSaveRequestDto;
import cart.dto.CartUpdateRequestDto;
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
	public Long update(CartUpdateRequestDto requestDto) {
		return cartDao.update(requestDto);
	}

	@Override
	public List<Cart> findAllByEmailDesc(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cart findById(Long cartId) {
		// TODO Auto-generated method stub
		return null;
	}

}
