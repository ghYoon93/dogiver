package com.spare.dogiver.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spare.dogiver.service.cart.CartService;
import com.spare.dogiver.service.cart.CartServiceImpl;
import com.spare.dogiver.service.order.OrderService;
import com.spare.dogiver.service.order.OrderServiceImpl;
import com.spare.dogiver.web.dto.CartResponseDto;
import com.spare.dogiver.web.dto.CheckoutRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class IndexController {
	private final CartService cartService;
	private final OrderService orderSerivce;
	
    @GetMapping("/")
    public String index() {
    	return "index";
    }
    
    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
    	String email = (String)session.getAttribute("memEmail");
    	model.addAttribute("cart", cartService.getCart(email));
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
