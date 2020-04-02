package member.service;

import java.util.List;

import member.bean.MemberDTO;
import member.bean.MemberPaging;

public interface MemberService {

	public String checkEmail(String email);

	public String chkNickName(String nickName);

	public String sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);

	public String modi(MemberDTO memberDTO);

	public List<MemberDTO> getMemberList(String pg);

	public MemberPaging memberPaging(String pg);

	public String drop(MemberDTO memberDTO);

	public String change(MemberDTO memberDTO);

}
