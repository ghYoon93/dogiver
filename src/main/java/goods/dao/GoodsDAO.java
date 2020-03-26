package goods.dao;

import java.util.List;

import goods.bean.GoodsDTO;

public interface GoodsDAO {

	public List<GoodsDTO> getGoodsList(int pg);

	public GoodsDTO getGoodsDetail(int goods_id);

	public List<GoodsDTO> getCategory(int category);

	public List<GoodsDTO> goods_lineUp(String lineUp);

	

}