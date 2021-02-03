package com.spare.dogiver.goods.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Goods {
    private Long id;
	private int categoryCode;
	private String name;
	private int price;
	private String thumbnail;
	private String detail;
	private int quantity;
	private String onSale;
	private int cumulativeSales;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm", timezone = "Asia/Seoul")
	private Date created_date;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm", timezone = "Asia/Seoul")
	private Date modified_date;
    
    @Builder
    public Goods(Long id, int categoryCode,
    		int goodsPrice, String name, String thumbnail, int price, String detail,
    		int quantity, String onSale) {
    	this.id = id;
    	this.categoryCode = categoryCode;
    	this.price = price;
    	this.thumbnail = thumbnail;
    	this.name = name;
    	this.detail = detail;
    	this.quantity = quantity;
    	this.onSale = onSale;
    }
    
}
