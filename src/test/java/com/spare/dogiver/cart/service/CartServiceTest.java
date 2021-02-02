package com.spare.dogiver.cart.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.cart.dao.CartDao;
import com.spare.dogiver.cartItem.dao.CartItemDao;
import com.spare.dogiver.persistence.goods.GoodsDAO;
import com.spare.dogiver.cart.dto.CartResponseDto;

import static org.mockito.BDDMockito.given;


@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
public class CartServiceTest {
	private CartService cartService;
	
	@Mock
	private CartDao cartDao;
	
	@Mock
	private CartItemDao cartItemDao;
	
	@Mock
	private GoodsDAO goodsDao;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		mockCartDao();
		mockCartItemDao();
		cartDao.deleteAll();
		cartService = new CartServiceImpl(cartDao,cartItemDao);
	}
	
	private void mockCartDao() {
		String email = "gh.yoon93@gmail.com";
		Cart cart = Cart.builder().id(101L).email(email).build();
		List<CartItem> cartItems = new ArrayList();
		Goods goods = Goods.builder()
				.id(1010001L)
				.thumbnail("1010001/thumbnail.jpg")
				.name("핸드메이드 강아지 로프 장난감")
				.price(3000)
				.build();
		CartItem cartItem = CartItem.builder().id(1001L).quantity(3).goods(goods).build();
		cartItems.add(cartItem);
		cart.setCartItems(cartItems);
		given(cartDao.findByEmail(email)).willReturn(Optional.of(cart));
	}
	
	private void mockCartItemDao() {
		List<CartItem> cartItems = new ArrayList();
		Goods goods = Goods.builder()
				.id(1010001L)
				.thumbnail("1010001/thumbnail.jpg")
				.name("핸드메이드 강아지 로프 장난감")
				.price(3000)
				.build();
		CartItem cartItem = CartItem.builder().id(1001L).quantity(3).goods(goods).build();
		cartItems.add(cartItem);
		given(cartItemDao.findAllByCartIdDesc(101L)).willReturn(cartItems);
	}
	
	@Test
	public void getCart() {
		List<CartResponseDto> cart = cartService.getCart("gh.yoon93@gmail.com");
		CartResponseDto dto = cart.get(0);
		assertThat(dto.getQuantity()).isEqualTo(3);
		assertThat(dto.getName()).isEqualTo("핸드메이드 강아지 로프 장난감");
		
		
	}
	
//	@Test
//	public void 장바구니_물품_담기() {
//		// given
//		String email = "gh.yoon93@gmail.com";
//		Goods goods = Goods.builder().goodsId(1010001).build();
//		int cartCnt = 3;
//		CartSaveRequestDto requestDto = CartSaveRequestDto.builder()
//				.goods(goods)
//				.cartCnt(cartCnt).build();
//		
//		// when
//		long cartId = cartService.save(email, requestDto);
//		
//		
//		// then
//		Cart cart = cartDao.findById(cartId);
//		assertThat(cartCnt).isEqualTo(cart.getCartCnt());
//	}
//	
//	@Test
//	public void 장바구니_물품_목록() {
//		// given
//		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
//		Goods goods = Goods.builder().goodsId(1010001).build();
//		int cartCnt = 3;
//		
//		Cart cart = Cart.builder()
//				.member(member)
//				.goods(goods)
//				.cartCnt(cartCnt).build();
//		
//		cartDao.save(cart);
//		
//		// when
//		List<CartsResponseDto> carts = cartService.getCart("gh.yoon93@gmail.com");
//		
//		// then
//		List<Cart> all = cartDao.findAll();
//		assertThat(all.get(0).getGoods().getGoodsId()).isEqualTo(carts.get(0).getGoods().getGoodsId());
//	}
//	
//	@Test
//	public void 장바구니_물품_조회() {
//		// given
//		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
//		Goods goods = Goods.builder().goodsId(1010001).build();
//		int cartCnt = 3;
//		
//		Cart cart = Cart.builder()
//				.member(member)
//				.goods(goods)
//				.cartCnt(cartCnt).build();
//		
//		long exPectedCartId = cartDao.save(cart);
//		
//		// when
//		CartResponseDto expectedCart = cartService.findById(exPectedCartId);
//		
//		// then
//		assertThat(expectedCart.getCartCnt()).isEqualTo(cartCnt);
//	}
//	
//	@Test
//	public void 장바구니_물품_수량_변경() {
//		// given
//		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
//		Goods goods = Goods.builder().goodsId(1010001).build();
//		int cartCnt = 3;
//		
//		Cart cart = Cart.builder()
//				.member(member)
//				.goods(goods)
//				.cartCnt(cartCnt).build();
//		
//		long savedCartId = cartDao.save(cart);
//		
//		int expectedCartCnt = 5;
//		
//		CartUpdateRequestDto requestDto = CartUpdateRequestDto.builder()
//				.cartCnt(expectedCartCnt).build();
//		// when
//		cartService.update(savedCartId, requestDto);
//		
//		// then
//		List<Cart> carts = cartDao.findAll();
//		assertThat(carts.get(0).getCartCnt()).isEqualTo(expectedCartCnt);
//	}
//	@Test
//	public void 장바구니_물품_삭제() {
//		// given
//		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
//		Goods goods = Goods.builder().goodsId(1010001).build();
//		int cartCnt = 3;
//		
//		Cart cart = Cart.builder()
//				.member(member)
//				.goods(goods)
//				.cartCnt(cartCnt).build();
//		
//		long cartId = cartDao.save(cart);
//		
//		// when
//		cartService.delete(cartId);
//		
//		// then
//		List<Cart> all = cartDao.findAll();
//		assertThat(all).isEmpty();
//		
//	}
}
