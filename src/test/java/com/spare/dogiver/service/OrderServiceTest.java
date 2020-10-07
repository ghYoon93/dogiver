package com.spare.dogiver.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spare.dogiver.service.order.OrderService;
import com.spare.dogiver.web.dto.CheckoutRequestDto;
import com.spare.dogiver.web.dto.CheckoutResponseDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.spare.dogiver.config.RootConfig.class })
public class OrderServiceTest {
    @Autowired
    private OrderService orderService;
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		String email = "gh.yoon93@gmail.com";
		long goodsId = 1010001;
		int quantity = 3;
		CheckoutRequestDto request= CheckoutRequestDto.builder()
				.goodsId(goodsId)
				.quantity(quantity).build();
		
		
		CheckoutResponseDto response = orderService.getCheckout(email, request);
		assertThat(response.getGoods().getGoodsName()).isEqualTo("asd");
	}

}
