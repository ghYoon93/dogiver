package com.spare.dogiver.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spare.dogiver.goods.service.GoodsService;
import com.spare.dogiver.member.service.MemberService;
import com.spare.dogiver.order.service.OrderService;
import com.spare.dogiver.cart.dto.CartDTO;
import com.spare.dogiver.order.dto.KakaoPayApprovalDTO;
import com.spare.dogiver.member.dto.MemberDTO;
import com.spare.dogiver.order.dto.OrderDTO;
import com.spare.dogiver.order.dto.OrderDetailDTO;
import com.spare.dogiver.order.dto.OrderListDTO;
import com.spare.dogiver.order.dto.OrderStatusDTO;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("order/hello")
	public String hello() {
		return "hello";
	}
	
    @RequestMapping(value="/order/order", method=RequestMethod.GET)
    public String order(@RequestParam(required=false, defaultValue="0") String[] checkGoods,
    		            @RequestParam(required=false, defaultValue="0") int goods_id,
    		            @RequestParam(required=false, defaultValue="0") int quantity,
    		            HttpSession session,
    		            Model model) {
    	System.out.println(checkGoods.length);
    	System.out.println(goods_id);
    	System.out.println(quantity);
    	String email = (String) session.getAttribute("memEmail");
    	MemberDTO memberDTO = memberService.getMember(email);
    	model.addAttribute("memberDTO", memberDTO);
    	if(checkGoods[0].equals("0")) {
    		model.addAttribute("checkGoods", checkGoods);
    		model.addAttribute("goods_id", goods_id);
    		model.addAttribute("quantity", quantity);
    	}else {
    		model.addAttribute("checkGoods", checkGoods);
    	}
    	return "/order/order"; //이동할 view의 이름 (.jsp)
    }
    @RequestMapping(value="/order/cart", method=RequestMethod.GET)
    public String cart(HttpSession session) {
    	String email = (String) session.getAttribute("memEmail");
    	String target = "/order/cart";
    	if(email== null) target = "redirect:/login/login";
    	return target; //이동할 view의 이름 (.jsp)
    	
    }
    @RequestMapping(value="/order/getCart", method=RequestMethod.POST)
    public ModelAndView getCart(HttpSession session) {
    	String memEmail = (String)session.getAttribute("memEmail");
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("memEmail", memEmail);
    	if(memEmail!=null) {
    		List<CartDTO> list = orderService.getCart(memEmail);   		
    		mav.addObject("list",list);
    	}
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    @RequestMapping(value="/order/addCart", method=RequestMethod.GET)
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
    @RequestMapping(value="/order/updateCart", method=RequestMethod.GET)
    public String updateCart(@RequestParam String cart_id, @RequestParam String cnt) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("cart_id", cart_id);
    	map.put("cart_cnt", cnt);
    	orderService.updateCart(map);
    	return "redirect:/order/cart";
    }
    
    @RequestMapping(value="/order/deleteCart", method=RequestMethod.GET)
    public String deleteCart(@RequestParam String[] checkGoods, Model model) {
    	Map<String, String[]> map = new HashMap<String, String[]>();
    	map.put("array", checkGoods);
    	orderService.deleteCart(map);
    	return "redirect:/order/cart";
    }
    
    @RequestMapping(value="/order/getOrderList", method=RequestMethod.POST)
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
    
    @RequestMapping(value="/order/kakaoPay", method=RequestMethod.POST)
    public String kakaoPay(@ModelAttribute OrderDTO orderDTO) {
    	System.out.println(orderDTO);
//    	System.out.println(orderDTO.getOrderEmail());
//    	redirect.addAttribute("orderDTO", orderDTO);
    	return "redirect:"+orderService.kakaoPayReady(orderDTO);
    }
    @RequestMapping(value="/order/kakaoPaySuccess", method=RequestMethod.GET)
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	KakaoPayApprovalDTO kakaoPayApprovalDTO = orderService.kakaoPayInfo(pg_token);
    	System.out.println("success");
    	System.out.println(kakaoPayApprovalDTO);
    	model.addAttribute("info", kakaoPayApprovalDTO);
    	
    	return "/order/kakaoPaySuccess";
    	
    }
    @RequestMapping(value="/order/kakaoPayCancel", method=RequestMethod.GET)
    public String kakaoPayCancel() {
    	
    	return "/order/kakaoPayCancel";
    	
    }
    @RequestMapping(value="/order/insertOrder", method=RequestMethod.POST)
    public String insertOrder(@ModelAttribute OrderDTO orderDTO, 
    		                  @ModelAttribute OrderDetailDTO orderDetailDTO,
    		                  @RequestParam String[] goods_id,
    		                  @RequestParam String[] cart_cnt,
    		                  @RequestParam String[] total_price,
    		                  @RequestParam String[] checkGoods,
    		                  HttpSession session,
    		                  Model model) {
    	String email = (String) session.getAttribute("memEmail");
    	orderDTO.setEmail(email);
    	System.out.println(orderDTO);
    	if(orderDTO.getOrder_pay().equals("bank")) {
    		orderDTO.setOrder_status("입금대기");
    		System.out.println(orderDTO);
    	}else {
    		orderDTO.setOrder_status("결제완료");
    	}
    	orderService.insertOrder(orderDTO);
    	System.out.println("order 개수: "+goods_id.length);
    	List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
    	for(int i = 0; i < goods_id.length; i++) {
    		orderDetailDTO.setOrder_goods_id(Integer.parseInt(goods_id[i]));
    		orderDetailDTO.setGoods_count(cart_cnt[i]);
    		orderDetailDTO.setTotal_price(total_price[i]);
    		orderService.insertOrderDetail(orderDetailDTO);
        	goodsService.updateAmt(orderDetailDTO);
    		
    	}
    	model.addAttribute("order_id", orderDTO.getPartner_order_id());
    	Map<String, String[]> map = new HashMap<String, String[]>();
    	map.put("array", checkGoods);
    	orderService.deleteCart(map);
    	return "redirect:/order/orderComplete";
    }
    @RequestMapping(value="/order/orderComplete", method=RequestMethod.GET)
    public String orderComplete(@RequestParam String order_id) {
    	return "/order/orderComplete";
    }
    //주문 조회
    @RequestMapping(value="/my/orderList")
    public String myOrderList(HttpSession session, Model model) {
    	String memEmail = (String)session.getAttribute("memEmail");
    	if(memEmail == null ) {
    		return "redirect:/login/login"; 
    	}
    	List<OrderStatusDTO> list = orderService.getStatus(memEmail);
    	int status_wait = 0;
    	int status_paid = 0;
    	int status_ready = 0;
    	int status_deliver = 0;
    	int status_delivered = 0;
    	int status_cancel = 0;
    	int status_exchange = 0;
    	int status_return = 0;
    	for(OrderStatusDTO status:list) {
    		if(status.getOrder_status().equals("입금대기")) status_wait = status.getCount();
    		if(status.getOrder_status().equals("결제완료")) status_paid = status.getCount();
    		if(status.getOrder_status().equals("상품준비중")) status_ready = status.getCount();
    		if(status.getOrder_status().equals("배송중")) status_deliver = status.getCount();
    		if(status.getOrder_status().equals("배송완료")) status_delivered = status.getCount();
    		if(status.getOrder_status().equals("주문취소")) status_cancel = status.getCount();
    		if(status.getOrder_status().equals("교환")) status_exchange = status.getCount();
    		if(status.getOrder_status().equals("반품")) status_return = status.getCount();
    	}
    	model.addAttribute("status_wait", status_wait);
    	model.addAttribute("status_paid", status_paid);
    	model.addAttribute("status_ready", status_ready);
    	model.addAttribute("status_deliver", status_deliver);
    	model.addAttribute("status_delivered", status_delivered);
    	model.addAttribute("status_cancel", status_cancel);
    	model.addAttribute("status_exchange", status_exchange);
    	model.addAttribute("status_return", status_return);
    	return "/my/orderList";
    }
    @RequestMapping(value="/my/getMyOrder", method=RequestMethod.POST)
    public ModelAndView getMyOrder(HttpSession session) {
    	
    	String memEmail = (String)session.getAttribute("memEmail");
    	System.out.println(memEmail);
    	List<OrderListDTO> list = orderService.getMyOrder(memEmail);
    	for(OrderListDTO or:list) {
    		System.out.println(or);
    	}
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", list);
    	mav.setViewName("jsonView");
    	System.out.println("mavAdd");
    	return mav;
    }
    
    @RequestMapping(value="/order/cancelOrder", method=RequestMethod.POST)
    public void cancelOrder(@RequestParam String order_id) {
    	orderService.cancelOrder(order_id);
    }
    @RequestMapping(value="/order/chkOrder", method=RequestMethod.POST)
    public @ResponseBody int chkOrder(@RequestParam String goods_id, HttpSession session) {
    	String memEmail = (String)session.getAttribute("memEmail");
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("email", memEmail);
    	map.put("goods_id", goods_id);
    	return orderService.chkOrder(map);
    }
}
