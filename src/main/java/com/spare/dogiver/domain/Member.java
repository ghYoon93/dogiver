package com.spare.dogiver.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Member {
	private int seq;
	private String email;
	private String name;
	private String nickname;
	private String pwd;
	private String phone;
	private String zipcode;
	private String addr;
	private String addrDetail;
	private String registDate;
	private String dropDate;
	private String dropYn;
	private String role;
	private String emailYn;
	
	@Builder
	public Member(String email, String name, String nickname, String pwd,
			String phone, String zipcode, String addr, String addrDetail) {
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.pwd = pwd;
		this.phone = phone;
		this.zipcode = zipcode;
		this.addr = addr;
		this.addrDetail = addrDetail;
	}
	
	public void update() {
		
	}
}
