package com.spare.dogiver.web;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spare.dogiver.service.cartItem.CartItemService;
import com.spare.dogiver.web.dto.CartItemSaveRequestDto;
import com.spare.dogiver.web.dto.CartSaveRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class CartItemController {
    private final CartItemService cartItemService;

	@PostMapping("/api/v1/cartItem")
    public ResponseEntity<?> save(@RequestBody CartItemSaveRequestDto cartItemSaveRequestDto,
    		HttpSession session) throws URISyntaxException {
		String email = (String) session.getAttribute("memEmail");
    	Long id = cartItemService.addCartItem(email, cartItemSaveRequestDto);
    	URI location = new URI("/api/v1/cartItem/"+id);
    	return ResponseEntity.created(location).body(id);
    }
}
