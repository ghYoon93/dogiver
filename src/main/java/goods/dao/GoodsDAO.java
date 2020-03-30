package goods.dao;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.QnaDTO;

public interface GoodsDAO {

	public List<GoodsDTO> getGoodsList(int pg);

	public GoodsDTO getGoodsDetail(int goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(String lineUp);

	public int qnaWrite(Map<String, String> map);

	public List<QnaDTO> getGoodsQnaList(int goods_id);

	public void reviewWrite(QnaDTO qnaDTO);

	public List<QnaDTO> getGoodsReviewList(int goods_id);

	public void writeReply(QnaDTO qnaDTO);


}
