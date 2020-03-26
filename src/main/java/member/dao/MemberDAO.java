package member.dao;

import member.bean.MemberDTO;

public interface MemberDAO {

	public MemberDTO checkEmail(String email);

	public MemberDTO chkNickName(String nickName);

}
