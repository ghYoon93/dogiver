package cart.service;

import cart.dto.CartSaveRequestDto;

public interface CartService {
	public Long save(CartSaveRequestDto requestDto);

}
