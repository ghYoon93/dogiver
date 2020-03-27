package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blood.bean.DogiverDTO;

@Repository("AdminDAO")
@Transactional
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DogiverDTO> getDogiver(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getDogiver", map);
	}

	@Override
	public int getDogiverTotalA() {
		return sqlSession.selectOne("adminSQL.getDogiverTotalA");
	}

}
