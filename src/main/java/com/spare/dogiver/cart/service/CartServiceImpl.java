package com.spare.dogiver.cart.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.cart.dao.CartDao;
import com.spare.dogiver.cartItem.dao.CartItemDao;
import com.spare.dogiver.goods.dao.GoodsDAO;
import com.spare.dogiver.member.dao.MemberDAO;
import com.spare.dogiver.cart.dto.CartsResponseDto;
import com.spare.dogiver.cart.dto.CartResponseDto;
import com.spare.dogiver.cart.dto.CartSaveRequestDto;
import com.spare.dogiver.cart.dto.CartUpdateRequestDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService {
	
	private final CartDao cartDao;
	private final CartItemDao cartItemDao;
	private final MemberDAO memberDao;
	
	@Transactional(readOnly = true)
	@Override
	public List<CartResponseDto> getCart(String email) {
		// email에 해당하는 cartId 구해오기
		// orElse는 값이 있던 없던 무조건 실행 -> orElseGet
		Cart cart = cartDao.findByEmail(email).orElseGet(()->cartDao.save(Cart.builder().email(email).build()));
		return cart.getCartItems()
				.stream()
				.map(CartResponseDto::new)
				.collect(Collectors.toList());
	}
	
	@Transactional
	@Override
	public Long save(String email, CartSaveRequestDto requestDto) {
		Member member = memberDao.find(email);
		Cart cart = cartDao.findByEmailAndGoodsId(requestDto.toEntity(member)); 
		
		if(cart.hasCartId()) {
			return 0L;
		}
		
//		log.info("장바구니에 담는 물품: "+ requestDto);
//		return cartDao.save(cart);
		return null;
	}
    
	@Transactional
	@Override
	public List<Cart> findAllDesc() {
//		log.info("전체 물품 조회");
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
    
	

	@Override
	public CartResponseDto findById(Long cartId) {
		Cart cart = cartDao.findById(cartId);
//		return new CartResponseDto(cart);
		return null;
	}

	@Override
	public void delete(long cartId) {
		cartDao.delete(cartId);
	}

	@Override
	public void deleteByIdIn(List<Long> cartIds) {
		cartDao.deleteByIdIn(cartIds);
		
	}

}
