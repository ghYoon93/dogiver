package blood.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class DogiverDTO {
	
	private int dog_id;
	private String dog_name;
	private int dog_age;
	private double dog_weight;
	private String description;
	private int blood_cc;
	private String dog_bloodtype;
	private String donation_date;
	private String dog_image;
	private String dog_breed;
	private String email;
	private String name;
	private int phone;
	private String apply_status;

}
