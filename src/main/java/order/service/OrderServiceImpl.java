package order.service;

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

import order.bean.CartDTO;
import order.bean.KakaoPayApprovalDTO;
import order.bean.KakaoPayReadyDTO;
import order.bean.OrderDTO;
import order.dao.OrderDAO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
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
		String host = "https://kapi.kakao.com";
		RestTemplate restTemplate = new RestTemplate();
		
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
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
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
		String host = "https://kapi.kakao.com";
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "KakaoAK7ef51b7217f181a01f0af46f087ad590");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalDTO = restTemplate.postForObject(new URI(host + "/v1/payment/approve"), body, KakaoPayApprovalDTO.class);
          
            return kakaoPayApprovalDTO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }

}
