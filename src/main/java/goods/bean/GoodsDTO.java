package goods.bean;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsDTO {
	private double goods_id;
	private double category_code;
	private String goods_name;
	private int goods_price;
	private Date sysdate;
	private String goods_thumbnail;
	private int goods_amt;
	private String sales_yn;
	private String goods_detail;

}
