package com.spare.dogiver.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class KakaoPayReadyDTO {
	private String tid, next_redirect_pc_url;
	private Date created_at;
}
