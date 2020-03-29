package contact.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="boardTableForm", method=RequestMethod.GET)
	public String boardTableForm() {
		return "/board/boardTableForm";
	}
	
}
