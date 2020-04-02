package order.bean;

import lombok.Data;

@Data
public class OrderDetailDTO {
    private String partner_order_id;
    private  int order_goods_id;
    private String goods_count; 
    private String total_price;
}
