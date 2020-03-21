package order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
    @RequestMapping(value="order/order", method=RequestMethod.GET)
    public String order() {
    	return "order"; //이동할 view의 이름 (.jsp)
    }
}
