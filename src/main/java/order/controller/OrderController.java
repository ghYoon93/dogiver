package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    	System.out.println("장바구니 개수: "+ list.size());
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list",list);
//    	mav.addObject("memEmail", (String)session.getAttribute("memEmail"));
    	mav.setViewName("jsonView");
    	return mav;
    	
    }
}
