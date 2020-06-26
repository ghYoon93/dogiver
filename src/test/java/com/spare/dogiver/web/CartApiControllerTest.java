package com.spare.dogiver.web;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spare.dogiver.config.RootConfig;
import com.spare.dogiver.config.ServletConfig;
import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;
import com.spare.dogiver.persistence.cart.CartDao;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@WebAppConfiguration
public class CartApiControllerTest {
	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private CartDao cartDao;
    
    private MockMvc mockMvc;
    @Before
    public void setUp() {
    	this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    
    @Test
    public void Cart_목록() throws Exception {
    	// given
    	String email = "gh.yoon93@gmail.com";
    	String goodsName = "핸드메이드 강아지 로프 장난감";
    	// when
    	List<Cart> cartList = cartDao.findAllByEmailDesc(email);
    	String expectedGoodsName = cartList.get(0).getGoods().getGoodsName();
    	
    	// then
    	assertThat(goodsName).isEqualTo(expectedGoodsName);
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
	    		.member(member)
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
	    
    	Cart savedCart = cartDao.save(Cart.builder()
    			.member(member)
    			.goods(goods)
    			.cartCnt(cartCnt).build());
    	
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
