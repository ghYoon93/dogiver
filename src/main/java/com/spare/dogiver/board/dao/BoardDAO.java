package com.spare.dogiver.board.dao;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.board.dto.BoardDTO;

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


	public List<BoardDTO> getReply(int bd_seq);

	public void re_write(BoardDTO boardDTO);

	public List<BoardDTO> getReBoard(String brd_seq);

	public List<BoardDTO> getReBoard_before(String brd_seq);

	public List<BoardDTO> getReBoard_after(String brd_seq);

	public void reply_delete(String re_seq);

	public BoardDTO getUser(String brd_seq);
	
	public void boardModify(BoardDTO boardDTO);


	public List<BoardDTO> getMyboard(String nickName);

	public List<BoardDTO> getMyreply(String nickName);

	public BoardDTO getMyboardView(String brd_seq);





}
