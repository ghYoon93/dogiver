package com.spare.dogiver.web.dto;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class GoodsDTO {
	private int id;
	private int categoryCode;
	private String name;
	private int price;
	private String thumbnail;
	private String detail;
	private int quantity;
	private int cumulativeSales;
	private String onSale;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm", timezone = "Asia/Seoul")
	private Date createdDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm", timezone = "Asia/Seoul")
	private Date modifiedDate;

}