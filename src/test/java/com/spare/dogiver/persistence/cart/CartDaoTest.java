package com.spare.dogiver.persistence.cart;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spare.dogiver.domain.Cart;
import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.domain.Member;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.spare.dogiver.config.RootConfig.class})
public class CartDaoTest {
    @Autowired
    private CartDaoMyBatis cartDao;

    @Test
    public void 장바구니_등록() {
	    //given
	    String email = "gh.yoon93@gmail.com";
	    Member member = Member.builder().email(email).build();
	    
	    long goodsId = 1010001;
	    Goods goods = Goods.builder().goodsId(goodsId).build();
	    
	    int cartCnt = 3;
	
	    long cartId = cartDao.save(Cart.builder()
		    	    .member(member)
			        .goods(goods)
			        .cartCnt(cartCnt)
			        .build()).getCartId();
	
	    //when
	    List<Cart> cartList = cartDao.findAll();
	
	    //then
	    Cart cart = cartList.get(0);
	    assertThat(cart.getCartId()).isEqualTo(cartId);
	
    }
}
