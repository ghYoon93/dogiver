package blood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import blood.bean.DogJoinDTO;
import blood.bean.DogiverDTO;
import blood.service.BloodService;

@Controller
@RequestMapping("blood")
public class BloodController {
	@Autowired
	private BloodService bloodService;
	
	@RequestMapping(value = "bloodNow", method = RequestMethod.GET)
	public String bloodNow() {
		return "/blood/bloodNow";
	}
	
	@RequestMapping(value = "dogJoin", method = RequestMethod.GET)
	public String dogJoin() {
		return "/blood/dogJoin";
	}
	
	@RequestMapping(value = "dogiver", method = RequestMethod.GET)
	public String dogiver() {
		return "/blood/dogiver";
	}
	
	@RequestMapping(value = "hospital", method = RequestMethod.GET)
	public String hospital() {
		return "/blood/hospital";
	}
	
	
	@RequestMapping(value = "dogInsert", method = RequestMethod.POST)
	@ResponseBody
	public String dogInsert(@ModelAttribute DogJoinDTO dogJoinDTO) {
		int su = bloodService.dogInsert(dogJoinDTO);
		return su+"";
	}
	
	@RequestMapping(value = "getDogiver", method = RequestMethod.POST)
	public ModelAndView getDogiver() {
		List<DogiverDTO> list = bloodService.getDogiver();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "myblood", method = RequestMethod.GET)
	public String myblood() {
		return "/my/myblood";
	}
	
	@RequestMapping(value = "getMyblood", method = RequestMethod.POST)
	public ModelAndView getMyblood(HttpSession session ) {
		String email = (String) session.getAttribute("memEmail");
		DogJoinDTO dogJoinDTO = bloodService.getMyblood(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dogJoinDTO", dogJoinDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "mybloodModify", method = RequestMethod.POST)
	public void mybloodModify(DogJoinDTO dogJoinDTO) {
		bloodService.mybloodModify(dogJoinDTO);
	}
	

}
