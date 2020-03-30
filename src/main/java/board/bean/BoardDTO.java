package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private String brd_email;
	private String brd_nickname;
	private int brd_seq;
	private String brd_category;
	private String brd_title;
	private String brd_content;
	private int brd_hit;
	private int brd_pseq;
	private String brd_reContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date brd_logtime;

}
