package contact.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import contact.bean.ContactDTO;
import contact.service.ContactService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="contact")
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value="contactForm", method=RequestMethod.GET)
	public String contactForm() {
		return "/contact/contactForm";
	}
	
	@RequestMapping(value="contactWrite", method=RequestMethod.POST)
	public String contactWrite(ContactDTO contactDTO) {
		
		contactService.contactWrite(contactDTO);
		return "/contact/contactForm";

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
	
}
