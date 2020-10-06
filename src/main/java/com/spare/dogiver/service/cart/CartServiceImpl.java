package com.spare.dogiver.service.cart;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Member;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.persistence.member.MemberDAO;
import com.spare.dogiver.web.dto.CartListResponseDto;
import com.spare.dogiver.web.dto.CartResponseDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService {
	
	private final CartDao cartDao;
	private final MemberDAO memberDao;
	
	@Transactional
	@Override
	public Long save(String email, CartSaveRequestDto requestDto) {
		Member member = memberDao.find(email);
		Cart cart = cartDao.findByEmailAndGoodsId(requestDto.toEntity(member)); 
		
		if(cart.hasCartId()) {
			return 0L;
		}
		
		log.info("장바구니에 담는 물품: "+ requestDto);
		return cartDao.save(cart);
	}
    
	@Transactional
	@Override
	public List<Cart> findAllDesc() {
		log.info("전체 물품 조회");
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
	public CartResponseDto findById(Long cartId) {
		Cart cart = cartDao.findById(cartId);
		return new CartResponseDto(cart);
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
