package goods.service;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String pg);

	public GoodsDTO getGoodsDetail(String goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(String lineUp);

	public int qnaWrite(Map<String, String> map);

}
