package goods.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<GoodsDTO> getGoodsList(String pg) {
		return sqlsession.selectList("???", pg);
	}

}
