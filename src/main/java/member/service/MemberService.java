package member.service;

import member.bean.MemberDTO;

public interface MemberService {

	public String checkEmail(String email);

	public String chkNickName(String nickName);

	public String sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);

}
