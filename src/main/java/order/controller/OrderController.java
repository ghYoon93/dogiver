package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.bean.MemberDTO;
import member.service.MemberService;
import order.bean.CartDTO;
import order.bean.OrderDTO;
import order.bean.OrderDetailDTO;
import order.service.OrderService;

@Controller
@RequestMapping(value="order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
    @RequestMapping(value="order", method=RequestMethod.POST)
    public String order(@RequestParam(required=false, defaultValue="buyNow") String[] checkGoods,
    		            @RequestParam(required=false, defaultValue="0") int goods_id,
    		            @RequestParam(required=false, defaultValue="0") int cart_cnt,
    		            HttpSession session,
    		            Model model) {
    	String email = (String) session.getAttribute("memEmail");
    	MemberDTO memberDTO = memberService.getMember(email);
    	model.addAttribute("memberDTO", memberDTO);
    	if(checkGoods[0].equals("buyNow")) {
    	    	 
    	}else {
    		model.addAttribute("checkGoods", checkGoods);
    	}
    	return "/order/order"; //이동할 view의 이름 (.jsp)
    }
    @RequestMapping(value="cart", method=RequestMethod.GET)
    public String cart() {
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
    
    @RequestMapping(value="deleteCart", method=RequestMethod.POST)
    public String deleteCart(@RequestParam String[] checkGoods, Model model) {
    	Map<String, String[]> map = new HashMap<String, String[]>();
    	map.put("array", checkGoods);
    	orderService.deleteCart(map);
    	return "redirect:/order/cart";
    }
    
    @RequestMapping(value="getOrderList", method=RequestMethod.POST)
    @ResponseBody
    public ModelAndView getOrderList(@RequestParam String[] orderList) {
    	Map<String, String[]>map = new HashMap<String, String[]>();
    	for(int i=0; i < orderList.length; i++) {
    		System.out.println("getOrderList: "+orderList[i]);
    	}
    	map.put("array", orderList);
    	List<CartDTO> list = orderService.getOrderList(map);
    	System.out.println("cart: "+list.size());
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", list);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    @RequestMapping(value="/kakaoPay", method=RequestMethod.POST)
    public String kakaoPay(@ModelAttribute OrderDTO orderDTO) {
    	System.out.println(orderDTO.getPartner_order_id());
    	System.out.println(orderDTO.getPartner_user_id());
    	System.out.println(orderDTO.getItem_name());
    	System.out.println(orderDTO.getTotal_amount());
//    	System.out.println(orderDTO.getOrderEmail());
//    	redirect.addAttribute("orderDTO", orderDTO);
    	return "redirect:"+orderService.kakaoPayReady(orderDTO);
//    	return "asd";
    }
    @RequestMapping(value="/kakaoPaySuccess", method=RequestMethod.POST)
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	model.addAttribute("info", orderService.kakaoPayInfo(pg_token));
    }
    
}
