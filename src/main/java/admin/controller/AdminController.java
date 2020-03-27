package admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "adminForm", method = RequestMethod.GET)
	public String admin(Model model) {
		model.addAttribute("display", "/admin/admin.jsp");
		return "/admin/adminForm";
	}
	
	@RequestMapping(value = "admin_dogiver", method = RequestMethod.GET)
	public String admin_dogiver(Model model) {
		
		model.addAttribute("display", "/admin/admin_dogiver.jsp");
		return "/admin/adminForm";
	}
	
	@RequestMapping(value = "getDogiver", method = RequestMethod.POST)
	public ModelAndView getDogiver() {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = adminService.getDogiver();
		
		mav.addObject("map", map);
		return mav;
	}

}
