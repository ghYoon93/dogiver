package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	public void boardWrite(BoardDTO boardDTO);

	public void delete(int brd_seq);
	
	public List<BoardDTO> getBoardList(String pg);

	public BoardPaging boardPaging(String pg);

	public BoardPaging boardPaging(Map<String, String> map);
	
	public BoardDTO getBoard(String brd_seq);
	
	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public BoardDTO getBoardView_before(String brd_seq);

	public BoardDTO getBoardView_after(String brd_seq);

	public List<BoardDTO> getReply(int bd_seq);

	public void re_write(BoardDTO boardDTO);

	public List<BoardDTO> getReBoard(String brd_seq);


}
