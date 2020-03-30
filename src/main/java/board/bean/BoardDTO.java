package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private int brd_seq;
	private String brd_category;
	private String brd_title;
	private String brd_content;
	private int brd_hit;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date brd_logtime;

}
