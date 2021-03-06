package com.spare.dogiver.web;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import com.spare.dogiver.global.config.RootConfig;
import com.spare.dogiver.global.config.ServletConfig;
import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.cart.service.CartServiceImpl;
import com.spare.dogiver.IndexController;
import com.spare.dogiver.cart.dto.CartResponseDto;

@RunWith(MockitoJUnitRunner.class)
//@RunWith(SpringRunner.class)
//@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
//@WebAppConfiguration
public class IndexControllerTest {
	@InjectMocks
	private IndexController indexController;
	
	@Mock
	private CartServiceImpl cartService;
	
	protected MockHttpSession session;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		this.mockMvc = MockMvcBuilders.standaloneSetup(indexController).build();
		session = new MockHttpSession();
    	session.setAttribute("memEmail", "gh.yoon93@gmail.com");
    	
	}
	
	
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void cart() throws Exception {
		// given
    	String email = (String)session.getAttribute("memEmail");
    	assertThat(email).isEqualTo("gh.yoon93@gmail.com");
    	
    	CartItem cartItem = CartItem.builder()
    			.id(1L)
    			.quantity(3)
    			.build();
    	
    	Goods goods = Goods.builder().id(1010001L).goodsPrice(2000).build();
    	
    	CartResponseDto dto = new CartResponseDto(cartItem);
    	
    	List<CartResponseDto> cart = new ArrayList();
    	cart.add(dto);
    	
    	Mockito.when(cartService.getCart(anyString())).thenReturn(cart);
    	    
    	mockMvc.perform(get("/cart")
    			.session(session))    	
    			.andExpect(status().isOk())
    			.andExpect(view().name("/cart/cart"));
    	
    	verify(cartService).getCart(anyString());
	}

}
