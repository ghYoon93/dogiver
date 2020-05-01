package cart.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import cart.dto.CartSaveRequestDto;
import cart.service.CartService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class CartApiController {
	private final CartService cartService;
	
	@PostMapping("/api/v1/cart")
	public Long save(@RequestBody CartSaveRequestDto requestDto) {
		return cartService.save(requestDto);
	}
	
}
