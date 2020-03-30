package goods.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnaDTO {
	private String email;
	private int goods_id;
	private String category_code;
	private String title;
	private String text_content;
	private String reply;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date board_date;
	private String image;
	private String nickname;
}
