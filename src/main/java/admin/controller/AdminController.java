package admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.Admin_dogiverPaging;
import admin.service.AdminService;
import blood.bean.DogiverDTO;

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
	public String admin_dogiver(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/admin/admin_dogiver.jsp");
		return "/admin/adminForm";
	}
	
	@RequestMapping(value = "getDogiver", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getDogiver(@RequestParam(required = false, defaultValue = "1") String pg) {
		List<DogiverDTO> list = adminService.getDogiver(pg);
		
		//페이징 처리
		Admin_dogiverPaging admin_dogiverPaging = adminService.admin_dogiverPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("admin_dogiverPaging", admin_dogiverPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "adminDogiverModify", method = RequestMethod.POST)
	@ResponseBody
	public String adminDogiverModify(@RequestParam Map<String, String> map, @RequestParam MultipartFile dog_image) {
		String filePath = "C:\\Users\\bitcamp\\Desktop\\dogiver\\src\\main\\webapp\\dogiverImage";
		String fileName = dog_image.getOriginalFilename();
		System.out.println(fileName);
		File file = new File(filePath, fileName);
		
		//파일복사
		try {
			FileCopyUtils.copy(dog_image.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		map.put("dog_image", fileName);
		
		System.out.println(map);
		int su = adminService.adminDogiverModify(map);
		return su+"";
	}


}
