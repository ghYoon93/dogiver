package goods.service;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.QnaDTO;
import order.bean.OrderDetailDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String pg);

	public GoodsDTO getGoodsDetail(String goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(String lineUp);

	public int qnaWrite(Map<String, String> map);

	public List<QnaDTO> getGoodsQnaList(String goods_id);

	public void reviewWrite(QnaDTO qnaDTO);

	public List<QnaDTO> getGoodsReviewList(String goods_id);

	public void writeReply(Map<String, String> map);


	public void updateAmt(OrderDetailDTO orderDetailDTO);
	public int goodsInsert(GoodsDTO goodsDTO);

	public GoodsDTO goodsModify(GoodsDTO goodsDTO);


}
