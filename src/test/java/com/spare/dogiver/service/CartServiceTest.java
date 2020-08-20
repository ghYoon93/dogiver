package com.spare.dogiver.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.service.cart.CartService;
import com.spare.dogiver.web.dto.CartListResponseDto;
import com.spare.dogiver.web.dto.CartResponseDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
public class CartServiceTest {
    
	@Autowired
	private CartService cartService;
	@Autowired
	private CartDao cartDao;
	
	@Before
	public void cleanUp() {
		cartDao.deleteAll();
	}
	
	@Test
	public void 장바구니_물품_담기() {
		// given
		String email = "gh.yoon93@gmail.com";
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		CartSaveRequestDto requestDto = CartSaveRequestDto.builder()
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		// when
		long cartId = cartService.save(email, requestDto);
		
		
		// then
		Cart cart = cartDao.findById(cartId);
		assertThat(cartCnt).isEqualTo(cart.getCartCnt());
	}
	
	@Test
	public void 장바구니_물품_목록() {
		// given
		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		
		Cart cart = Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		cartDao.save(cart);
		
		// when
		List<CartListResponseDto> carts = cartService.findAllByEmailDesc("gh.yoon93@gmail.com");
		
		// then
		List<Cart> all = cartDao.findAll();
		assertThat(all.get(0).getGoods().getGoodsId()).isEqualTo(carts.get(0).getGoods().getGoodsId());
	}
	
	@Test
	public void 장바구니_물품_조회() {
		// given
		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		
		Cart cart = Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		long exPectedCartId = cartDao.save(cart);
		
		// when
		CartResponseDto expectedCart = cartService.findById(exPectedCartId);
		
		// then
		assertThat(expectedCart.getCartCnt()).isEqualTo(cartCnt);
	}
	
	@Test
	public void 장바구니_물품_수량_변경() {
		// given
		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		
		Cart cart = Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		long savedCartId = cartDao.save(cart);
		
		int expectedCartCnt = 5;
		
		CartUpdateRequestDto requestDto = CartUpdateRequestDto.builder()
				.cartCnt(expectedCartCnt).build();
		// when
		cartService.update(savedCartId, requestDto);
		
		// then
		List<Cart> carts = cartDao.findAll();
		assertThat(carts.get(0).getCartCnt()).isEqualTo(expectedCartCnt);
	}
	@Test
	public void 장바구니_물품_삭제() {
		// given
		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		
		Cart cart = Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		long cartId = cartDao.save(cart);
		
		// when
		cartService.delete(cartId);
		
		// then
		List<Cart> all = cartDao.findAll();
		assertThat(all).isEmpty();
		
	}
}
