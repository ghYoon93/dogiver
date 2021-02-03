package com.spare.dogiver.goods.dao;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.goods.domain.Goods;
import com.spare.dogiver.goods.dto.GoodsDTO;
import com.spare.dogiver.order.dto.OrderDetailDTO;
import com.spare.dogiver.goods.dto.QnaDTO;

public interface GoodsDAO {

	public List<GoodsDTO> getGoodsList(int pg);

	public GoodsDTO getGoodsDetail(Long id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(Map<String, Integer> map);

	public int qnaWrite(Map<String, String> map);

	public List<QnaDTO> getGoodsQnaList(Long id);

	public void reviewWrite(QnaDTO qnaDTO);

	public List<QnaDTO> getGoodsReviewList(Long id);

	public void writeReply(Map<String, String> map);

	public void updateAmt(OrderDetailDTO orderDetailDTO);
	
	public int goodsInsert(GoodsDTO goodsDTO);

	public GoodsDTO goodsModify(GoodsDTO goodsDTO);
	public List<QnaDTO> replyList(int bo_seq);

	public QnaDTO reviewView(int bo_seq);

	public QnaDTO reviewUpdateWin(int bo_seq);

	public void reviewUpdate(QnaDTO qnaDTO);

	public void reviewDelete(int bo_seq);

	public int getGoodsId(int category_code);
	
	public Goods findGoodsById(Long id);


}
