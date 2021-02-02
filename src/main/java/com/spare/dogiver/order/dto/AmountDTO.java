package com.spare.dogiver.order.dto;

import lombok.Data;

@Data
public class AmountDTO {
	private Integer total, tax_free, vat, point, discount;
}
