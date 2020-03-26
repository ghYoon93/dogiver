package blood.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

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
	private Date donation_date;
	private String dog_image;
	private String dog_breed;

}
