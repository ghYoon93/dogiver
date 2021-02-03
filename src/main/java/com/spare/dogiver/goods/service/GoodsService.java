package com.spare.dogiver.goods.service;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.goods.dto.GoodsDTO;
import com.spare.dogiver.order.dto.OrderDetailDTO;
import com.spare.dogiver.goods.dto.QnaDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String pg);

	public GoodsDTO getGoodsDetail(String goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(Map<String, Integer> map);

	public int qnaWrite(Map<String, String> map);

	public List<QnaDTO> getGoodsQnaList(String goods_id);

	public void reviewWrite(QnaDTO qnaDTO);

	public List<QnaDTO> getGoodsReviewList(String goods_id);

	public void writeReply(Map<String, String> map);

	public List<QnaDTO> replyList(String bo_seq);

	public QnaDTO reviewView(String seq);

	public QnaDTO reviewUpdateWin(String bo_seq);

	public void reviewUpdate(QnaDTO qnaDTO);

	public void reviewDelete(String bo_seq);


	public void updateAmt(OrderDetailDTO orderDetailDTO);
	public int goodsInsert(GoodsDTO goodsDTO);

	public GoodsDTO goodsModify(GoodsDTO goodsDTO);

	public int getGoodsId(int category_code);


}
