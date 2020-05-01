package cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cart.dto.CartSaveRequestDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CartDaoMyBatis implements CartDao {
	private final SqlSession sqlSession;
	@Override
	public Long save(CartSaveRequestDto requestDto) {
		sqlSession.insert("cartSQL.save", requestDto);
		return null;
	}

}
