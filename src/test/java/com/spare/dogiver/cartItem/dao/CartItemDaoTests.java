package com.spare.dogiver.cartItem.dao;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.cartItem.domain.CartItem;
import com.spare.dogiver.cartItem.dto.CartItemSaveRequestDto;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
@Transactional
public class CartItemDaoTests {
	@Autowired
	private CartItemDaoMyBatis cartItemDao;
	
	
	@Test
	public void findAllByCartIdDesc() {
		long cartId = 3L;
		List<CartItem> cartItems = cartItemDao.findAllByCartIdDesc(cartId);
		CartItem cartItem = cartItems.get(0);
		assertThat(cartItem.getGoods().getId()).isEqualTo(1010001L);
	}
	
	@Test
	public void save() {
		CartItemSaveRequestDto cartItemSaveRequestDto = CartItemSaveRequestDto.builder()
				.goodsId(1010001L)
				.quantity(3)
				.build();
		CartItem saved = cartItemDao.save(cartItemSaveRequestDto.toEntity(3L));
		assertThat(saved.getId()).isEqualTo(3L);
	}

}
