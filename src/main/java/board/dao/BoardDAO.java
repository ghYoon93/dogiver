package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public void boardWrite(BoardDTO boardDTO);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public int getBoardTotalA();

	public BoardDTO getBoard(String brd_seq);

	public int getBoardSearchTotalA(Map<String, String> map);

	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public void boardDelete(int brd_seq);

	public BoardDTO getBoardView_before(String brd_seq);

	public BoardDTO getBoardView_after(String brd_seq);




}
