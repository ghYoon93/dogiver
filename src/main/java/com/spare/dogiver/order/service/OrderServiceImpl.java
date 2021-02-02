package com.spare.dogiver.order.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.spare.dogiver.domain.Goods;
import com.spare.dogiver.member.domain.Member;
import com.spare.dogiver.persistence.goods.GoodsDAO;
import com.spare.dogiver.member.dao.MemberDAO;
import com.spare.dogiver.order.dao.OrderDAO;
import com.spare.dogiver.cart.dto.CartDTO;
import com.spare.dogiver.order.dto.CheckoutRequestDto;
import com.spare.dogiver.order.dto.CheckoutResponseDto;
import com.spare.dogiver.order.dto.KakaoPayApprovalDTO;
import com.spare.dogiver.order.dto.KakaoPayReadyDTO;
import com.spare.dogiver.order.dto.OrderDTO;
import com.spare.dogiver.order.dto.OrderDetailDTO;
import com.spare.dogiver.order.dto.OrderListDTO;
import com.spare.dogiver.order.dto.OrderStatusDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {
	private final MemberDAO memberDao;
	private final GoodsDAO goodsDao;
	
	@Autowired
	private OrderDAO orderDAO;
	private OrderDTO orderDTO;
	private KakaoPayReadyDTO kakaoPayReadyDTO;
	private KakaoPayApprovalDTO kakaoPayApprovalDTO;
	
	@Override
	public void insertCart(Map<String, String> map) {
		orderDAO.insertCart(map);
		
	}
	@Override
	public List<CartDTO> getCart(String memEmail) {
		List<CartDTO> list = orderDAO.getCart(memEmail);
		return list;
	}
	@Override
	public void updateCart(Map<String, String> map) {
		orderDAO.updateCart(map);
	}
	@Override
	public void deleteCart(Map<String, String[]> map) {
		orderDAO.deleteCart(map);
		
	}
	@Override
	public CartDTO searchCart(Map<String, String> map) {
		CartDTO cartDTO = new CartDTO(); 
		cartDTO = orderDAO.searchCart(map);
		return cartDTO;
	}
	@Override
	public List<CartDTO> getOrderList(Map<String, String[]> map) {		
		return orderDAO.getOrderList(map);
	}
	
	@Override
	public String kakaoPayReady(OrderDTO orderDTO) {
		this.orderDTO = orderDTO;
		String host = "https://kapi.kakao.com";
		RestTemplate restTemplate = new RestTemplate();
		System.out.println("service 63:");
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "7ef51b7217f181a01f0af46f087ad590"); 
		headers.add("Accept", "application/x-www-form-urlencoded;charset=utf-8"); 
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderDTO.getPartner_order_id());
        params.add("partner_user_id", orderDTO.getPartner_user_id());
        params.add("item_name", orderDTO.getItem_name());
        params.add("quantity", orderDTO.getQuantity());
        params.add("total_amount", orderDTO.getTotal_amount());
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8080/dogiver/order/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/dogiver/order/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/dogiver/order/kakaoPaySuccessFail");
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
        	System.out.println("service 83: ");
            kakaoPayReadyDTO = restTemplate.postForObject(new URI(host + "/v1/payment/ready"), body, KakaoPayReadyDTO.class);
            return kakaoPayReadyDTO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "/order/order";
	}
	
	@Override
	public KakaoPayApprovalDTO kakaoPayInfo(String pg_token) {
		System.out.println("kakaoPayInfo");
		String host = "https://kapi.kakao.com";
        RestTemplate restTemplate = new RestTemplate();
        System.out.println("service 100");
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "7ef51b7217f181a01f0af46f087ad590");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        System.out.println("service 1066");
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        System.out.println("Tid~service109: "+kakaoPayReadyDTO.getTid());
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("partner_order_id", orderDTO.getPartner_order_id());
        params.add("partner_user_id", orderDTO.getPartner_user_id());
        params.add("pg_token", pg_token);
        params.add("total_amount", orderDTO.getTotal_amount());
        System.out.println("service 116");
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
        	System.out.println("try");
            kakaoPayApprovalDTO = restTemplate.postForObject(new URI(host + "/v1/payment/approve"), body, KakaoPayApprovalDTO.class);
            System.out.println(kakaoPayApprovalDTO);
            System.out.println("try end 123");
            
            return kakaoPayApprovalDTO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        System.out.println("service 132");
        return null;
    }
	
	@Override
	public void insertOrderDetail(OrderDetailDTO orderDetailDTO) {
		orderDAO.insertOrderDetail(orderDetailDTO);
		
	}
	@Override
	public void insertOrder(OrderDTO orderDTO) {
		orderDAO.insertOrder(orderDTO);
		
	}
	@Override
	public List<OrderListDTO> getMyOrder(String memEmail) {
		return orderDAO.getMyOrder(memEmail);
	}
	@Override
	public List<OrderStatusDTO> getStatus(String memEmail) {
		return orderDAO.getStatus(memEmail);
	}
	@Override
	public void cancelOrder(String order_id) {
		orderDAO.cancelOrder(order_id);
	}
	@Override
	public int chkOrder(Map<String, String> map) {
		return orderDAO.chkOrder(map);
	}
	@Override
	public CheckoutResponseDto getCheckout(String email, CheckoutRequestDto request) {
		Member member = memberDao.find(email);
		Goods goods = goodsDao.findGoodsById(request.getGoodsId());
		CheckoutResponseDto response = new CheckoutResponseDto(goods, member, request.getQuantity()); 
		return response;
	}

}
