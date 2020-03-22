package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	/*
	 * @Autowired BCryptPasswordEncoder pwdEncoder;
	 */
	
	@RequestMapping(value="sign_up/sign_up_step1")
	public String sign_up_step1() {
		return "sign_up_step1";
	}
	//회원 가입
}
