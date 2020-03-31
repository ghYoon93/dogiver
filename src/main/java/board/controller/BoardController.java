package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value = "boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "boardWriteForm";
	}
	
	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public void boardWrite(BoardDTO boardDTO) {
		boardService.boardWrite(boardDTO);
	}	
		
	@RequestMapping(value = "re_write", method = RequestMethod.POST)
	public void re_write(BoardDTO boardDTO, @RequestParam(required=false, defaultValue="1") String bre_seq ) {
		boardDTO.setBrd_seq(Integer.parseInt(bre_seq));
		boardService.re_write(boardDTO);
		
	}
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg,
							Model model) {
		model.addAttribute("pg", pg);
		return "boardList";
	}
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(
			@RequestParam(required=false, defaultValue="1") String pg,
			HttpSession session) {
		List<BoardDTO> list = boardService.getBoardList(pg);
		
		
		BoardPaging boardPaging = boardService.boardPaging(pg);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("memId", session.getAttribute("memId"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public String boardList(@RequestParam String brd_seq,
							@RequestParam(required=false, defaultValue="1") String pg,
							Model model) {
		model.addAttribute("brd_seq", brd_seq);
		model.addAttribute("pg", pg);
		return "boardView";
	}
	
	
	@RequestMapping(value="getBoardView", method=RequestMethod.POST)
	public ModelAndView getBoardView( @RequestParam String brd_seq, @RequestParam(required=false, defaultValue="1") String pg,
									HttpSession session) {

		BoardDTO boardDTO = boardService.getBoard(brd_seq);
		List<BoardDTO> list = boardService.getReBoard(brd_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="getBoardView_before", method=RequestMethod.POST)
	public ModelAndView getBoardView_before( @RequestParam String brd_seq, 
											HttpSession session) {
		BoardDTO boardDTO = boardService.getBoardView_before(brd_seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="getBoardView_after", method=RequestMethod.POST)
	public ModelAndView getBoardView_after( @RequestParam String brd_seq, 
											HttpSession session) {
		BoardDTO boardDTO = boardService.getBoardView_after(brd_seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="getBoardSearch", method=RequestMethod.POST)
	public ModelAndView getBoardSearch(@RequestParam Map<String, String> map,
										HttpSession session) {
		
		List<BoardDTO> list = boardService.getBoardSearch(map);
		BoardPaging boardPaging = boardService.boardPaging(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("memId", session.getAttribute("memId"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	public void boardDelete(int brd_seq) {
		boardService.delete(brd_seq);
	}
	
	

}
