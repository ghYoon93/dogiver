package goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import goods.bean.GoodsDTO;
import goods.bean.QnaDTO;
import order.bean.OrderDetailDTO;

@Repository
@Transactional
public class GoodsDAOMybatis implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDTO> getGoodsList(int pg) {
		return sqlSession.selectList("goodsSQL.getGoodsList", pg);
	}

	@Override
	public GoodsDTO getGoodsDetail(int goods_id) {
		return sqlSession.selectOne("goodsSQL.getGoodsDetail", goods_id);
	}

	@Override
	public List<GoodsDTO> getCategory(int category) {
		return sqlSession.selectList("goodsSQL.getCategory", category);
	}

	@Override
	public List<GoodsDTO> goods_lineUp(String lineUp) {
		return sqlSession.selectList("goodsSQL.goods_lineUp", lineUp);
	}

	@Override
	public int qnaWrite(Map<String, String> map) {
		return sqlSession.insert("goodsSQL.qnaWrite", map);
	}

	@Override
	public List<QnaDTO> getGoodsQnaList(int goods_id) {
		return sqlSession.selectList("goodsSQL.getGoodsQnaList", goods_id);
	}

	@Override
	public void reviewWrite(QnaDTO qnaDTO) {
		sqlSession.insert("goodsSQL.reviewWrite", qnaDTO);		
	}

	@Override
	public List<QnaDTO> getGoodsReviewList(int goods_id) {
		return sqlSession.selectList("goodsSQL.getGoodsReviewList", goods_id);
	}

	@Override
	public void writeReply(Map<String, String> map) {
		sqlSession.insert("goodsSQL.writeReply", map);
	}

	@Override
	public void updateAmt(OrderDetailDTO orderDetailDTO) {
		sqlSession.update("goodsSQL.updateAmt", orderDetailDTO);
		
	}

}
