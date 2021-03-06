package com.spare.dogiver;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spare.dogiver.order.service.OrderService;
import com.spare.dogiver.cart.dto.CartResponseDto;
import com.spare.dogiver.order.dto.CheckoutRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class IndexController {
	private final OrderService orderSerivce;
	
    @GetMapping("/")
    public String index() {
    	System.out.println("dd");
    	return "index";
    }
    
    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
    	return "/cart/cart";
    }
    
    @GetMapping("/cart/checkout")
    public String checkoutDriectCart() {
    	return "/order/order";
    }
    
    @GetMapping("/direct/checkout")
    public String checkoutDirect(
    		HttpSession session,
    		Model model, 
    		@RequestParam("goods_id") long goodsId, 
    		@RequestParam("quantity") int quantity
    		) {
    	
    	String email = (String)session.getAttribute("memEmail");
    	CheckoutRequestDto request = new CheckoutRequestDto();
    	model.addAttribute("checkout", orderSerivce.getCheckout(email, request));
    	return "/order/order";
    }
}
