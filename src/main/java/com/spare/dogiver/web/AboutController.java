package com.spare.dogiver.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("about")
public class AboutController {
	@RequestMapping(value = "about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	
	@RequestMapping(value = "team", method = RequestMethod.GET)
	public String team() {
		return "team";
	}
}
