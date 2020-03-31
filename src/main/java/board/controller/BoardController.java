package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		System.out.println("확인중 ㅋㅋㅋ");
		System.out.println(boardDTO);
		boardService.boardWrite(boardDTO);
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
		
		//페이징 처리
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
	public String boardView(@RequestParam String brd_seq,
							@RequestParam(required=false, defaultValue="1") String pg,
							Model model, HttpSession session) {
		
		model.addAttribute("brd_seq", brd_seq);
		model.addAttribute("pg", pg);
		
		return "/board/boardView";
	}
	
	@RequestMapping(value="getBoardView", method=RequestMethod.POST)
	public ModelAndView getBoardView( @RequestParam String brd_seq, @RequestParam(required=false, defaultValue="1") String pg,
									HttpSession session) {
		System.out.println("겟보드뷰 오는지 확인");
		BoardDTO boardDTO = boardService.getBoard(brd_seq);
		System.out.println(brd_seq+"입니다");
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
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
		
		//map안에는 pg,searchoption,keyword가 들어와 있따.
		List<BoardDTO> list = boardService.getBoardSearch(map);//->서브시 ->마이바티스 ->멥퍼 다시 돌아옴 
		
		//페이징 처리
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
	
	
	@RequestMapping(value = "reply_write", method = RequestMethod.POST)
	public void reply_write(BoardDTO boardDTO, @RequestParam String brd_seq) {
		System.out.println("들어오는지 확인 "+boardDTO);
		boardService.reply_write(boardDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "myboard", method = RequestMethod.GET)
	public String myboard() {
		return "/my/myboard";
	}
	
	@RequestMapping(value = "getMyboard", method = RequestMethod.POST)
	public ModelAndView getMyboard(HttpSession session) {
		String nickName = (String) session.getAttribute("memNickName");
		List<BoardDTO> list = boardService.getMyboard(nickName);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "getMyreply", method = RequestMethod.POST)
	public ModelAndView getMyreply(HttpSession session) {
		String nickName = (String) session.getAttribute("memNickName");
		List<BoardDTO> list = boardService.getMyreply(nickName);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

}
