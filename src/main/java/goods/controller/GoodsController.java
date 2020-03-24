package goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.service.GoodsService;

@Controller
@RequestMapping(value="goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="goodsList", method=RequestMethod.GET)
	public String goodsList(@RequestParam(required=false, defaultValue="1") String pg) {
		return "/goods/goodsList";
	}
	

	@RequestMapping(value="getGoodsList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getGoodsList(@RequestParam(required=false, defaultValue="1") String pg){
		System.out.println("cr");
		List<GoodsDTO> list = goodsService.getGoodsList(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}


}
