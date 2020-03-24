package board.dao;

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
		System.out.println("DDD");
		sqlSession.insert("boardSQL.boardWrite", boardDTO);
	}
	
	
}













