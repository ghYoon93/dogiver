package board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void boardWrite(BoardDTO boardDTO) {
		System.out.println("GGG");
		boardDAO.boardWrite(boardDTO);
	}

	
}










