package member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.MemberPaging;
import member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceimpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberPaging memberPaging;
	
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
		System.out.println("chk nick = " + memberDTO);
		if (memberDTO == null) {
			return "non_exist";
		} else {
			return memberDTO.getNickName() + "";
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

	@Override
	public List<MemberDTO> getMemberList(String pg) {
		int pg2 = Integer.parseInt(pg);
		int listNum = 10;

		int endNum = pg2 * listNum;
		int startNum = endNum - (listNum - 1);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<MemberDTO> list = memberDAO.getMemberList(map);
		return list;
	}

	@Override
	public MemberPaging memberPaging(String pg) {
		int listNum = 10;
		int totalA = memberDAO.getTotalA();
		memberPaging.setCurrentPage(Integer.parseInt(pg));
		memberPaging.setPageBlock(5);
		memberPaging.setPageSize(listNum);
		memberPaging.setTotalA(totalA);
		memberPaging.makePagingHTML();
		return memberPaging;
	}

	@Override
	public String drop(MemberDTO memberDTO) {
		int su = memberDAO.drop(memberDTO);

		if (su == 1)
			return "삭제 완료!";
		else
			return "삭제 실패!";
	}

	@Override
	public String change(MemberDTO memberDTO) {
		int su = memberDAO.change(memberDTO);

		if (su == 1)
			return "수정 완료!";
		else
			return "수정 실패!";
	}
}
