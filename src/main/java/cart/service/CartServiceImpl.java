package cart.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cart.dao.CartDao;
import cart.dto.CartSaveRequestDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService {
	private final CartDao cartDao;
	
	@Transactional
	@Override
	public Long save(CartSaveRequestDto requestDto) {
		return cartDao.save(requestDto);
	}

}
