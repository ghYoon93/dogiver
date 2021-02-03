package com.spare.dogiver.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.member.dto.MemberDTO;

@Repository("memberDAO")
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO checkEmail(String email) {
		return sqlSession.selectOne("memberSQL.checkEmail", email);
	}

	@Override
	public MemberDTO chkNickName(String nickName) {
		return sqlSession.selectOne("memberSQL.checkNickName", nickName);
	}

	@Override
	public int sign(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.sign",memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return sqlSession.selectOne("memberSQL.checkEmail",email);
	}
	@Override
	public Member find(String email) {
		return sqlSession.selectOne("memberSQL.find",email);
	}

	@Override
	public int modi(MemberDTO memberDTO) {
		return sqlSession.update("memberSQL.modi",memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList(Map<String, Integer> map) {
		return sqlSession.selectList("memberSQL.getMemberList", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("memberSQL.getTotalA");
	}

	@Override
	public int change(MemberDTO memberDTO) {
		return sqlSession.update("memberSQL.change",memberDTO);
	}

	@Override
	public int drop(MemberDTO memberDTO) {
		return sqlSession.delete("memberSQL.drop",memberDTO);
	}
}
