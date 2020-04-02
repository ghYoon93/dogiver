package order.bean;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderListDTO {
    private String order_id;
    private String order_status;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
    private Date order_date;
    private String goods_id;
    private String goods_thumbnail;
    private String goods_name;
    private int goods_count;
    private int total_price;
    private int order_amount;
}
