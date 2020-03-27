package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import order.bean.CartDTO;
import order.service.OrderService;

@Controller
@RequestMapping(value="order")
@SessionAttributes({"memEmail"})
public class OrderController {
	@Autowired
	private OrderService orderService;
    @RequestMapping(value="order", method=RequestMethod.GET)
    public String order() {
    	return "/order/order"; //이동할 view의 이름 (.jsp)
    }
    @RequestMapping(value="cart", method=RequestMethod.GET)
    public String cart(Model model) {
    	model.addAttribute("memEmail", "ghyoon93@gmail.com");
    	return "/order/cart"; //이동할 view의 이름 (.jsp)
    	
    }
    @RequestMapping(value="getCart", method=RequestMethod.POST)
    public ModelAndView getCart(HttpSession session) {
    	String memEmail = (String)session.getAttribute("memEmail");
    	List<CartDTO> list = orderService.getCart(memEmail);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list",list);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    @RequestMapping(value="addCart", method=RequestMethod.GET)
    @ResponseBody
    public String addCart(@RequestParam String goods_id, @RequestParam String cart_cnt, HttpSession session) {
    	String memEmail = (String)session.getAttribute("memEmail");
    	System.out.println(memEmail);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("email", memEmail);
    	map.put("goods_id", goods_id);
    	CartDTO cartDTO = orderService.searchCart(map);
    	if(cartDTO == null) {
    		map.put("cart_cnt", cart_cnt);
    		orderService.insertCart(map);
    		return "notExist";
    	}
		return "exist";
    }
    @RequestMapping(value="updateCart", method=RequestMethod.GET)
    public String updateCart(@RequestParam String cart_id, @RequestParam String cnt) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("cart_id", cart_id);
    	map.put("cart_cnt", cnt);
    	orderService.updateCart(map);
    	return "redirect:/order/cart";
    }
    
    @RequestMapping(value="deleteCart", method=RequestMethod.GET)
    public String deleteCart(@RequestParam String[] checkGoods, Model model) {
    	Map<String, String[]> map = new HashMap<String, String[]>();
    	map.put("array", checkGoods);
    	orderService.deleteCart(map);
    	return "redirect:/order/cart";
    }
}
