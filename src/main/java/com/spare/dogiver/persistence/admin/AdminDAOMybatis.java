package com.spare.dogiver.persistence.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.web.dto.DogiverDTO;

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

	@Override
	public int adminDogiverModify(Map<String, String> map) {
	int su =sqlSession.update("adminSQL.adminDogiverModify", map);
		return su;
	}

	@Override
	public int dogiverInsert(Map<String, String> map) {
		
		return sqlSession.insert("adminSQL.dogiverInsert", map);
	}
}
