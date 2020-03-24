package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.bean.BoardDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "boardTableForm", method = RequestMethod.GET)
	public String boardTableForm() {
		return "boardTableForm";
	}

	@RequestMapping(value = "boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "boardWriteForm";
	}

	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardDTO boardDTO) {
		System.out.println(boardDTO);
		System.out.println("AAAA");
		boardService.boardWrite(boardDTO);
		System.out.println("BBB");
		return "boardTableForm";

	}

}
