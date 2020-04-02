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
import org.springframework.web.bind.annotation.ResponseBody;
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
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("role", session.getAttribute("role"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
//	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
//	public ModelAndView getBoardList(
//			@RequestParam(required=false, defaultValue="1") String pg,
//			HttpSession session) {
//		List<BoardDTO> list = boardService.getBoardList(pg);
//		
//		//페이징 처리
//		BoardPaging boardPaging = boardService.boardPaging(pg);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("pg", pg);
//		mav.addObject("list", list);
//		mav.addObject("memEmail", session.getAttribute("memEmail"));
//		mav.addObject("boardPaging", boardPaging);
//		mav.setViewName("jsonView");
//		return mav;
//	}
	
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
		mav.addObject("role", session.getAttribute("role"));
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("list", list);//리스트에는 댓글의 내용들이 들어있다.
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="getBoardView_before", method=RequestMethod.POST)
	public ModelAndView getBoardView_before( @RequestParam String brd_seq, 
											HttpSession session) {
		BoardDTO boardDTO = boardService.getBoardView_before(brd_seq);
		List<BoardDTO> list = boardService.getReBoard_before(brd_seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("role", session.getAttribute("role"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="getBoardView_after", method=RequestMethod.POST)
	public ModelAndView getBoardView_after( @RequestParam String brd_seq, 
											HttpSession session) {
		BoardDTO boardDTO = boardService.getBoardView_after(brd_seq);
		List<BoardDTO> list = boardService.getReBoard_after(brd_seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.addObject("role", session.getAttribute("role"));
		mav.addObject("memNickName", session.getAttribute("memNickName"));
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("list", list);
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
	@ResponseBody
	public void boardDelete(int brd_seq) {
		boardService.delete(brd_seq);
	}
	
	
	@RequestMapping(value = "re_write", method = RequestMethod.POST)
	@ResponseBody
	public void reply_write(BoardDTO boardDTO, @RequestParam String brd_seq) {
		boardService.re_write(boardDTO);
	}

	@RequestMapping(value="reply_delete", method= RequestMethod.POST)
	@ResponseBody
	public void reply_delete(@RequestParam String re_seq) {
		boardService.reply_delete(re_seq);
		//System.out.println(re_seq);
	}
	
	@RequestMapping(value = "boardModifyForm", method = RequestMethod.GET)
	public String modifyForm(@RequestParam String brd_seq, Model model) {
		BoardDTO boardDTO = boardService.getUser(brd_seq);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("brd_seq", brd_seq);
		return "boardModifyForm";
	}
	
	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	public void boardModify(@RequestParam String brd_seq, BoardDTO boardDTO) {
		boardService.boardModify(boardDTO);
		System.out.println(boardDTO);
		
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
	
	@RequestMapping(value = "getMyboardView", method = RequestMethod.POST)
	public ModelAndView getMyboardView(@RequestParam String brd_seq) {
		BoardDTO boardDTO = boardService.getMyboardView(brd_seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("jsonView");
		return mav;
	}

}
