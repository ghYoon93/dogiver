package com.spare.dogiver.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spare.dogiver.service.cart.CartService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class IndexController {
	private final CartService cartService;
    @GetMapping("/")
    public String index() {
    	return "index";
    }
    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
    	String email = (String)session.getAttribute("memEmail");
    	model.addAttribute("cart", cartService.findAllByEmailDesc(email));
    	return "/cart/cart";
    }
}
