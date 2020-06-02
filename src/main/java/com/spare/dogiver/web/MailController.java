package com.spare.dogiver.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spare.dogiver.service.mail.MailService;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/mail/signMail")
	public @ResponseBody void signMail(@RequestParam String to, @RequestParam int random,HttpSession session) {
		mailService.signMail(to,random,session);
	}
}
