package com.spare.dogiver.persistence.cart;

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

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
public class CartDaoTest {
	@Autowired
	private CartDaoMyBatis cartDao;
    
	@Before
	public void cleanUp() {
		cartDao.deleteAll();
	}

	@Test
	public void testFindAllByEmailDesc() {
		// given
		String email = "gh.yoon93@gmail.com";
		Member member = Member.builder()
				.email(email).build();

		long goodsId = 1010001;
		Goods goods = Goods.builder()
				.goodsId(goodsId).build();

		int cartCnt = 3;

		long cartId = cartDao.save(Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build());

		// when
		List<Cart> carts = cartDao.findAllByEmailDesc(email);

		// then
		Cart cart = carts.get(0);
		assertThat(member.getEmail()).isEqualTo(email);
		assertThat(goods.getGoodsId()).isEqualTo(goodsId);
		assertThat(cart.getCartId()).isEqualTo(cartId);

	}

	@Test
	public void testSave() { 
		// given 
		String email = "gh.yoon93@gmail.com";
		Member member = Member.builder().email(email).build();

		long goodsId = 1010001;
		Goods goods = Goods.builder().goodsId(goodsId).build();

		int cartCnt = 3;

		long cartId = cartDao.save(Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build());

		assertThat(cartId).isNotNull();

	}

	@Test
	public void testFindById() {
		// given 
		String email = "gh.yoon93@gmail.com";
		Member member = Member.builder().email(email).build();

		long goodsId = 1010001;
		Goods goods = Goods.builder().goodsId(goodsId).build();

		int cartCnt = 3;

		long cartId = cartDao.save(Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build());
		
		Cart cart = cartDao.findById(cartId);
		
		assertThat(cart.getCartId()).isEqualTo(cartId);
	}

	@Test
	public void testUpdate() {
		// given 
		String email = "gh.yoon93@gmail.com";
		Member member = Member.builder().email(email).build();

		long goodsId = 1010001;
		Goods goods = Goods.builder().goodsId(goodsId).build();

		int cartCnt = 3;

		long cartId = cartDao.save(Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build());
		
		Cart cart = cartDao.findById(cartId);
		
		int expectedCartCnt = 1;
		cart.update(expectedCartCnt);
		
		cartDao.update(cart);
		
		List<Cart> carts = cartDao.findAll();
		
		assertThat(carts.get(0).getCartCnt()).isEqualTo(expectedCartCnt);
		
	}

	@Test
	public void testDelete() {
		// given 
		String email = "gh.yoon93@gmail.com";
		Member member = Member.builder().email(email).build();

		long goodsId = 1010001;
		Goods goods = Goods.builder().goodsId(goodsId).build();

		int cartCnt = 3;

		long cartId = cartDao.save(Cart.builder()
				.member(member)
				.goods(goods)
				.cartCnt(cartCnt).build());
		
		cartDao.delete(cartId);
		
		List<Cart> carts = cartDao.findAll();
		
		assertThat(carts).isEmpty();
	}
}
