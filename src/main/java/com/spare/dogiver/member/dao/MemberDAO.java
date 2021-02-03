package com.spare.dogiver.member.dao;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.member.dto.MemberDTO;


public interface MemberDAO {

	public MemberDTO checkEmail(String email);

	public MemberDTO chkNickName(String nickName);

	public int sign(MemberDTO memberDTO);

	public MemberDTO getMember(String email);
	
	public Member find(String email);

	public int modi(MemberDTO memberDTO);

	public List<MemberDTO> getMemberList(Map<String, Integer> map);

	public int getTotalA();

	public int change(MemberDTO memberDTO);

	public int drop(MemberDTO memberDTO);

}
