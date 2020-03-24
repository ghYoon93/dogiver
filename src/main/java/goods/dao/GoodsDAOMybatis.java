package goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import goods.bean.GoodsDTO;

public class GoodsDAOMybatis implements GoodsDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<GoodsDTO> getGoodsList(int pg) {
		return sqlsession.selectList("", pg);
	}

}
