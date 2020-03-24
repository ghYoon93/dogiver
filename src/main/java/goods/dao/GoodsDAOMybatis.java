package goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;

@Repository
@Transactional
public class GoodsDAOMybatis implements GoodsDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<GoodsDTO> getGoodsList(int pg) {
		return sqlsession.selectList("goodsSQL.getGoodsList", pg);
	}

}
