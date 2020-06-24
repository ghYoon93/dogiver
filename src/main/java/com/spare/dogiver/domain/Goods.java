package com.spare.dogiver.domain;

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
    
    @Builder
    public Goods(long goodsId, long categoryCode, long goods, int goodsPrice) {
    	this.goodsId = goodsId;
    	this.categoryCode = categoryCode;
    	this.goodsPrice = goodsPrice;
    }
    
}
