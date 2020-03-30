package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceimpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public String checkEmail(String email) {
		MemberDTO memberDTO = memberDAO.checkEmail(email);
		if (memberDTO == null) {
			return "non_exist";
		} else {
			return "exist";
		}
	}

	@Override
	public String chkNickName(String nickName) {
		MemberDTO memberDTO = memberDAO.chkNickName(nickName);
		System.out.println("chk nick = "+ memberDTO);
		if (memberDTO == null) {
			return "non_exist";
		} else {
			return memberDTO.getNickName()+"";
		}
	}

	@Override
	public String sign(MemberDTO memberDTO) {
		int su = memberDAO.sign(memberDTO);

		if (su == 1)
			return "complete";
		else
			return "fail";
	}

	@Override
	public MemberDTO getMember(String email) {
		return memberDAO.getMember(email);
	}

	@Override
	public String modi(MemberDTO memberDTO) {
		int su = memberDAO.modi(memberDTO);

		if (su == 1)
			return "complete";
		else
			return "fail";
	}
}
