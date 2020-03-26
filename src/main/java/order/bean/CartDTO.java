package order.bean;

import lombok.Data;

@Data
public class CartDTO {
	private int cart_id;
	private String email;
	private int goods_id;
	private String goods_name;
	private String goods_thumbnail;
	private int goods_price;
	private int cart_cnt;
	private int total_price;
}
