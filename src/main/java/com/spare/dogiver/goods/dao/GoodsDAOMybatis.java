package com.spare.dogiver.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.goods.dto.GoodsDTO;
import com.spare.dogiver.goods.dto.QnaDTO;
import com.spare.dogiver.order.dto.OrderDetailDTO;

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
	public GoodsDTO getGoodsDetail(Long id) {
		return sqlSession.selectOne("goodsSQL.getGoodsDetail", id);
	}

	@Override
	public List<GoodsDTO> getCategory(int category) {
		return sqlSession.selectList("goodsSQL.getCategory", category);
	}

	@Override
	public List<GoodsDTO> goods_lineUp(Map<String, Integer> map) {
		System.out.println(map);
		return sqlSession.selectList("goodsSQL.goods_lineUp", map);
	}

	@Override
	public int qnaWrite(Map<String, String> map) {
		System.out.println(map);
		return sqlSession.insert("goodsSQL.qnaWrite", map);
	}

	@Override
	public List<QnaDTO> getGoodsQnaList(Long id) {
		return sqlSession.selectList("goodsSQL.getGoodsQnaList", id);
	}

	@Override
	public void reviewWrite(QnaDTO qnaDTO) {
		sqlSession.insert("goodsSQL.reviewWrite", qnaDTO);		
	}

	@Override
	public List<QnaDTO> getGoodsReviewList(Long id) {
		return sqlSession.selectList("goodsSQL.getGoodsReviewList", id);
	}

	@Override
	public void writeReply(Map<String, String> map) {
		sqlSession.insert("goodsSQL.writeReply", map);
	}

	@Override
	public void updateAmt(OrderDetailDTO orderDetailDTO) {
		sqlSession.update("goodsSQL.updateAmt", orderDetailDTO);
	}
	@Override
	public int goodsInsert(GoodsDTO goodsDTO) {
		return sqlSession.insert("goodsSQL.goodsInsert", goodsDTO);
	}

	@Override
	public GoodsDTO goodsModify(GoodsDTO goodsDTO) {
		int su = sqlSession.update("goodsSQL.goodsModify", goodsDTO);
		
		if(su==1) {
			return sqlSession.selectOne("goodsSQL.getGoodsDetail", goodsDTO.getId());
		}else {
			return goodsDTO;
		}
	}
		@Override
	public List<QnaDTO> replyList(int bo_seq) {
		return sqlSession.selectList("goodsSQL.replyList", bo_seq);
	}

	@Override
	public QnaDTO reviewView(int bo_seq) {
		return sqlSession.selectOne("goodsSQL.reviewView", bo_seq);
	}

	@Override
	public QnaDTO reviewUpdateWin(int bo_seq) {
		return sqlSession.selectOne("goodsSQL.reviewUpdateWin", bo_seq);
	}

	@Override
	public void reviewUpdate(QnaDTO qnaDTO) {
		sqlSession.insert("goodsSQL.reviewUpdate", qnaDTO);
	}

	@Override
	public void reviewDelete(int bo_seq) {
		sqlSession.delete("goodsSQL.reviewDelete", bo_seq);
	}

	@Override
	public int getGoodsId(int category_code) {
		System.out.println(category_code);
		return sqlSession.selectOne("goodsSQL.getGoodsId", category_code);
	}

	@Override
	public Goods findGoodsById(Long id) {
		return sqlSession.selectOne("goodsSQL.findGoodsById", id);
	}

}
