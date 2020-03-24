package contact.bean;

import java.util.Date;


import lombok.Data;

@Data
public class ContactDTO {
	private int seq;
	private String name;
	private String email;
	private String phone;
	private String subject;
	private String content;
	private Date logtime;


}
