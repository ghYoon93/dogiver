package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

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
	public int modi(MemberDTO memberDTO) {
		return sqlSession.update("memberSQL.modi",memberDTO);
	}
}
