package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public MemberDTO checkEmail(String email);

	public MemberDTO chkNickName(String nickName);

	public int sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);

	public int modi(MemberDTO memberDTO);

	public List<MemberDTO> getMemberList(Map<String, Integer> map);

	public int getTotalA();

	public int change(MemberDTO memberDTO);

	public int drop(MemberDTO memberDTO);

}
