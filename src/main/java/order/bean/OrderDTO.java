package order.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
public class OrderDTO {
//    private int order_id;
//    private String orderEmail;
//    private int goods_id;
//    private int order_cnt;
//    private Date order_date;
//    private int order_total_price;
    private String orderName;
	private String aid, tid;
    private String orderCellPhone;
    private int orderZipcode;
    private String orderAddress;
    private String orderAddressSub;
    private String order_memo;
    private String order_pay;
//    private String order_status;
//    private int delevery_code;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private String total_amount;
	private String quantity;
}
