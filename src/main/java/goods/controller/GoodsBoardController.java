package goods.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import goods.service.GoodsService;

@Controller
@RequestMapping(value="goods")
public class GoodsBoardController {
	@Autowired
	private GoodsService goodsService;
	
	
	
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public String goodsDetail(@RequestParam String goods_id, Model model) {
		model.addAttribute("goods_id", goods_id);
		return "/goods/qna";
	}

	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String qnaWrite(@RequestParam Map<String, String> map, Model model) {
		//System.out.println(map);
		int result = goodsService.qnaWrite(map);
		model.addAttribute("goods_id", map.get("goods_id"));
		return "/goods/goodsDetail";
	}
	
	
//	
//	@RequestMapping(value="review", method=RequestMethod.GET)
//	public String review(@RequestParam(required=false, defaultValue="1") String seq, Model model) {
//		return "/goods/review";
//	}
//	
//	@RequestMapping(value="reviewWrite", method=RequestMethod.GET)
//	public String reviewWrite(@RequestParam(required=false, defaultValue="1") String seq, Model model) {
//		return "/goods/reviewWrite";
//	}
//	
//	@RequestMapping(value="insertReview", method=RequestMethod.POST)
//	@ResponseBody
//	public void insertReview(Map<String, String> map) {
////		System.out.println(map.put("reviewText", reviewText));
//	}
}
