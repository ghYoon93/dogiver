package com.spare.dogiver.cartItem.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.ArgumentMatchers.any;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spare.dogiver.global.config.RootConfig;
import com.spare.dogiver.global.config.ServletConfig;
import com.spare.dogiver.cartItem.service.CartItemService;
import com.spare.dogiver.cartItem.dto.CartItemSaveRequestDto;



@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@WebAppConfiguration
public class CartItemControllerTests {
	@InjectMocks
	private CartItemController cartItemController;
	
	@Mock
	private CartItemService cartItemService;
	
	private MockMvc mockMvc;
	
	protected MockHttpSession session;

	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		this.mockMvc = MockMvcBuilders
				.standaloneSetup(cartItemController)
				.build();
		session = new MockHttpSession();
    	session.setAttribute("memEmail", "gh.yoon93@gmail.com");
		
	}

	@Test
	public void create() throws Exception {		
		CartItemSaveRequestDto cartItemSaveRequestDto = CartItemSaveRequestDto.builder()
				.goodsId(1010001L)
				.quantity(3)
				.build();
		
		given(cartItemService.addCartItem(any(), any())).willReturn(1L);
		
		
		mockMvc.perform(post("/api/v1/cartItem")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(new ObjectMapper().writeValueAsString(cartItemSaveRequestDto)))
		.andExpect(status().isCreated())
		.andExpect(header().string("location","/api/v1/cartItem/1"));
		
		verify(cartItemService).addCartItem(any(), any());
	}

}
