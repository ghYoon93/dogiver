package com.spare.dogiver.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spare.dogiver.service.cart.CartService;
import com.spare.dogiver.web.dto.CartSaveRequestDto;
import com.spare.dogiver.web.dto.CartUpdateRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class CartApiController {
	@Autowired
	private final CartService cartService;
	
	@PostMapping("/api/v1/cart")
	public Long save(@RequestBody CartSaveRequestDto requestDto) {
		return cartService.save(requestDto);
	}
	
	@PutMapping("/api/v1/cart/{cartId}")
	public Long update(@PathVariable Long cartId,
			@RequestBody CartUpdateRequestDto requestDto) {
		return cartService.update(cartId, requestDto);
//		return CartService.update(id, requestDto);
	}
}
