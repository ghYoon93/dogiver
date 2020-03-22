package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceimpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
}
