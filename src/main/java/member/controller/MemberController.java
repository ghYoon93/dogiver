package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/sign_up/step1", method = RequestMethod.GET)
	public String step1(Model model,HttpSession session) {
		model.addAttribute("step1");
		session.setAttribute("auth", "12@17!3#8");
		return "step1";
	}
	
	@RequestMapping(value = "/sign_up/checkEmail", method = RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email) {
		System.out.println(email);
		return memberService.checkEmail(email);
	}

	
	@RequestMapping(value = "/sign_up/step2")
	public String step2(@RequestParam String auth,Model model,HttpSession session) {
		System.out.println("memberC = "+auth);
		System.out.println("memberC session = "+session.getAttribute("auth"));
		
		if(session.getAttribute("auth").equals(auth)) {
			model.addAttribute("../sign_up/step2");			
		}else {
			model.addAttribute("404");
		}
		return "step2";
	}
}
