package com.spare.dogiver.web.dto;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class GoodsDTO {
	private int goods_id;
	private int category_code;
	private String goods_name;
	private int goods_price;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm", timezone = "Asia/Seoul")
	private Date goods_date;
	private String goods_thumbnail;
	private int goods_amt;
	private String sales_yn;
	private String goods_detail;
	private int goods_cum_sales;

}