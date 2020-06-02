package cart.dao;

import cart.dto.CartSaveRequestDto;

public interface CartDao {

	public Long save(CartSaveRequestDto requestDto);

}
