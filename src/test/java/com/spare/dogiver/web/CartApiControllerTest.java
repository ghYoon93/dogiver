package com.spare.dogiver.web;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
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
import com.spare.dogiver.config.RootConfig;
import com.spare.dogiver.config.ServletConfig;
import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.CartItem;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.service.cart.CartService;
import com.spare.dogiver.service.cart.CartServiceImpl;
import com.spare.dogiver.web.dto.CartResponseDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@WebAppConfiguration
public class CartApiControllerTest {
	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private CartDao cartDao;
	
	protected MockHttpSession session;
	
    private MockMvc mockMvc;

    @Mock
	private CartServiceImpl cartService;
    
    @Before
    public void setUp() {
    	MockitoAnnotations.initMocks(this);
    	this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    	session = new MockHttpSession();
    	session.setAttribute("email", "gh.yoon93@gmail.com");
    }
    
    @Test
    public void list() throws Exception {
    	// given
    	String email = (String)session.getAttribute("email");
    	assertThat(email).isEqualTo("gh.yoon93@gmail.com");
    	List<CartResponseDto> cart = new ArrayList();
    	
    	CartItem cartItem = CartItem.builder()
    			.id(1L)
    			.cartCnt(3)
    			.build();
    	
    	Goods goods = Goods.builder().goodsId(1010001L).goodsPrice(2000).build();
    	
    	cart.add(new CartResponseDto(cartItem, goods));
    	
    	Mockito.when(cartService.getCart("email")).thenReturn(cart);
//    	BDDMockito.given(cartService.getCart(email)).willReturn(cart);
    	
    	mockMvc.perform(get("/cart")
    			.session(session))    	
    			.andExpect(status().isOk())
    			.andExpect(view().name("/cart/cart"))
    			.andExpect(model().attribute("cart", Matchers.hasProperty("cart", is(cart))));
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
    
    @Ignore
    @Test
    public void Cart_물품() throws Exception {
    	// given
		Member member = Member.builder().email("gh.yoon93@gmail.com").build();
		Goods goods = Goods.builder().goodsId(1010001).build();
		int cartCnt = 3;
		
		Cart cart = Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build();
		
		long cartId = cartDao.save(cart);
		
    	String email = "gh.yoon93@gmail.com";
    	String url= "/api/v1/cart/"+cartId;
    	
    	// when
        mockMvc.perform(get(url)
        .contentType(MediaType.APPLICATION_JSON_UTF8))
        .andExpect(status().isOk());
        
    	// then
        List<Cart> all = cartDao.findAll();
        assertThat(all.get(0).getCartCnt()).isEqualTo(cartCnt);
    }
    
    @Ignore
    @Test
    public void Cart_등록() throws Exception {
    	// given
	    String email = "gh.yoon93@gmail.com";
	    Member member = Member.builder().email(email).build();
	    
	    long goodsId = 1010001;
	    Goods goods = Goods.builder().goodsId(goodsId).build();
	    
	    int cartCnt = 3;
	    
	    CartSaveRequestDto requestDto = CartSaveRequestDto.builder()
	    		.goods(goods)
	    		.cartCnt(cartCnt)
	    		.build();
	    
	    String url = "/api/v1/cart";
    	
	    //when
	    mockMvc.perform(post(url)
	    		.contentType(MediaType.APPLICATION_JSON_UTF8)
	    		.content(new ObjectMapper().writeValueAsString(requestDto)))
	    .andExpect(status().isOk());
	    
	    //then
	    List<Cart> all = cartDao.findAll();
	    assertThat(all.get(0).getMember().getEmail()).isEqualTo(email);
	    assertThat(all.get(0).getCartCnt()).isEqualTo(cartCnt);
	    assertThat(all.get(0).getGoods().getGoodsId()).isEqualTo(goodsId);
    }
    
    @Ignore
    @Test
    public void Cart_수정() throws Exception{
    	// given
	    String email = "gh.yoon93@gmail.com";
	    Member member = Member.builder().email(email).build();
	    
	    long goodsId = 1010001;
	    Goods goods = Goods.builder().goodsId(goodsId).build();
	    
	    int cartCnt = 3;
	    
	    long cartId =  cartDao.save(Cart.builder()
    			.member(member)
    			.goods(goods)
    			.cartCnt(cartCnt).build());

    	Cart savedCart = cartDao.findById(cartId);
    	
    	long updateCartId = savedCart.getCartId();
    	int expectedCartCnt = 4;
    	
    	CartUpdateRequestDto requestDto = CartUpdateRequestDto.builder()
    			.cartCnt(expectedCartCnt).build();
    	
    	
    	
    	String url = "/api/v1/cart/"+updateCartId;
    	
    	// when
    	mockMvc.perform(put(url)
    			.contentType(MediaType.APPLICATION_JSON_UTF8)
    			.content(new ObjectMapper().writeValueAsString(requestDto)))
    	.andExpect(status().isOk());
    	
    	// then
    	List<Cart> all = cartDao.findAll();
    	assertThat(all.get(0).getCartCnt()).isEqualTo(expectedCartCnt);
    }
}
