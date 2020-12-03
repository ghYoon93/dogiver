package com.spare.dogiver.persistence.cartItem;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.spare.dogiver.domain.CartItem;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
public class CartItemDaoTest {
	@Autowired
	private CartItemMyBatis cartItemDao;
	
	
	@Test
	public void findAllByCartIdDesc() {
		long cartId = 3L;
		List<CartItem> cartItems = cartItemDao.findAllByCartIdDesc(cartId);
		CartItem cartItem = cartItems.get(0);
		assertThat(cartItem.getGoods().getId()).isEqualTo(1010001L);
	}

}
