package order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
    @RequestMapping("/dognor/order/cart.jsp")
    public String cart() {
    	return "cart.jsp";
    }
}
