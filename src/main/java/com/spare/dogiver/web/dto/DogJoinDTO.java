package com.spare.dogiver.web.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class DogJoinDTO {
	private int dog_id;
	private String dog_name;
	private int dog_age;
	private String dog_breed;
	private double dog_weight;
	private String dog_bloodType;
	private String apply_status;
	private String email;

}
