package goods.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.QnaDTO;
import order.bean.OrderDetailDTO;

public interface GoodsDAO {

	public List<GoodsDTO> getGoodsList(int pg);

	public GoodsDTO getGoodsDetail(int goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(String lineUp);

	public int qnaWrite(Map<String, String> map);

	public List<QnaDTO> getGoodsQnaList(int goods_id);

	public void reviewWrite(QnaDTO qnaDTO);

	public List<QnaDTO> getGoodsReviewList(int goods_id);

	public void writeReply(Map<String, String> map);


	public void updateAmt(OrderDetailDTO orderDetailDTO);
	
	public int goodsInsert(GoodsDTO goodsDTO);

	public GoodsDTO goodsModify(GoodsDTO goodsDTO);
	public List<QnaDTO> replyList(int bo_seq);

	public QnaDTO reviewView(int bo_seq);

	public QnaDTO reviewUpdateWin(int bo_seq);

	public void reviewUpdate(QnaDTO qnaDTO);

	public void reviewDelete(int bo_seq);


}
