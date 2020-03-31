package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public void boardWrite(BoardDTO boardDTO) {
		boardDTO.setBrd_email((String) session.getAttribute("memEmail"));
		boardDTO.setBrd_nickname((String) session.getAttribute("memNickName"));
		System.out.println(boardDTO.getBrd_email());
		System.out.println(boardDTO.getBrd_nickname());
		boardDAO.boardWrite(boardDTO);
	}
	
	@Override
	public void delete(int brd_seq) {
		boardDAO.boardDelete(brd_seq);
	}

	@Override
	public List<BoardDTO> getBoardList(String pg) {
		int endNum = Integer.parseInt(pg)*8;
		int startNum = endNum-7;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<BoardDTO> list = boardDAO.getBoardList(map);

		return list;
	}
	
	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*8;
		int startNum = endNum-7;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BoardDTO> list = boardDAO.getBoardSearch(map);
		
		return list;
	}
	
	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getBoardTotalA();//珥앷��닔
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(8);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}
	
	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		
		int totalA = boardDAO.getBoardSearchTotalA(map);//珥앷��닔
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML();
		
		return boardPaging;
	}

	@Override
	public BoardDTO getBoard(String brd_seq) {
		return boardDAO.getBoard(brd_seq);
	}
	@Override
	public List<BoardDTO> getReBoard(String brd_seq) {
		return boardDAO.getReBoard(brd_seq);
	}
	@Override
	public BoardDTO getBoardView_before(String brd_seq) {
		return boardDAO.getBoardView_before(brd_seq);
	}
	@Override
	public BoardDTO getBoardView_after(String brd_seq) {
		return boardDAO.getBoardView_after(brd_seq);
	}

	@Override
	public List<BoardDTO> getReply(int bd_seq) {
		return boardDAO.getReply(bd_seq);
	}

	@Override
	public void re_write(BoardDTO boardDTO) {
		boardDTO.setBrd_email((String) session.getAttribute("memEmail"));
		boardDTO.setBrd_nickname((String) session.getAttribute("memNickName"));
		
		boardDAO.re_write(boardDTO);
		
	}

	@Override
	public List<BoardDTO> getReBoard_before(String brd_seq) {
		return boardDAO.getReBoard_before(brd_seq);
	}

	@Override
	public List<BoardDTO> getReBoard_after(String brd_seq) {
		return boardDAO.getReBoard_after(brd_seq);
	}

	@Override
	public void reply_delete(int re_seq) {
		boardDAO.reply_delete(re_seq);
		
	}

	@Override
	public BoardDTO getUser(String brd_seq) {
		return boardDAO.getUser(brd_seq);
	}

	

}
