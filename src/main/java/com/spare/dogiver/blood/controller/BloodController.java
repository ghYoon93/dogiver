package com.spare.dogiver.blood.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spare.dogiver.blood.dto.DogJoinDTO;
import com.spare.dogiver.blood.dto.DogiverDTO;
import com.spare.dogiver.blood.service.BloodService;

import lombok.extern.log4j.Log4j;

@Log4j
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
		System.out.println("getDogiver");
		List<DogiverDTO> list = bloodService.getDogiver();
		System.out.println(list.get(1));
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
