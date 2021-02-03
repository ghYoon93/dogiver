package com.spare.dogiver.cart.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.CoreMatchers.is;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spare.dogiver.global.config.RootConfig;
import com.spare.dogiver.global.config.ServletConfig;
import com.spare.dogiver.cart.domain.Cart;
import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.cart.dao.CartDao;
import com.spare.dogiver.cart.service.CartService;
import com.spare.dogiver.cart.service.CartServiceImpl;
import com.spare.dogiver.cart.dto.CartResponseDto;
import com.spare.dogiver.cart.dto.CartSaveRequestDto;
import com.spare.dogiver.cart.dto.CartUpdateRequestDto;

@RunWith(MockitoJUnitRunner.class)
@WebAppConfiguration
public class CartApiControllerTest {
	@InjectMocks
	private CartApiController cartApiController;
	
	@Mock
	private CartService cartService;
	
	protected MockHttpSession session;
	
    private MockMvc mockMvc;

    
    @Before
    public void setUp() {
    	this.mockMvc = MockMvcBuilders.standaloneSetup(cartApiController).build();
    	session = new MockHttpSession();
    	session.setAttribute("memEmail", "gh.yoon93@gmail.com");
    }
    
    @Test
    public void list() throws Exception {
    	// given
    	String email = (String)session.getAttribute("memEmail");
    	assertThat(email).isEqualTo("gh.yoon93@gmail.com");
    	List<CartResponseDto> cart = new ArrayList();
    	
    	CartItem cartItem = CartItem.builder()
    			.id(1L)
    			.quantity(3)
    			.build();
    	
    	Goods goods = Goods.builder().id(1010001L).goodsPrice(2000).build();
    	
    	cart.add(new CartResponseDto(cartItem));
    	
    	BDDMockito.given(cartService.getCart(email)).willReturn(cart);
    	
    	mockMvc.perform(get("/api/v1/cart")
    			.session(session))
    			.andExpect(status().isOk())
    			.andExpect(content().string(containsString("\"id\" : ")));
    	verify(cartService).getCart(anyString());
    	
    }
    
//    @Ignore
//    @Test
//    public void Cart_목록() throws Exception {
//    	// given
//    	String email = "gh.yoon93@gmail.com";
//    	String goodsName = "핸드메이드 강아지 로프 장난감";
//    	// when
//    	List<CartItem> cart = cartDao.findAllByEmailDesc(email);
//    	String expectedGoodsName = cart.get(0).getGoods().getGoodsName();
//    	
//    	// then
//    	assertThat(goodsName).isEqualTo(expectedGoodsName);
//    }
    
//    @Ignore
//    @Test
//    public void Cart_물품() throws Exception {
//    	// given
//		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
//		Goods goods = Goods.builder().goodsId(1010001L).build();
//		int cartCnt = 3;
//		
//		Cart cart = Cart.builder().build();
//		
//		long cartId = cartDao.save(cart);
//		
//    	String email = "gh.yoon93@gmail.com";
//    	String url= "/api/v1/cart/"+cartId;
//    	
//    	// when
//        mockMvc.perform(get(url)
//        .contentType(MediaType.APPLICATION_JSON_UTF8))
//        .andExpect(status().isOk());
//        
//    	// then
//        List<Cart> all = cartDao.findAll();
//        assertThat(all.get(0).getCartCnt()).isEqualTo(cartCnt);
//    }
//    
//    @Ignore
//    @Test
//    public void Cart_등록() throws Exception {
//    	// given
//	    String email = "gh.yoon93@gmail.com";
//	    Member member = Member.builder().email(email).build();
//	    
//	    long goodsId = 1010001;
//	    Goods goods = Goods.builder().goodsId(goodsId).build();
//	    
//	    int cartCnt = 3;
//	    
//	    CartSaveRequestDto requestDto = CartSaveRequestDto.builder()
//	    		.goods(goods)
//	    		.cartCnt(cartCnt)
//	    		.build();
//	    
//	    String url = "/api/v1/cart";
//    	
//	    //when
//	    mockMvc.perform(post(url)
//	    		.contentType(MediaType.APPLICATION_JSON_UTF8)
//	    		.content(new ObjectMapper().writeValueAsString(requestDto)))
//	    .andExpect(status().isOk());
//	    
//	    //then
//	    List<Cart> all = cartDao.findAll();
////	    assertThat(all.get(0).getMember().getEmail()).isEqualTo(email);
//	    assertThat(all.get(0).getCartCnt()).isEqualTo(cartCnt);
////	    assertThat(all.get(0).getGoods().getGoodsId()).isEqualTo(goodsId);
//    }
//    
//    @Ignore
//    @Test
//    public void Cart_수정() throws Exception{
//    	// given
//	    String email = "gh.yoon93@gmail.com";
//	    Member member = Member.builder().email(email).build();
//	    
//	    long goodsId = 1010001;
//	    Goods goods = Goods.builder().goodsId(goodsId).build();
//	    
//	    int cartCnt = 3;
//	    
//	    long cartId =  cartDao.save(Cart.builder()
//    			.build());
//
//    	Cart savedCart = cartDao.findById(cartId);
//    	
//    	long updateCartId = savedCart.getId();
//    	int expectedCartCnt = 4;
//    	
//    	CartUpdateRequestDto requestDto = CartUpdateRequestDto.builder()
//    			.cartCnt(expectedCartCnt).build();
//    	
//    	
//    	
//    	String url = "/api/v1/cart/"+updateCartId;
//    	
//    	// when
//    	mockMvc.perform(put(url)
//    			.contentType(MediaType.APPLICATION_JSON_UTF8)
//    			.content(new ObjectMapper().writeValueAsString(requestDto)))
//    	.andExpect(status().isOk());
//    	
//    	// then
//    	List<Cart> all = cartDao.findAll();
//    	assertThat(all.get(0).getCartCnt()).isEqualTo(expectedCartCnt);
//    }
}
