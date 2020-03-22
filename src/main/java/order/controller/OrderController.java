package order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="order")
public class OrderController {
    @RequestMapping(value="order", method=RequestMethod.GET)
    public String order() {
    	return "/order/order"; //이동할 view의 이름 (.jsp)
    }
}
