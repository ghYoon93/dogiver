package goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.GoodsDTO;
import goods.bean.QnaDTO;
import goods.dao.GoodsDAO;
import order.bean.OrderDetailDTO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	private String lineUp;
	

	@Override
	public List<GoodsDTO> getGoodsList(String pg) {
		return goodsDAO.getGoodsList(Integer.parseInt(pg));
	}

	@Override
	public GoodsDTO getGoodsDetail(String goods_id) {
		return goodsDAO.getGoodsDetail(Integer.parseInt(goods_id));
	}

	@Override
	public List<GoodsDTO> getCategory(int category) {
		return goodsDAO.getCategory(category);
	}

	@Override
	public List<GoodsDTO> goods_lineUp(Map<String, Integer> map) {
		System.out.println(map);
		return goodsDAO.goods_lineUp(map);
	}

	@Override
	public int qnaWrite(Map<String, String> map) {
		return goodsDAO.qnaWrite(map);
		
	}

	@Override
	public List<QnaDTO> getGoodsQnaList(String goods_id) {
		System.out.println("serviceImpl:"+goods_id);
		return goodsDAO.getGoodsQnaList(Integer.parseInt(goods_id));
	}

	@Override
	public void reviewWrite(QnaDTO qnaDTO) {
		goodsDAO.reviewWrite(qnaDTO);
	}

	@Override
	public List<QnaDTO> getGoodsReviewList(String goods_id) {
		System.out.println(goods_id);
		return goodsDAO.getGoodsReviewList(Integer.parseInt(goods_id));
	}

	@Override
	public void writeReply(Map<String, String> map) {
		goodsDAO.writeReply(map);
	}

	@Override
	public void updateAmt(OrderDetailDTO orderDetailDTO) {
		goodsDAO.updateAmt(orderDetailDTO);
		
	}

	@Override
	public int goodsInsert(GoodsDTO goodsDTO) {
		return goodsDAO.goodsInsert(goodsDTO);
	}

	@Override
	public GoodsDTO goodsModify(GoodsDTO goodsDTO) {
		return goodsDAO.goodsModify(goodsDTO);
	}
	@Override
	public List<QnaDTO> replyList(String bo_seq) {
		return goodsDAO.replyList(Integer.parseInt(bo_seq));
	}

	@Override
	public QnaDTO reviewView(String bo_seq) {
		return goodsDAO.reviewView(Integer.parseInt(bo_seq));
	}

	@Override
	public QnaDTO reviewUpdateWin(String bo_seq) {
		return goodsDAO.reviewUpdateWin(Integer.parseInt(bo_seq));
	}

	@Override
	public void reviewUpdate(QnaDTO qnaDTO) {
		goodsDAO.reviewUpdate(qnaDTO);
	}

	@Override
	public void reviewDelete(String bo_seq) {
		goodsDAO.reviewDelete(Integer.parseInt(bo_seq));
	}

	@Override
	public int getGoodsId(int category_code) {
		return goodsDAO.getGoodsId(category_code);
	}


}
