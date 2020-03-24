package mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mail.service.MailService;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/mail/signMail")
	public @ResponseBody String signMail(@RequestParam String to, HttpSession session) {
		System.out.println("signMail = " + to);
		String code = mailService.signMail(to);
		session.setAttribute("auth", code);
		return code;
	}
}
