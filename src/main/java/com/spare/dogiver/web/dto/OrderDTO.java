package com.spare.dogiver.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class OrderDTO {
    private String email;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
    private Date order_date;
    private String orderName;
	private String aid, tid;
    private String orderCellPhone;
    private int orderZipcode;
    private String orderAddress;
    private String orderAddressSub;
    private String order_memo;
    private String order_pay;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private String total_amount;
	private String quantity;
	private String order_status;
}
