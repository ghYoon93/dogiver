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
		if(memberDTO == null) {
			return "non_exist";
		}else {
			return "exist";
		}
	}
}
