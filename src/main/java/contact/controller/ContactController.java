package contact.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contact.bean.ContactDTO;
import contact.service.ContactService;

@Controller
@RequestMapping(value="contact")
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value="contactForm", method=RequestMethod.GET)
	public String contactForm() {
		return "/contact/contactForm";
	}
	
	@RequestMapping(value="my_contact", method=RequestMethod.GET)
	public String my_contact() {
		return "/contact/my_contact";
	}
	
	@RequestMapping(value="contactWrite", method=RequestMethod.POST)
	@ResponseBody
	public void contactWrite(ContactDTO contactDTO) {
		contactService.contactWrite(contactDTO);

	}
	
	@RequestMapping(value="admin_contactForm", method=RequestMethod.GET)
	public String admin_contactForm() {
		return "/contact/admin_contactForm";
	}
	
	@RequestMapping(value="contactList", method=RequestMethod.POST)
	public ModelAndView contactList() {
		List<ContactDTO> list = contactService.contactList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="admin_contect_delete", method=RequestMethod.POST)
	@ResponseBody
	public void admin_contect_delete(@RequestParam String seq) {
		contactService.admin_contect_delete(seq);
	}
	@RequestMapping(value="my_contect_delete", method=RequestMethod.POST)
	@ResponseBody
	public void my_contect_delete(@RequestParam String seq) {
		contactService.my_contect_delete(seq);
	}
	
	@RequestMapping(value = "getInfo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getInfo(HttpSession session) {
		String email= (String) session.getAttribute("memEmail");
		List<ContactDTO> list = contactService.getInfo(email);
		System.out.println(list);
		System.out.println("aa");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	

}
