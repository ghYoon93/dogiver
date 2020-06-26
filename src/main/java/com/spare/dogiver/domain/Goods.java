package com.spare.dogiver.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Goods {
    private long goodsId;
    private long categoryCode;
    
    private String goodsName;
    private int goodsPrice;
    private String goodsThumbnail;
    private String goodsDetail;
    private int goodsAmt;
    private String salesYn;
    private int goodsCumSales;
    private Date goodsDate;
    
    @Builder
    public Goods(long goodsId, long categoryCode, long goods, 
    		int goodsPrice, String goodsThumbnail, String goodsDetail,
    		int goodsAmt, String salesYn) {
    	this.goodsId = goodsId;
    	this.categoryCode = categoryCode;
    	this.goodsPrice = goodsPrice;
    	this.goodsThumbnail = goodsThumbnail;
    	this.goodsDetail = goodsDetail;
    	this.goodsAmt = goodsAmt;
    	this.salesYn = salesYn;
    }
    
}
