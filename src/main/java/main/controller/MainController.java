package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "main")
public class MainController {

	@RequestMapping(value = "index")
	public String index() {
		return "index";
	}
}
