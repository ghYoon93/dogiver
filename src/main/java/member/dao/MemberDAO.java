package member.dao;

import member.bean.MemberDTO;

public interface MemberDAO {

	public MemberDTO checkEmail(String email);

	public MemberDTO chkNickName(String nickName);

	public int sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);

	public int modi(MemberDTO memberDTO);

}
