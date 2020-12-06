package com.spare.dogiver.service.cartItem;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.CartItem;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.persistence.cartItem.CartItemDao;
import com.spare.dogiver.service.cart.CartServiceImpl;
import com.spare.dogiver.web.dto.CartItemSaveRequestDto;

public class CartItemServiceImplTests {
    private CartItemService cartItemService;
    
    @Mock
    CartDao cartDao;
    
    @Mock
    CartItemDao cartItemDao;
    
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockCartDao();
		mockCartItemDao();
		this.cartItemService = new CartItemServiceImpl(cartDao, cartItemDao);
	}
	
	private void mockCartDao() {
		String email = "gh.yoon93@gmail.com";
		Cart cart = Cart.builder()
				.id(1L)
				.email(email)
				.build();
		given(cartDao.findByEmail(email)).willReturn(Optional.of(cart));
	}
	
	private void mockCartItemDao() {
	}

	@Test
	public void addCartItem() {
		given(cartItemDao.save(any())).will(invocation -> {
			CartItem cartItem = invocation.getArgument(0);
			CartItem saved = CartItem.builder()
					.id(1L)
					.cartId(cartItem.getCartId())
					.build();
			return saved;
		});
		String email = "gh.yoon93@gmail.com";
		CartItemSaveRequestDto cartItemSaveRequestDto = CartItemSaveRequestDto.builder()
				.goodsId(1010001L)
				.quantity(3)
				.build();
		Long savedId = cartItemService.addCartItem(email, cartItemSaveRequestDto);
		assertThat(savedId).isEqualTo(1L);
	}

}
