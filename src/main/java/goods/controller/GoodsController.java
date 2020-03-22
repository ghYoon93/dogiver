package goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="goods")
public class GoodsController {
	@RequestMapping(value="goodsList", method=RequestMethod.GET)
	public String goodsList() {
		return "/goods/goodsList";
	}


}
