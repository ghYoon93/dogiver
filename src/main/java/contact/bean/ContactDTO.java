package contact.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ContactDTO {
	private int seq;
	private String name;
	private String email;
	private String phone;
	private String subject;
	private String content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;


}
