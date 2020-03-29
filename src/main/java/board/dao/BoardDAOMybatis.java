package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;


@Repository
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardWrite(BoardDTO boardDTO) {
		sqlSession.insert("boardSQL.boardWrite", boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}

	@Override
	public int getBoardTotalA() {
		return sqlSession.selectOne("boardSQL.getBoardTotalA");
	}

	@Override
	public BoardDTO getBoard(String brd_seq) {
		return sqlSession.selectOne("boardSQL.getBoard", Integer.parseInt(brd_seq));
	}

	@Override
	public int getBoardSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getBoardSearchTotalA", map);
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.getBoardSearch", map);
	}

	@Override
	public void boardDelete(int brd_seq) {
		sqlSession.delete("boardSQL.boardDelete", brd_seq);
	}

	
	
}













