package blood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import blood.bean.DogJoinDTO;
import blood.service.BloodService;

@Controller
@RequestMapping("blood")
public class BloodController {
	@Autowired
	private BloodService bloodService;
	
	@RequestMapping(value = "dogInsert", method = RequestMethod.POST)
	@ResponseBody
	public String dogInsert(@ModelAttribute DogJoinDTO dogJoinDTO) {
		int su = bloodService.dogInsert(dogJoinDTO);
		return su+"";
	}
	
	@RequestMapping(value = "dogJoin", method = RequestMethod.GET)
	public String dogJoin() {
		return "/blood/dogJoin";
	}
	
	@RequestMapping(value = "dogiver", method = RequestMethod.GET)
	public String dogiver() {
		return "/blood/dogiver";
	}
	

}
