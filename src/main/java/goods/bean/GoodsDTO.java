package goods.bean;


import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class GoodsDTO {
	private int goods_id;
	private int category_code;
	private String goods_name;
	private int goods_price;
	private Date goods_date;
	private String goods_thumbnail;
	private int goods_amt;
	private String sales_yn;
	private String goods_detail;

}