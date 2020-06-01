package com.spare.dogiver.web;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import cart.dto.CartSaveRequestDto;
import cart.dto.CartUpdateRequestDto;
import cart.service.CartService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class CartApiController {
	private final CartService cartService;
	
	@PostMapping("/cart")
	public Long save(@RequestBody CartSaveRequestDto requestDto) {
		return cartService.save(requestDto);
	}
	
	@PutMapping("/cart/{id}")
	public Long update(@PathVariable Long id,
			@RequestBody CartUpdateRequestDto requestDto) {
		return 0L;
//		return CartService.update(id, requestDto);
	}
}
