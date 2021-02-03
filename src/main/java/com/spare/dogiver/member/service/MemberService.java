package com.spare.dogiver.member.service;

import java.util.List;

import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.member.domain.MemberPaging;
import com.spare.dogiver.member.dto.MemberDTO;

public interface MemberService {

	public String checkEmail(String email);

	public String chkNickName(String nickName);

	public String sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);
	
	public Member find(String email);

	public String modi(MemberDTO memberDTO);

	public List<MemberDTO> getMemberList(String pg);

	public MemberPaging memberPaging(String pg);

	public String drop(MemberDTO memberDTO);

	public String change(MemberDTO memberDTO);

}
