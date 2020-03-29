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
		boardDAO.boardWrite(boardDTO);
	}
	@Override
	public void delete(int brd_seq) {
		boardDAO.boardDelete(brd_seq);
	}

	@Override
	public List<BoardDTO> getBoardList(String pg) {
		// 1페이지당 8개씩
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
		int totalA = boardDAO.getBoardTotalA();//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(8);
		boardPaging.setTotalA(totalA);
		//System.out.println("1페이징처리후 총 개수는"+totalA+"입니다");
		boardPaging.makePagingHTML();
		return boardPaging;
	}
	
	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		
		int totalA = boardDAO.getBoardSearchTotalA(map);//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		//System.out.println("2페이징처리후 총 개수는"+totalA+"입니다");
		boardPaging.makeSearchPagingHTML();
		
		return boardPaging;
	}

	@Override
	public BoardDTO getBoard(String brd_seq) {
		return boardDAO.getBoard(brd_seq);
	}




	

}
