package blood.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import blood.bean.DogJoinDTO;
import blood.bean.DogiverDTO;

@Repository("BloodDAO")
@Transactional
public class BloodDAOMybatis implements BloodDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int dogInsert(DogJoinDTO dogJoinDTO) {
		return sqlSession.insert("bloodSQL.dogInsert", dogJoinDTO);
	}

	@Override
	public List<DogiverDTO> getDogiver() {
		
		return sqlSession.selectList("bloodSQL.getDogiver");
	}

}
